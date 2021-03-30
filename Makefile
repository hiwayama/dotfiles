# init dotfiles

DOTFILES = vimrc vim zshenv zsh tmux.conf gitconfig pryrc aliases

init : link neobundle

link: $(foreach f, $(DOTFILES), link-dotfiles-$(f))

unlink: $(foreach f, $(DOTFILES), unlink-dotfiles-$(f))

neobundle:
	@git clone --depth 1 git@github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
	@vim -c "NeoBundleInstall"

link-dotfiles-%: %
	@echo "link $< => $(HOME)/.$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dotfiles-%: %
	@echo "unlink $(HOME)/.$<"
	@$(RM) $(HOME)/.$<

