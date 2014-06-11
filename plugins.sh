#!/bin/bash


cd `dirname $0`

COLO_BLK='\e[0;30m' ; COLO_DGRY='\e[1;30m'
COLO_BLU='\e[0;34m' ; COLO_LBLU='\e[1;34m'
COLO_GRN='\e[0;32m' ; COLO_LGRN='\e[1;32m'
COLO_RYN='\e[0;36m' ; COLO_LRYN='\e[1;36m'
COLO_RED='\e[0;31m' ; COLO_LRED='\e[1;31m'
COLO_PPL='\e[0;35m' ; COLO_LPPL='\e[1;35m'
COLO_ORG='\e[0;33m' ; COLO_YLW='\e[1;33m'
COLO_LGR='\e[0;37m' ; COLO_WHT='\e[1;37m'
COLO_NC='\e[0m'

log() {
  case "$2" in
    "good")
      printf "${COLO_YLW}[%24s] :${COLO_NC} ${COLO_GRN}$1${COLO_NC}\n" "$(date +"%Y-%m-%d %H:%M:%S.%6N")"
      ;;
    "bad")
      printf "${COLO_YLW}[%24s] :${COLO_NC} ${COLO_RED}$1${COLO_NC}\n" "$(date +"%Y-%m-%d %H:%M:%S.%6N")"
      ;;
    *)
      printf "${COLO_YLW}[%24s] :${COLO_NC} $1\n" "$(date +"%Y-%m-%d %H:%M:%S.%6N")"
      ;;
  esac
}

requirements="git curl"
log
for cmd in $requirements; do
  which $cmd >/dev/null 2>&1 || {
    log
    log "command [$cmd] is not installed at all." bad
    log
    exit 1
  }
  log "check command [$cmd] is good." good
done
log

log
log "install pathogen.vim"
test -f ~/.vim/autoload/pathogen.vim || {
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  test $? -eq 0 || {
    log "fail." bad
    exit 1
  }
}
log "done" good
log

log
log "install nerdtree.vim"
test -d ~/.vim/bundle/nerdtree || {
  cd ~/.vim/bundle
  git clone https://github.com/scrooloose/nerdtree.git
  cd -
}
log "done" good
log

log
log "install vim-json.vim"
test -d ~/.vim/bundle/vim-json || {
  cd ~/.vim/bundle
  git clone https://github.com/rogerz/vim-json
  cd -
}
log "done" good
log

