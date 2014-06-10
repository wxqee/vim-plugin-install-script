#!/bin/bash


log() {
  printf "[%24s] --- : $1\n" "$(date +"%Y-%m-%d %H:%M:%S.%6N")"
}

log "install pathogen.vim" 
test -f ~/.vim/autoload/pathogen.vim || {
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  test $? -eq 0 || {
    log "fail."
    exit 1
  }
}
log "done"

log "install nerdtree.vim"
which git >/dev/null || {
  log "command git is not installed at all."
  exit 1
}
test -d ~/.vim/bundle/nerdtree || {
  cd ~/.vim/bundle
  git clone https://github.com/scrooloose/nerdtree.git
  cd -
}
log "done"

