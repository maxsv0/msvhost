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

function MsvhostLoadInstanceList($module) {
    $resultQuery = db_get_list(TABLE_INSTANCE, "`public` > 0", "`date_create` desc");
    if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
        $list = array();
        foreach ($resultQuery["data"] as $row) {
            $row = process_status($row);
            $list[] = $row;
        }
        msv_assign_data("instance_list", $list);
    }
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
            $row = process_status($row);
			$list[] = $row;
		}
		msv_assign_data("user_instance", $list);
	}
}

function process_status($row) {
    $tm = time() - strtotime($row["date_create"]);
    $trial_days = 5 - floor($tm/86400);

    if ($row["status"] == "working") {
        $status_pers = 38 + floor(5*(min($tm, 15)/15));
    } elseif ($row["status"] == "create-success") {
        $status_pers = 43 + floor(55*(min($tm, 200)/200));
    } elseif ($row["status"] == "install-success") {
        $status_pers = 100;
    } elseif ($row["status"] == "create-fail" || $row["status"] == "install-fail") {
        $status_pers = 0;
    }

    if ($trial_days <= 0) {
        // TODO: trial over

        if ($row["status"] == "install-success" && $row["user_id"] <= 5) {
            $row["status"] = "active";
        } else {
            $row["trial_days"] = 0;
            $row["status"] = "disabled";
        }
    } else {
        if ($row["status"] == "install-success") {
            $row["status"] = "active-trial";
            $row["trial_days"] = $trial_days;
        }
    }

    $row["status_pers"] = $status_pers;
    return $row;
}



function msvhost_create_instance($rowInfo) {
    $jenkinsAuth = msv_get_config("jenkins_auth");

    $sitographImageName = "";
    if ($rowInfo["arch"] === "warch1") {
        $sitographImageName = msv_get_config("sitograph_image_production");
    } else if ($rowInfo["arch"] === "warch2") {
        $sitographImageName = msv_get_config("sitograph_image_development");
    }

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
            array("name" => "WIMAGE", "value" => $sitographImageName),
            array("name" => "WLANG", "value" => $rowInfo["language"]),
        ))))));

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $server_output = curl_exec ($ch);
    curl_close ($ch);

    return true;
}
