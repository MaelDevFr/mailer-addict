.PHONY: run build crossbuild

run:
	v run ./src/

build:
	v -prod . -o bin/MailerAddict_linux_amd64 && strip bin/MailerAddict_linux_amd64 && bin/MailerAddict_linux_amd64

crossbuild:
	 v -prod -skip-unused -cflags -Os -os windows . -o bin/MailerAddict_windows_amd64.exe
