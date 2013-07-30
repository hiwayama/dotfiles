# init dotfiles

DOTFILES = vimrc vim zshrc zsh tmux.conf gitconfig gemrc sbtconfig

init : link neobundle

link: $(foreach f, $(DOTFILES), link-dotfiles-$(f))

unlink: $(foreach f, $(DOTFILES), unlink-dotfiles-$(f))

neobundle:
	@git submodule init
	@git submodule update
	@vim -c "NeoBundleInstall"

link-dotfiles-%: %
	@echo "link $< => $(HOME)/.$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dotfiles-%: %
	@echo "unlink $(HOME)/.$<"
	@$(RM) $(HOME)/.$<

