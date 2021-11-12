#!/bin/bash

# reset and retry ssh
function ssh-reset() {
    set -x
    ssh kaist-cp-expr-gateway "~/$1.sh off"
    sleep 10
    until ssh kaist-cp-expr-gateway "~/$1.sh on"
    do
        sleep 10
    done
    sleep 30
    ssh-retry $1 && set +x && return
    set +x
}

# retry ssh
function ssh-retry() {
	set -x
	for i in {1..8}; do
	ssh $1 && set +x && return
			sleep 30
	done
	set +x
    return 1
}

# git merge upstream main
function merge() {
	git stash
	git checkout main
	git fetch upstream
	git merge upstream/main
	git checkout -
	git merge main
	git stash pop
}

# git merge upstream main
function merge-on-main() {
	git fetch upstream
	git merge upstream/main
}
