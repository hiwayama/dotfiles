
# ------
# alias
# ------
alias gimp='/Applications/Gimp.app/Contents/MacOS/Gimp'
alias ll='ls -lFh'
alias la='ls -lFha'
alias df='df -h'
alias psql='psql -h localhost'
alias rm='rm -i'
alias gcc='gcc-4.2'
alias irb='pry'


# ----------------
# General Setting
# ----------------
export EDITOR=vim       # エディタをVimに 
export LANG=ja_JP.UTF-8 # 文字コードをUTF-8に
export KCODE=u          # KCODEにUTF-8を設定

# -----------
# Complement 
# -----------
autoload -U compinit; compinit  # 補完機能を有効にする
setopt auto_list                # 補完候補を一覧で表示する
setopt auto_menu                # 補間キー連打で候補を順に表示
setopt list_packed              # 補完候補をできるだけ詰めて表示する
bindkey "^[[Z" reverse-menu-complete # shift-tabで補完候補を逆順表示
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補間時に大文字小文字を区別しなsい

# --------
# History
# --------
HISTFILE=~/.zsh_history # ヒストリを保存するファイル
HISTSIZE=10000          # メモリに保存するヒストリの件数
SAVEHIST=10000          # 保存されるヒストリの件数
setopt extended_history # ヒストリに実行時間も保存
setopt hist_ignore_dups # 直前と同じコマンドはヒストリに追加しない

# -------
# Prompt
# -------
autoload -U colors; colors

# ----------------------
# Look And Feel Settings
# ----------------------
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補間時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# lsコマンド時に色がつく
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


export CC=gcc-4.2
# JVMの起動設定
export _JAVA_OPTIONS='-Dfile.encoding=UTF-8 -Xmx1024m'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
