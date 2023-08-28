module main

import markdown
import net.smtp
import ui
import os

pub fn (mut app State) btn_add_click(b &ui.Button) {
    if os.is_readable("./src/data.db") {
        mut data := os.read_lines("./src/data.db") or { exit(401) } 
        if app.to == '' || app.subject == '' || app.body == '' {
		app.is_error = true
		return
	}
    output := markdown.to_html(app.body)
	client_cfg := smtp.Client{
    server: data[2].trim_space(),
    from: data[4].trim_space(),
    port: 465,
    username: data[0].trim_space(),
    password: data[1].trim_space(),
	ssl: true
}
send_cfg := smtp.Mail{
    to: app.to,
    subject: app.subject,
    body_type: .html,
    body: output,
}

	mut client := smtp.new_client(client_cfg) or { panic('Error with configuring smtp: ${err}') }
    client.send(send_cfg) or { panic('Error sending email: ${err}') }
    println("Mail send to ${app.to}")
    } else {
        app.is_error_register = true
    }
	
}