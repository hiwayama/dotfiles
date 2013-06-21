# init dotfiles

DOTFILES = vimrc vim zshrc tmux.conf gitconfig gemrc sbtconfig

link: $(foreach f, $(DOTFILES), link-dotfiles-$(f))

unlink: $(foreach f, $(DOTFILES), unlink-dotfiles-$(f))

gitinit:
	@git submodule init
	@git submodule update

link-dotfiles-%: %
	@echo "link $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dotfiles-%: %
	@echo "unlink $(HOME)/$<"
	@$(RM) $(HOME)/.$<

