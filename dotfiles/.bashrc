export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export NODE_PATH="/usr/local/bin/node:/usr/local/lib/node_modules:/usr/local/lib/jsctags/:$NODE_PATH"

export EDITOR=vim

# Git 
alias co='git checkout'
alias pull='git pull'
alias push='git push'
alias ga='git add .'
alias gs='git status'
alias gb='git branch'
alias gf='git fetch'
alias gc='git commit -am'

alias sq=squash
alias cb=current_branch
alias pushf=force_push

squash(){
  git rebase -i HEAD~$1
}

current_branch(){
  gb 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

hist(){
  git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short -$1
}

last(){
  git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short -1
}

changed(){
  git show --pretty="format:" --name-only $1
}

sync(){
  gf --all && co master && pull && gs && last
}

force_push(){
  branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
  if [ $branch == "master" ]; then
    echo "*** [Policy] never force push master"
  else
    echo "*** Force push branch: $branch to origin"
    push --force origin $branch
  fi
}
