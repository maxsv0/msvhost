<?php

function instanceStop($instanceRow) {
	$serverZone = $instanceRow["server_zone"];
	$instanceName = $instanceRow["name"];

	$gcloud = 'gcloud compute instances stop "'.$instanceName.'" --zone "'.$serverZone.'"';
	$result = shell_exec($gcloud);

	return $result;
}


function instanceDelete($instanceRow) {
	$serverZone = $instanceRow["server_zone"];
	$instanceName = $instanceRow["name"];

	$gcloud = 'gcloud compute instances delete "'.$instanceName.'" --zone "'.$serverZone.'"';
	$result = shell_exec($gcloud);

	return $result;
}


function instanceReset($instanceRow) {
	$serverZone = $instanceRow["server_zone"];
	$instanceName = $instanceRow["name"];

	$gcloud = 'gcloud compute instances reset "'.$instanceName.'" --zone "'.$serverZone.'"';
	$result = shell_exec($gcloud);

	return $result;
}


function server_proccess($status = "") {
	$instancesList = array();

	$resultQuery = db_get_list(TABLE_SERVER, "`status` like '".db_escape($status)."'", "", 2);
	if ($resultQuery["ok"]) {
		$instancesList = $resultQuery["data"];
	}

	foreach ($instancesList as $item) {
		if ($item["status"] === "created") {
			server_proccess_created($item);
		} elseif ($item["status"] === "started") {
			server_proccess_started($item);
		} elseif ($item["status"] === "install") {
			server_proccess_install($item);
		} elseif ($item["status"] === "ready") {
			server_proccess_ready($item);
		} elseif ($item["status"] === "published") {
			server_proccess_published($item);
		} elseif ($item["status"] === "deleting") {
			server_proccess_deleting($item);
		}
	}


}


function server_proccess_deleting($server) {
	if ($server["status"] !== "deleting") return false;
	echo $server["name"]."..";

	instanceDelete($server);
	db_delete(TABLE_SERVER, " `id` = '".(int)$server["id"]."'");
	db_delete(TABLE_INSTANCE, " `ip` = '".$server["ip"]."'");

	echo "done\n";
}


function server_proccess_published($server) {
	if ($server["status"] !== "published") return false;
	echo $server["name"]."..";

	// send email to admin
	//
	$resultQuery = db_get(TABLE_INSTANCE, " `ip` = '".$server["ip"]."' and `status` like 'published'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		$resultQueryStatus = db_get(TABLE_INSTANCE_STATUS, " `ip` = '".$server["ip"]."'");

		if ($resultQueryStatus["ok"] && !empty($resultQueryStatus["data"])) {
			$db_root_password = $db_password = $ftp_password = $admin_password = "";

			$instance = $resultQuery["data"];
			$log = explode("\n", $instance["log_install"]);
			foreach ($log as $line) {
				if (strpos($line, "Master Password: ") === 0) {
					list(,$db_root_password) = explode(": ", $line);
				}
				if (strpos($line, "FTP Password: ") === 0) {
					list(,$ftp_password) = explode(": ", $line);
				}
				if (strpos($line, "Mysql MSV Password: ") === 0) {
					list(,$db_password) = explode(": ", $line);
				}
				if (strpos($line, "Admin Password: ") === 0) {
					list(,$admin_password) = explode(": ", $line);
				}
			}

			$admin_email = $server["admin_email"];
			$db_login = "msv";
			$ftp_login = "devftp";

			$userinfo = array(
				"admin_email" => $admin_email,
				"admin_password" => $admin_password,
				"url" => $server["url"],
				"domain" => $server["domain"],
				"ip" => $server["ip"],
				"ftp_login" => $ftp_login,
				"ftp_password" => $ftp_password,
				"db_login" => $db_login,
				"db_password" => $db_password,
				"db_root_password" => $db_root_password,
			);

			msv_email_template("website_ready", $admin_email, $userinfo);
			msv_email_template("website_ready_notify", "max@msvhost.com", $userinfo);

			db_update(TABLE_SERVER, "status", "'online'", " id = '".$server["id"]."'");
			db_update(TABLE_INSTANCE, "status", "'online'", " id = '".$instance["id"]."'");
		} else {
			echo "skip\n";
		}
	}
}


