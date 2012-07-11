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
fi

# RVM (Ruby Version Manager)
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# rbenv
eval "$(rbenv init -)"

# node.js
export NODE_PATH=/usr/local/lib/node

# EOF
