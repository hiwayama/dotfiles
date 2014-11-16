# ---------------------------------- #
# dotfiles/zsh/.zshrc
#
#
# ---------------------------------- #

# ----------------
# General Setting
# ----------------
export EDITOR=vim       # エディタをVimに
export LANG=ja_JP.UTF-8 # 文字コードをUTF-8に
export KCODE=u          # KCODEにUTF-8を設定

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
setopt auto_pushd # cd -<tab>で以前移動したディレクトリを表示
setopt pushd_ignore_dups # auto_pushdで重複するディレクトリは記録しない
bindkey "^[[Z" reverse-menu-complete # shift-tabで補完候補を逆順表示
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補間時に大文字小文字を区別しない

# --------
# History
# --------
HISTFILE=$ZDOTDIR/.zsh_history # ヒストリを保存するファイル
HISTSIZE=10000          # メモリに保存するヒストリの件数
SAVEHIST=10000          # 保存されるヒストリの件数
export HISTTIMEFORMAT='%y/%m/%d %H:%M:%S'
setopt append_history   # 履歴を追加する.
setopt extended_history # ヒストリに実行時間も保存
setopt hist_ignore_dups # 直前と同じコマンドはヒストリに追加しない

# -------
# Prompt
# -------
autoload -U colors; colors

setopt prompt_subst
local prompt_cdir="%F{cyan}%n:%~%f"
local prompt_time="[%D{%m/%d %T}]"
PROMPT='%(?.%f.%F{red}@_@%f)[$prompt_cdir`prompt-git-current-branch`] $prompt_time `prompt-current-ruby`
%(!.%F{red}%B%n%b%f # .%c$ )'
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
if [ -f ${HOME}/.aliases ]; then
  source $HOME/.aliases;
fi

# JVMの起動設定
export _JAVA_OPTIONS='-Dfile.encoding=UTF-8 -Xms512M -Xmx1024m -XX:MaxPermSize=256M -XX:PermSize=256M'

if [ -d ${HOME}/.anyenv ] ; then
  export PATH=${HOME}/.anyenv/bin:${PATH}
  eval "$(anyenv init -)"
  for D in `ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi
# compiled zshrc
if [ ! -f ~/.zsh/.zshrc.zwc -o ~/.zsh/.zshrc -nt ~/.zsh/.zshrc.zwc ]; then
  zcompile ~/.zsh/.zshrc
fi

case "${OSTYPE}" in
  # Max(Unix)
  darwin*)
    export R_HOME=/Library/Frameworks/R.framework/Resources

    # for golang
    export GOROOT=/usr/local/Cellar/go/1.2.1/libexec
    export GOPATH=${HOME}/.go

    # TerminalからTexコンパイルする設定
    export PATH=$PATH:/usr/texbin

    ;;
  # Linux
  linux*)
    unset SSH_ASKPASS
    # SSHで接続時にgitのssh接続でのエラー回避の為
    ;;
esac


