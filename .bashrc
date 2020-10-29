# Have .bash_profile source .bashrc so it works when SSHing in

export VISUAL=vim
export EDITOR="$VISUAL"
source ~/git-completion.bash
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_build_platform(){
    if [ -n "$BUILD_PLATFORM" ]; then
        echo "($BUILD_PLATFORM)\n"
    fi
}

alias ls='ls -F --color=auto'
alias grep='grep --color=auto -nI'
alias rgrep='rgrep --color=auto -nI'

#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\[\033[38;5;39m\]\u\[\033[38;5;0m\]@\[\033[38;5;2m\]\h:\[$(tput bold)\]\[\033[38;5;1m\]\w\[\033[33m\]\$(parse_git_branch)$(parse_build_platform)\[\033[00m\]\$ "

# copies some environment over to the remote machine
# https://superuser.com/a/884671
function sshs() {
    ssh -t $* "echo `base64 -i ~/remote_ssh_env.sh` | base64 --decode > /tmp/remote_ssh_env.sh; bash --rcfile /tmp/remote_ssh_env.sh"
}
