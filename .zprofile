# Zsh configuration file (~/.zprofile)

export LANG=ja_JP.UTF-8
export EDITOR=vim
export PAGER=less
export DISPLAY=:0.0

export PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:$PATH
export MANPATH=/usr/local/share/man:/usr/share/man

# Mac OS X
if [ $(uname) = "Darwin" ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
  export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
  export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
  export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"
  export AWS_RDS_HOME="/usr/local/Library/LinkedKegs/rds-command-line-tools/jars"
  export AWS_CLOUDFORMATION_HOME="/usr/local/Library/LinkedKegs/aws-cfn-tools/jars"
  export AWS_IAM_HOME="/usr/local/Cellar/aws-iam-tools/1.5.0/jars"
  export AWS_CLOUDWATCH_HOME="/usr/local/Library/LinkedKegs/cloud-watch/jars"
  export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"
fi

# tmux
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

# RVM (Ruby Version Manager)
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# rbenv
if [[ -d "$HOME/.rbenv/bin" ]]; then
  export PATH=$HOME/.rbenv/bin:$PATH
fi
which rbenv > /dev/null 2>&1
[[ $? -eq 0 ]] && eval "$(rbenv init -)"

# hub
which hub > /dev/null 2>&1
[[ $? -eq 0 ]] && eval "$(hub alias -s)"

# node.js
export NODE_PATH=/usr/local/lib/node

# Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# EOF
