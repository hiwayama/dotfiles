# ---------------------------------- #
# dotfiles/zshrc
#
#
# ---------------------------------- #

# ----------------
# General Setting
# ----------------
export EDITOR=vim       # エディタをVimに 
export LANG=ja_JP.UTF-8 # 文字コードをUTF-8に
export KCODE=u          # KCODEにUTF-8を設定
#export LC_ALL=C

# ---------------
# Path Setting
# ---------------
path=(
  # ディレクトリのみを許可
  $path(N-/^W)

)
typeset -U path PATH    # uniq化


# -----------
# Complement 
# -----------
autoload -U compinit; compinit -u  # 補完機能を有効にする
setopt auto_list                # 補完候補を一覧で表示する
setopt auto_menu                # 補間キー連打で候補を順に表示
setopt list_packed              # 補完候補をできるだけ詰めて表示する
bindkey "^[[Z" reverse-menu-complete # shift-tabで補完候補を逆順表示
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補間時に大文字小文字を区別しない

# --------
# History
# --------
HISTFILE=$ZDOTDIR/.zsh_history # ヒストリを保存するファイル
HISTSIZE=10000          # メモリに保存するヒストリの件数
SAVEHIST=10000          # 保存されるヒストリの件数
export HISTTIMEFORMAT='%y/%m/%d %H:%M:%S'
setopt extended_history # ヒストリに実行時間も保存
setopt hist_ignore_dups # 直前と同じコマンドはヒストリに追加しない

# -------
# Prompt
# -------
autoload -U colors; colors

setopt prompt_subst
local AA_LIST >/dev/null
AA_LIST=("(:3[___]" "(¦3[___]")
local prompt_cdir="%F{cyan}%n@%m:%~%f"
local prompt_time="[%D{%m/%d %T}]"
PROMPT='%(?.%f.%F{red}@_@%f)[$prompt_cdir`prompt-git-current-branch`] $prompt_time `prompt-current-ruby`
%(!.%F{red}%B%n%b%f # .%F{yellow}${AA_LIST[$[1+$RANDOM %2]]}%f $ )'
PROMPT2='%_%% '
SPROMPT="%r is currect? [n, y, a, e]: "

# ----------------------
# Look And Feel Settings
# ----------------------
# 色の設定
export LSCOLORS=gxfxcxdxbxegedabagacad
# 補間時の色の設定
export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# lsコマンド時に色がつく
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# -------
# alias
# -------
if [ -f ~/.zsh/zalias ]; then
  source $HOME/.zsh/zalias
fi

# JVMの起動設定
export _JAVA_OPTIONS='-Dfile.encoding=UTF-8 -Xms512M -Xmx1024m -XX:MaxPermSize=256M -XX:PermSize=256M'


# ----------------
# HogeVM Leading
# ----------------
# RVM setting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Perlbrew setting
if [ -d ~/perl5 ];
then
  source ~/perl5/perlbrew/etc/bashrc
fi

# compiled zshrc
if [ ! -f ~/.zsh/.zshrc.zwc -o ~/.zsh/.zshrc -nt ~/.zsh/.zshrc.zwc ]; then
  zcompile ~/.zsh/.zshrc
fi

if [ -d $HOME/.nvm ];
then
  source $HOME/.nvm/nvm.sh
  nvm use v0.10.21
  export NODE_PATH=$HOME/.nvm/v0.10.21/lib/node_modules
  NPM_PATH=$HOME/.nvm/v0.10.21/bin/npm
  export PATH=$NPM_PATH:$NODE_PATH:$PATH
fi

case "${OSTYPE}" in
  # Max(Unix)
  darwin*)
    export R_HOME=/Library/Frameworks/R.framework/Resources

    # TerminalからTexコンパイルする設定
    export PATH=$PATH:/Library/TeX/Distributions/TeXLive-2010-64.texdist/Contents/Root/bin/x86_64-darwin
    alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
    ;;
  # Linux
  linux*)
    unset SSH_ASKPASS
    # SSHで接続時にgitのssh接続でのエラー回避の為
    ;;
esac


