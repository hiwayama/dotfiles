# init dotfiles

DOTFILES = vimrc vim zshenv zsh tmux.conf gitconfig pryrc aliases

init : link

link: $(foreach f, $(DOTFILES), link-dotfiles-$(f))

unlink: $(foreach f, $(DOTFILES), unlink-dotfiles-$(f))

link-dotfiles-%: %
	@echo "link $< => $(HOME)/.$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dotfiles-%: %
	@echo "unlink $(HOME)/.$<"
	@$(RM) $(HOME)/.$<

