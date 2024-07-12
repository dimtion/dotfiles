update:
	XDG_CONFIG_HOME=./.config nvim --headless "+Lazy! update" +qa
	XDG_CONFIG_HOME=./.config nvim --headless "+TSUpdateSync" +qa

fmt:
	$(MAKE) fmt -C .config/nvim
