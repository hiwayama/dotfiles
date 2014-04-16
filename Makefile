# init dotfiles

DOTFILES = vimrc vim zshenv zsh tmux.conf gitconfig gemrc sbtconfig pryrc

init : link neobundle

link: $(foreach f, $(DOTFILES), link-dotfiles-$(f))

unlink: $(foreach f, $(DOTFILES), unlink-dotfiles-$(f))

neobundle:
	@git clone git://github.com/Shougo/neobundle.vim ${HOME}/.vim/neobundle.vim
	@vim -c "NeoBundleInstall"

link-dotfiles-%: %
	@echo "link $< => $(HOME)/.$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dotfiles-%: %
	@echo "unlink $(HOME)/.$<"
	@$(RM) $(HOME)/.$<

