module main

import ui
import os

pub fn (mut app State) btn_create_click(b &ui.Button) {
	if app.username == '' || app.password == '' || app.server == '' || app.port == '' || app.from == '' {
		app.is_error_register = true
		return
	}
	new_user := User{
		username:  app.username
		password: app.password
		server: app.server
		port: app.port
		from: app.from
		ssl: app.ssl
	}
	schema := '{
		${new_user.username}
		${new_user.password}
		${new_user.server}
		${new_user.port}
		${new_user.from}
		${new_user.ssl}
	}'

    os.write_file("./src/data.db", schema) or { exit(401) }
}