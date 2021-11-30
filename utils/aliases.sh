# /bin/bash

# mount workspace drive
wsmount() {
  [[ ! -e "/media/praveen/workspace/playground" ]] && sudo mount /dev/sda3 /media/praveen/workspace
}

### alias
# navigation
alias play='$(wsmount); cd "/media/praveen/workspace/playground"';
alias ws='$(wsmount); cd "/media/praveen/workspace/side_projects"';

# network
alias ports='netstat -tulanp'

# system utils
alias c='clear'
alias trash='gio trash -f $@'

echo "loaded aliases";

