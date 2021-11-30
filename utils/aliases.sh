# /bin/bash

# mount workspace drive
wsmount() {
  [[ ! -e "/media/praveen/workspace/playground" ]] && sudo mount /dev/sda3 /media/praveen/workspace
}

### alias
# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# $OLDPWD location of last working directory
alias back='cd $OLDPWD'
alias play='$(wsmount); cd "/media/praveen/workspace/playground"';
alias ws='$(wsmount); cd "/media/praveen/workspace/side_projects"';

# network
alias ports='netstat -tulanp'

# system utils
alias c='clear'
alias ffind="find . -type f -name $@"
alias dfind="find . -type d -name $@"
alias reload="[[ -e ~/.bashrc ]] && source ~/.bashrc"
alias trash='gio trash -f $@'

echo "loaded aliases";

