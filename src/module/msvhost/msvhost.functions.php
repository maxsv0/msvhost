<?php

function instanceStop($instanceRow) {
	$serverZone = $instanceRow["zone"];
	$instanceName = $instanceRow["name"];

	$gcloud = 'gcloud compute instances stop "'.$instanceName.'" --zone "'.$serverZone.'"';
	$result = shell_exec($gcloud);

	return $result;
}


function instanceDelete($instanceRow) {
	$serverZone = $instanceRow["zone"];
	$instanceName = $instanceRow["name"];

	$gcloud = 'gcloud compute instances delete "'.$instanceName.'" --zone "'.$serverZone.'"';
	$result = shell_exec($gcloud);

	return $result;
}


function instanceReset($instanceRow) {
	$serverZone = $instanceRow["zone"];
	$instanceName = $instanceRow["name"];

	$gcloud = 'gcloud compute instances reset "'.$instanceName.'" --zone "'.$serverZone.'"';
	$result = shell_exec($gcloud);

	return $result;
}


function MsvhostLoadUser($module) {
	$rowUser = msv_get("website.user");

	if (empty($rowUser["user_id"])) {
		return false;
	}

	$resultQuery = db_get_list(TABLE_INSTANCE, "`user_id` = '".$rowUser["user_id"]."'", "'status'");
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


function msvhost_create_instance($rowInfo) {
    $jenkinsAuth = msv_get_config("jenkins_auth");

    $jobUrl = "";
    if ($rowInfo["type"] === "wtype1") {
        $jobUrl = "http://ci.msvhost.com:8080/job/NewProduction-Empty/build";
    } elseif ($rowInfo["type"] === "wtype2") {
        $jobUrl = "http://ci.msvhost.com:8080/job/NewProduction-ThemeDefault/build";
    } elseif ($rowInfo["type"] === "wtype3") {
        $jobUrl = "http://ci.msvhost.com:8080/job/NewProduction-ThemeSitograph/build";
    } elseif ($rowInfo["type"] === "wtype4") {
        $jobUrl = "";
    }

    if (empty($jobUrl)) msv_error("Job url empty");
    if (empty($jenkinsAuth)) msv_error("Pipeline auth empty");

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,$jobUrl);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_USERPWD, $jenkinsAuth);
    curl_setopt($ch, CURLOPT_POSTFIELDS,
        http_build_query(array('json' => json_encode(array("parameter" => array(
            array("name" => "WNAME", "value" => $rowInfo["name"]),
            array("name" => "WEMAIL", "value" => $rowInfo["admin_email"]),
            array("name" => "WPASS", "value" => $rowInfo["admin_pass"]),
            array("name" => "WTYPE", "value" => $rowInfo["size"]),
            array("name" => "WZONE", "value" => $rowInfo["zone"]),
            array("name" => "WSIZE", "value" => $rowInfo["disk"]."GB"),
            array("name" => "WTRACKID", "value" => $rowInfo["ga_track"]),
            array("name" => "WPROPERTY", "value" => $rowInfo["ga_property"]),
            array("name" => "WIMAGE", "value" => "sitograph-image-3"),
            array("name" => "WLANG", "value" => $rowInfo["lang"]),
        ))))));

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $server_output = curl_exec ($ch);
    curl_close ($ch);

    return true;
}
