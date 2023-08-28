module main

import ui 
import os

fn btn_profile_click(b voidptr) {
	if os.is_readable("./src/data.db") {
        mut data := os.read_lines("./src/data.db") or { exit(401) } 
		ui.message_box('
		Email : ${data[0]}
		Password : ${data[1]}
		Server : ${data[2]}
		Port : ${data[3]}
		From : ${data[4]}
		SSL : ${data[5]}
		')
	}
}