function server_proccess_ready($server) {
	if ($server["status"] !== "ready") return false;
	echo $server["name"]."..";

	// finish setup
	//
	$resultQuery = db_get(TABLE_INSTANCE, " `ip` = '".$server["ip"]."' and `status` like 'ready'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {

		$instance = $resultQuery["data"];
		$serverZone = $instance["server_zone"];
		$instanceName = $instance["name"];
		$gcloud1 = 'gcloud compute instances add-metadata "'.$instanceName.'" --zone "'.$serverZone.'" --metadata startup-script-url=http://msvhost.com/content/server-status.sh';
		$result1 = shell_exec($gcloud1);

		$result2 = instanceReset($instance);

		$log_cont = $server["log_setup"]."\n".str_repeat("-", 10)."\nCommand:\n".$gcloud1."\nResult:\n".$result1;
		$log_cont .= "\n".str_repeat("-", 10)."\nCommand:-reset instance-\nResult:\n".$result2;
		db_update(TABLE_SERVER, "log_setup", "'".db_escape($log_cont)."'", " id = '".$server["id"]."'");
		db_update(TABLE_SERVER, "status", "'published'", " id = '".$server["id"]."'");
		db_update(TABLE_INSTANCE, "status", "'published'", " id = '".$instance["id"]."'");

		echo "done\n";
	} else {
		echo "skip\n";
	}
}

function server_proccess_install($server) {
	if ($server["status"] !== "install") return false;
	echo $server["name"]."..";

	// run install
	$resultQuery = db_get(TABLE_INSTANCE, " `ip` = '".$server["ip"]."' and `status` like 'install'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		$instance = $resultQuery["data"];

		db_update(TABLE_SERVER, "status", "'installing'", " id = '".$server["id"]."'");
		db_update(TABLE_INSTANCE, "status", "'installing'", " id = '".$instance["id"]."'");


		// if sub-domain, update DNS
		if (strpos($server["domain"], ".msvhost.com") !== false) {
			$log_cont .= "Setup domain\n";
			// update NS
			$gcloud = 'gcloud dns record-sets transaction start -z=msvhost 2>&1';
			$result = shell_exec($gcloud);
			$log_cont .= "Exec1\n$gcloud\nResult:\n$result\n";

			$gcloud = 'gcloud dns record-sets transaction add -z=msvhost --name="'.$server["domain"].'." --type=A --ttl=7200 "'.$server["ip"].'" 2>&1';
			$result = shell_exec($gcloud);
			$log_cont .= "Exec2\n$gcloud\nResult:\n$result\n";

			$gcloud = 'gcloud dns record-sets transaction execute -z=msvhost 2>&1';
			$result = shell_exec($gcloud);
			$log_cont .= "Exec3\n$gcloud\nResult:\n$result\n";

			sleep(1);
		}


		$log = explode("\n", $instance["log_install"]);
		foreach ($log as $line) {
			if (strpos($line, "Mysql MSV Password: ") === 0) {
				list(,$db_password) = explode(": ", $line);
			}
			if (strpos($line, "Admin Password: ") === 0) {
				list(,$admin_password) = explode(": ", $line);
			}
		}

		$urlInstall = "http://".$server["ip"]."/?install_auto=1&install_step=1&msv_DB_LOGIN=msv&msv_DB_PASSWORD=$db_password&msv_DB_NAME=msv&";
		$urlInstall .= "msv_LANGUAGES=en&modules_local[]=blog&modules_local[]=gallery&modules_local[]=fancybox&modules_local[]=feedback&modules_local[]=tinymce&modules_local[]=cropper&modules_local[]=msv-core&modules_local[]=msv-api&modules_local[]=msv-seo&modules_local[]=msv-users&modules_local[]=search&modules_local[]=google-analytics&modules_local[]=theme-default&modules_local[]=sitograph&";
		$urlInstall .= "&modules_remote[]=sendgrid";
		$urlInstall .= "&admin_login=".$instance["admin_email"]."&admin_password=$admin_password&admin_create=1&";
		$urlInstall .= "&remote_installed=sendgrid";
		$urlInstall .= "&s_google_analytics_tracking_id=UA-85695066-1";
		$urlInstall .= "&s_sendgrid_user=msvhostmail";
		$urlInstall .= "&s_sendgrid_password=ZcQ_G0FTB";

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $urlInstall);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
		curl_setopt($ch, CURLOPT_FRESH_CONNECT, 30);
		curl_setopt($ch, CURLOPT_COOKIEFILE, "");
		$cont = curl_exec($ch);

		$log_cont .= "Setup $urlInstall\nCurl:\n".$cont."Curl error\n".curl_error($ch);
		curl_close($ch);

		db_update(TABLE_SERVER, "log_setup", "'".db_escape($log_cont)."'", " id = '".$server["id"]."'");
		db_update(TABLE_SERVER, "status", "'ready'", " id = '".$server["id"]."'");
		db_update(TABLE_INSTANCE, "status", "'ready'", " id = '".$instance["id"]."'");
	}
	echo "done\n";
}

