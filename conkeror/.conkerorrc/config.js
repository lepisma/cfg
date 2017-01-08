// Conkeror config

load_paths.unshift("chrome://conkeror-contrib/content/");

require("new-tabs.js");
require("session.js");
require("mode-line.js");
require("clicks-in-new-buffer.js");

clicks_in_new_buffer_target = OPEN_NEW_BUFFER_BACKGROUND;
clicks_in_new_buffer_button = 1;

session_auto_save_auto_load = true;

// Use letters for hint
hint_digits = "abcdefghijklmnopqrstuvwxyz";
hints_minibuffer_annotation_mode(true);

// Mode line
add_hook("mode_line_hook", mode_line_adder(buffer_count_widget), true);
add_hook("mode_line_hook", mode_line_adder(loading_count_widget), true);

// Completions
minibuffer_auto_complete_default = true;
url_completion_use_history = true;
url_completion_use_bookmarks = true;

// Load styles
theme_unload("default");
var sheet = get_home_directory();
sheet.append(".conkerorrc");
sheet.append("style.css");
register_user_stylesheet(make_uri(sheet));

content_handlers.set("application/pdf", content_handler_save);

// Extensions
session_pref("xpinstall.whitelist.required", false);
