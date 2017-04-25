# Zsh configuration file (~/.zprofile)

export LANG=ja_JP.UTF-8
export EDITOR=vim
export PAGER=less
export DISPLAY=:0.0

export PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:$PATH
export MANPATH=/usr/local/share/man:/usr/share/man

# tmux
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

# anyenv
if [[ -d "$HOME/.anyenv/bin" ]]; then
  export PATH=$HOME/.anyenv/bin:$PATH
  eval "$(anyenv init -)"
fi

# Python
export PYTHONSTARTUP=$HOME/.pystartup

# hub
which hub > /dev/null 2>&1
[[ $? -eq 0 ]] && eval "$(hub alias -s)"

# Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# EOF
