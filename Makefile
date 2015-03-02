all: pgdg tools

pgdg: /etc/apt/sources.list.d/pgdg.list

/etc/apt/sources.list.d/pgdg.list:
	echo 'deb http://apt.postgresql.org/pub/repos/apt/ $(shell lsb_release -cs)-pgdg main' | sudo tee /etc/apt/sources.list.d/pgdg.list
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
	sudo apt-get update

tools: $(HOME)/tools /etc/skel/tools

$(HOME)/tools:
	git clone https://github.com/ztane/ztanesh ~/tools
	zsh ~/tools/zsh-scripts/setup.zsh
	sudo chsh $(shell whoami) -s /bin/zsh

/etc/skel/tools: $(HOME)/tools
	zsh ~/tools/zsh-scripts/setup-skel.zsh
