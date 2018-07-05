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
}
