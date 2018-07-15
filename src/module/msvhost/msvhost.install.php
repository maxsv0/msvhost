<?php

/**
 * Install hook for module msvhost
 * This function is executed upon installation
 *
 * @param object $module Module object
 * @return void
 */
function Install_Msvhost($module) {
    msv_set_config("theme_css_path", CONTENT_URL."/css/msvhost.css", true, "*");
    msv_set_config("theme_js_path", CONTENT_URL."/js/msvhost.js", true, "*");

    msv_set_config("theme_bg", CONTENT_URL."/images/bg-5.jpg", true, "*");

    msv_set_config("jenkins_auth", "", true, "*");
    msv_set_config("sitograph_image_production", "", true, "*");
    msv_set_config("sitograph_image_development", "", true, "*");

    $itemTemplate = array(
        "name" => "website_create_notify_user",
        "subject" => "{name} is created",
        "text" => msv_load_module_doc($module->pathModule, "email-notify"),
    );
    msv_add_mailtemplate($itemTemplate, array("lang" => "all"));

    $itemTemplate = array(
        "name" => "website_create_notify_admin",
        "subject" => "{name} is created",
        "text" => msv_load_module_doc($module->pathModule, "email-admin-notify"),
    );
    msv_add_mailtemplate($itemTemplate, array("lang" => "all"));
}
