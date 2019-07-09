#!/bin/sh
unalias git
rgit=$(which git)
if [[ $@ == "rekt -f" ]]; then
    printf "\033[0;31mgit $@ is not a valid git command\033[0m"
    rm -rf $(${rgit} rev-parse --show-toplevel)/.git
else
    rgit $@
fi
alias git=fakeGit
