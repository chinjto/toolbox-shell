#!/usr/bin/env sh

# make custom functions
release() {
  make release VERSION="$1"
}
deploy() {
  make deploy VERSION="$1"
}
publish() {
  make publish VERSION="$1"
}
feature() {
  make feature NAME="$1"
}
fix() {
  make fix NAME="$1"
}
hotfix() {
  make hotfix NAME="$1"
}

alias build='make build'
alias rebuild='make force-build'
alias clean='make clean'
alias test='make test'
alias run='make run'
alias preview='make preview'
alias version='make version'
alias feat='feature'
alias commit='make commit'
alias lint='make lint'
alias format='make format'
alias deliver='make deliver'
alias sandbox='make sandbox'
alias sandbox:clean='make sandbox-clean'
