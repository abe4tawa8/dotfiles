# Zsh configuration file (~/.zshrc)

autoload -U compinit; compinit
autoload -U colors; colors

## キーバインド
# Emacs方式にする
bindkey -e

## 補完
# タブによる補完を有効にする
setopt complete_in_word

# ディレクトリ名だけで移動する
setopt auto_cd

# 過去に移動したディレクトリを記憶する
# 再利用する場合は"cd -<TAB>"コマンドで選択する
setopt auto_pushd

# 入力を誤ったコマンド名を修正する
setopt correct

# 補完候補を詰めて画面に表示する
setopt list_packed

## ヒストリ
HISTFILE=$HOME/.zhistory  # ヒストリファイル
HISTSIZE=10000            # メモリ上に保持するヒストリ数
SAVEHIST=1000000          # ファイルに保存するヒストリ数

setopt extended_history      # コマンドの開始時刻と経過時間を記録する
setopt hist_ignore_dups      # 直前のコマンドと同一ならば記録しない
setopt hist_ignore_all_dups  # 登録済みのコマンドならば古い方を抹消する
setopt hist_reduce_blanks    # 余分な空白は詰めて記録する
setopt share_history         # 複数のセッション間でヒストリを共有する
setopt hist_no_store         # historyコマンドは記録しない
setopt hist_ignore_space     # コマンドの先頭が空白の時は登録しない

## プロンプト
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=%B%F{red}
  else
    color=%F{red}
  fi

  echo "$color$name$action%f%b "
}

setopt prompt_subst

if [[ $TERM = dumb || $TERM = emacs ]] {
  export PROMPT="[%n@%m]%(!.#.$) "
  export RPROMPT="[%(5~,%-2~/.../%2~,%~)]"
} else {
  local DEFAULT=$'%{\e[m%}'
  export PROMPT="%{$fg[green]%}[%n@%m]%(!.#.$) "$DEFAULT
  #export RPROMPT="%{$fg[yellow]%}[%(5~,%-2~/.../%2~,%~)]"$DEFAULT
  export RPROMPT='[`rprompt-git-current-branch`%~]'
}

# coreファイルを抑制する
unlimit
limit core 0
limit -s

## その他
# ビープ音を鳴らさない
setopt no_beep

# 補完候補表示時にビープ音を鳴らさない
setopt nolistbeep

## グローバルエイリアス
alias -g L="| $PAGER"
alias -g M="| $PAGER"
alias -g G='| grep'
alias -g C='| cat -n'
alias -g W='| wc'
alias -g H='| head'
alias -g T='| tail'
alias -g ....='../..'

## エイリアス
if [ $(uname) = "Darwin" ]; then
  alias ls='ls -v'
  alias ll='ls -lv'
  alias la='ls -alv'
  alias mysql_load='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
  alias mysql_unload='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
  alias pgsql_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
  alias pgsql_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
  alias pgsql_load='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
  alias pgsql_unload='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
  alias mongo_load='launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist'
  alias mongo_unload='launchctl unload -w ~/Library/LaunchAgents/org.mongodb.mongod.plist'
  alias jenkins_load='sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist'
  alias jenkins_unload='sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist'
  alias memcache_load='sudo launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist'
  alias memcache_unload='sudo launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist'
else
  alias ll='ls -l'
  alias la='ls -al'
fi
alias vi='vim'

# EOF
