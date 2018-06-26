<?php
$rowUser = msv_get("website.user");
$user_id = 0;
if (!empty($rowUser["user_id"])) {
	$user_id = $rowUser["user_id"];
}
if (!empty($_REQUEST["instance_reset"]) && !empty($user_id)) {
	$resultQuery = db_get(TABLE_INSTANCE, " `id` = '".(int)$_REQUEST["instance_reset"]."' and `user_id` = '".$user_id."'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		$instance = $resultQuery["data"];
		$result = instanceReset($instance);
		var_dump($result);
	}
}

if (!empty($_REQUEST["server_stop"]) && !empty($user_id)) {
	$resultQuery = db_get(TABLE_SERVER, " `id` = '".(int)$_REQUEST["server_delete"]."' and `user_id` = '".$user_id."'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		$server = $resultQuery["data"];

		$result = instanceStop($instance);

		msv_message_ok("Website ".$server["domain"]." stop OK");
	}
}

if (!empty($_REQUEST["server_delete"]) && !empty($user_id)) {
	$resultQuery = db_get(TABLE_SERVER, " `id` = '".(int)$_REQUEST["server_delete"]."' and `user_id` = '".$user_id."'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		$server = $resultQuery["data"];

		db_update(TABLE_SERVER, "status", "'deleting'", " id = '".$server["id"]."'");
		db_update(TABLE_INSTANCE, "status", "'deleting'", " ip = '".$server["ip"]."'");

//			To long!
//		db_delete(TABLE_SERVER, " `id` = '".(int)$server["id"]."' and `user_id` = '".$user_id."'");
//      db_delete(TABLE_INSTANCE, " `ip` = '".$server["ip"]."' and `user_id` = '".$user_id."'");
//    	instanceDelete($server);

		msv_message_ok("Website ".$server["domain"]." delete OK");
	}
}


if (!empty($_REQUEST["doCreate"])) {
	$str = implode("\n", $_REQUEST);

	if (empty($_REQUEST["website_domain"])) {
		msv_message_error("Please enter domain address");
	}

	if (empty($_REQUEST["website_admin"])) {
		msv_message_error("Please enter website administrator email");
	}

	if (empty($_REQUEST["website_lang"]) && is_array($_REQUEST["website_lang"])) {
		msv_message_error("Please select website languages");
	}


	if (!msv_has_messages()) {


		$website_domain = $_REQUEST["website_domain"];
		//$website_lang = implode(",", $_REQUEST["website_lang"]);
		$website_lang = "en";
		$layout = $_REQUEST["website_layout"];
		$server = $_REQUEST["website_server"];
		$zone = $_REQUEST["website_zone"];
		$website_admin = $_REQUEST["website_admin"];

		$website_layout = $layout;
		$website_url = "http://".$website_domain;
		$website_name = $website_domain;
		$website_name = str_replace(".", "-", $website_name);

		$rowUser = msv_get("website.user");
		$user_id = 0;
		if (!empty($rowUser["user_id"])) {
			$user_id = $rowUser["user_id"];
		}

		$website_server = "";
		switch ($server) {
			case "micro":
				$website_server = "f1-micro";
				break;
			case "small":
				$website_server = "g1-small";
				break;
			case "standard1":
				$website_server = "n1-standard-1";
				break;
			case "standard2":
				$website_server = "n1-standard-2";
				break;
			case "standard3":
				$website_server = "n1-standard-4";
				break;
			case "standard4":
				$website_server = "n1-standard-8";
				break;
			case "standard5":
				$website_server = "n1-standard-16";
				break;
		}

		$website_zone = "";
		switch ($zone) {
			case "europe":
				$website_zone = "europe-west1-d";
				break;
			case "us-west":
				$website_zone = "europe-west1-d";
				break;
			case "us-central":
				$website_zone = "europe-west1-d";
				break;
			case "us-east":
				$website_zone = "europe-west1-d";
				break;
			case "asia-east":
				$website_zone = "europe-west1-d";
				break;
			case "asia-northeast":
				$website_zone = "europe-west1-d";
				break;
		}

		$item = array(
			"published" => 1,
			"user_id" => $user_id,
			"date_create" => date("Y-m-d H:i:s"),
			"status_date" => date("Y-m-d H:i:s"),
			"admin_email" => $website_admin,
			"domain" => $website_domain,
			"name" => $website_name,
			"url" => $website_url,
			"server_size" => $website_server,
			"server_zone" => $website_zone,
			"layout" => $website_layout,
			"lang_list" => $website_lang,
			"description" => $str,
			"status" => "created",
			"log_install" => "",
			"log_setup" => "",
		);

		$result = db_add(TABLE_SERVER, $item);

		if ($result["ok"]) {
			msv_message_ok("Thank you for your request. You will receive email shortly, as soon as server will be created.");

			msv_email_template("website_create", $website_admin, $item);
			msv_email_template("website_create_notify", "max@msvhost.com", $item, false);
		} else {
			msv_message_error($result["msg"]);
		}

	}
}
