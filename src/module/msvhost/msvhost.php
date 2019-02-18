<?php
$rowUser = msv_get("website.user");
$user_id = 0;
if (!empty($rowUser["user_id"])) {
	$user_id = $rowUser["user_id"];
    msv_assign_data("website_email", $rowUser["email"]);
}
if (!empty($_REQUEST["instance_reset"]) && !empty($user_id)) {
	$resultQuery = db_get(TABLE_INSTANCE, " `id` = '".(int)$_REQUEST["instance_reset"]."' and `user_id` = '".$user_id."'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		$instance = $resultQuery["data"];
		$result = instanceReset($instance);
        msv_message_ok("Website ".$instance["domain"]." reset OK");
	}
}

if (!empty($_REQUEST["instance_stop"]) && !empty($user_id)) {
	$resultQuery = db_get(TABLE_INSTANCE, " `id` = '".(int)$_REQUEST["instance_stop"]."' and `user_id` = '".$user_id."'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		$server = $resultQuery["data"];
		$result = instanceStop($instance);
		msv_message_ok("Website ".$server["domain"]." stop OK");
	}
}

if (!empty($_REQUEST["instance_delete"]) && !empty($user_id)) {
	$resultQuery = db_get(TABLE_INSTANCE, " `id` = '".(int)$_REQUEST["instance_delete"]."' and `user_id` = '".$user_id."'");
	if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
		$server = $resultQuery["data"];
        $result = instanceDelete($server);
		msv_message_ok("Website ".$server["domain"]." delete OK");
	}
}

if (!empty($_POST["startTrial"])) {
    $_REQUEST["language"] = LANG;
    $_REQUEST["website_type"] = "wtype3";
    $_REQUEST["architecture"] = "warch1";
    $_REQUEST["website_size"] = "f1-micro";
    $_REQUEST["website_zone"] = "us-central1-f";
    $_REQUEST["website_disk"] = "10";
    $_REQUEST["finish"] = 1;
}

if (!empty($_REQUEST["finish"])) {
	$str = implode("\n", $_REQUEST);

//	if (empty($user_id)) {
//		msv_message_error("Please login to create website");
//	}

	if (empty($_REQUEST["websiteurl"])) {
		msv_message_error("Please enter domain address");
	}

	if (empty($_REQUEST["email"])) {
		msv_message_error("Please enter website administrator email");
	}

	if (empty($_REQUEST["language"])) {
		msv_message_error("Please select website languages");
	}

	if (empty($_REQUEST["terms"])) {
		msv_message_error("Please accept terms and conditions to proceed");
	}

	if (!msv_has_messages()) {

        $website_name = $_REQUEST["websiteurl"];
        $website_email = $_REQUEST["email"];
        $website_pass = msv_generate_password();
        $website_domain = strtolower($_REQUEST["websiteurl"]).".msvhost.com";
        $website_url = "http://".$website_domain."/";
		$website_lang = $_REQUEST["language"];
		$website_type = $_REQUEST["website_type"];
		$website_architecture = $_REQUEST["architecture"];

        $website_zone = $_REQUEST["website_zone"];
        $website_disk = $_REQUEST["website_disk"];

        //TODO: use this
        //$website_size = $_REQUEST["website_size"];
        $website_size = "f1-micro";

        // TODO: create web property here
        $ga_track =  "UA-85695066-2";
        $ga_property =  "162555457";

		$item = array(
			"published" => 1,
			"user_id" => $user_id,
			"date_create" => date("Y-m-d H:i:s"),
			"admin_email" => $website_email,
			"admin_pass" => $website_pass,
			"name" => $website_name,
			"domain" => $website_domain,
			"url" => $website_url,
			"type" => $website_type,
			"arch" => $website_architecture,
			"size" => $website_size,
			"zone" => $website_zone,
			"disk" => $website_disk,
			"language" => $website_lang,
			"ga_track" => $ga_track,
			"ga_property" => $ga_property,
			"status" => "working",
			"status_date" => date("Y-m-d H:i:s"),
			"public" => 0,
		);

		$result = db_add(TABLE_INSTANCE, $item);

		if ($result["ok"]) {
			msv_email_template("website_create_notify_user", $website_email, $item);
			msv_email_template("website_create_notify_admin", "max@msvhost.com", $item);

            msvhost_create_instance($item);
            msv_assign_data("website_created", 1);
		} else {
			msv_message_error($result["msg"]);
		}

	} else {
        msv_assign_data("website_email", $_REQUEST["email"]);
        msv_assign_data("website_url", $_REQUEST["websiteurl"]);
        msv_assign_data("language", $_REQUEST["language"]);
    }
}

msv_include_js("
    // Code for the Validator
    var \$validator = $('.wizard-card form').validate({
        rules: {
            websiteurl: {
                required: true,
                alphanumeric: true,
                minlength: 3,
            },
            email: {
                required: true,
                email: true,
            },
            terms: {
                required: true,
                checkbox: true
            },
        },
    });
    ", "/create/");