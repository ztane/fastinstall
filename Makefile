all: pgdg

pgdg: /etc/apt/sources.list.d/pgdg.list

/etc/apt/sources.list.d/pgdg.list:
	deb http://apt.postgresql.org/pub/repos/apt/ $(shell lsb_release -cs)-pgdg main
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
	sudo apt-get update

.PHONY pgdg
