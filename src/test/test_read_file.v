module main

import os

fn main() {
	if os.is_readable("./data.json") {
		println("Yeah")
        mut data := os.read_lines("./src/data.db") or { exit(401) }
	    println(data[0])
		println(data[1])
		println(data[2])
		println(data[3])
		println(data[4])
		println(data[5])
	} else {
		println("No")
	}
}