function server_proccess_started($server) {
	if ($server["status"] !== "started") return false;
	echo $server["name"]."..";


	$resultQuery = db_get(TABLE_INSTANCE, " ip = '".$server["ip"]."' and `status` like 'created'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		db_update(TABLE_SERVER, "status", "'install'", " id = '".$server["id"]."'");

		$rowInstance = $resultQuery["data"];
		db_update(TABLE_SERVER, "instance_id", $rowInstance["id"], " id = '".$server["id"]."'");

		$rowInstance["user_id"] = $server["user_id"];
		$rowInstance["server_id"] = $server["id"];
		$rowInstance["server_size"] = $server["server_size"];
		$rowInstance["server_zone"] = $server["server_zone"];
		$rowInstance["lang_list"] = $server["lang_list"];
		$rowInstance["admin_email"] = $server["admin_email"];
		$rowInstance["url"] = $server["url"];
		$rowInstance["name"] = $server["name"];
		$rowInstance["domain"] = $server["domain"];
		$rowInstance["layout"] = $server["layout"];
		$rowInstance["status_date"] = date("Y-m-d H:i:s");
		$rowInstance["status"] = "install";

		$resultSave = db_update_row(TABLE_INSTANCE, $rowInstance);

		echo $resultSave;
	} else {
		echo "skip\n";
	}

}

function server_proccess_created($instance) {
	if ($instance["status"] !== "created") return false;
	echo $instance["name"]."..";

	db_update(TABLE_SERVER, "status", "'starting'", " id = '".$instance["id"]."'");

	/// GCLOUD created instance

	$instanceName = $instance["name"];
	$serverSize = $instance["server_size"];
	$serverZone = $instance["server_zone"];

	// remove
	//$gcloud = 'gcloud compute --project "msvhost" instances create "'.$instanceName.'" --boot-disk-device-name "'.$instanceName.'" --zone "'.$serverZone.'" --machine-type "'.$serverSize.'" --subnet "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly" --tags "http-server","https-server" --image "ubuntu-1604-xenial-v20170516" --image-project "ubuntu-os-cloud" --boot-disk-size "50" --boot-disk-type "pd-standard"  --metadata startup-script-url=http://msvhost.com/content/server-install.sh';
	$gcloud = 'gcloud compute --project "msvhost" instances create "'.$instanceName.'" --boot-disk-device-name "'.$instanceName.'" --zone "'.$serverZone.'" --machine-type "'.$serverSize.'" --subnet "default" --maintenance-policy "MIGRATE" --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly" --tags "http-server" --image "ubuntu-1604-xenial-v20170516" --image-project "ubuntu-os-cloud" --boot-disk-size "50" --boot-disk-type "pd-standard"  --metadata startup-script-url=http://msvhost.com/content/server-install.sh';

	$result = shell_exec($gcloud);
	if (strpos($result, $instanceName) === false) {
		// fail?
		db_update(TABLE_SERVER, "status", "'fail-create'", " id = '".$instance["id"]."'");
		db_update(TABLE_SERVER, "status_date", "now()", " id = '".$instance["id"]."'");
		db_update(TABLE_SERVER, "log_create", "'".db_escape("Command\n: ".$gcloud."\nResult\n:".$result)."'", " id = '".$instance["id"]."'");

		echo "FAIL!\n";
		return false;
	}
	$lines = explode("\n", $result);

	$infostr = $lines[1];
	while (strpos($infostr, "  ") !== false) {
		$infostr = str_replace('  ', ' ',$infostr);
	}

	$info = explode(" ", $infostr);
	$ip = trim($info[4]);

	db_update(TABLE_SERVER, "ip", "'$ip'", " id = '".$instance["id"]."'");
	db_update(TABLE_SERVER, "status", "'started'", " id = '".$instance["id"]."'");
	db_update(TABLE_SERVER, "status_date", "now()", " id = '".$instance["id"]."'");
	db_update(TABLE_SERVER, "log_create", "'".db_escape("Command: ".$gcloud."\nResult:".$result)."'", " id = '".$instance["id"]."'");

	echo "done\n";
}



function MsvhostLoadUser($module) {
	$rowUser = msv_get("website.user");

	if (empty($rowUser["user_id"])) {
		return false;
	}

	$resultQuery = db_get_list(TABLE_SERVER, "`user_id` = '".$rowUser["user_id"]."'", "'status'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		$list = array();
		foreach ($resultQuery["data"] as $row) {
			if ($row["status"] == "created") {
				$status_pers = 17;
			} elseif ($row["status"] == "starting") {
				$status_pers = 17+13*1;
			} elseif ($row["status"] == "started") {
				$status_pers = 17+13*2;
			} elseif ($row["status"] == "install") {
				$status_pers = 17+13*3;
			} elseif ($row["status"] == "installing") {
				$status_pers = 17+13*4;
			} elseif ($row["status"] == "ready") {
				$status_pers = 17+13*5;
			} elseif ($row["status"] == "published") {
				$status_pers = 17+13*6;
			} elseif ($row["status"] == "online") {
				$status_pers = 100;
			} elseif ($row["status"] == "fail-create" || $row["status"] == "deleting") {
				$status_pers = 0;
			}
			$row["status_pers"] = $status_pers;
			$list[] = $row;
		}

		msv_assign_data("user_server", $list);
	}

}


