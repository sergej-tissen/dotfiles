alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ls='ls -GFh'
alias l='ls -FGlAhp'                        # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cdd='cd ~/dotfiles'
alias cdw='cd ~/workspace'
alias cdc='cd ~/cc-workspace'
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                   # Go back 3 directory levels
alias .....='cd ../../../../'               # Go back 4 directory levels
alias c='clear'                             # c: Clear terminal display
alias ag='ag --hidden'                      # include dotfiles
alias f='find . -name'                      # search for files in current folder by name
alias fci='find . -iname'                   # search for files in current folder case insensitive
alias vi='vim'
alias iv='vim'
cd() { builtin cd "$@"; ls -l; }            # Always list directory contents upon 'cd'

# Tmux
alias tmk='tmux kill-session -t ${PWD##*/} && tmux ls'
alias tmka='tmux kill-session -a && tmux kill-session && tmux ls'
alias tma='tmux a'
alias tml='tmux ls'
tme () {
  folderName=${PWD##*/}
  if (tmux has-session -t "${folderName}"); then
    tmux -2 attach -t "${folderName}"
  else
    tmux new -s "${folderName}" -n dev -d
    tmux new-window -t "${folderName}:2" -n "misc"
    tmux split-window -h
    tmux select-pane -t 1
    tmux select-window -t "${folderName}:1"
    tmux split-window -h -p 45
    tmux select-pane -t 1
    tmux send-keys 'vim' Enter
    tmux -2 attach-session -t "${folderName}"
  fi
}

bind -r '\C-s'
stty -ixon

# Don't close Terminal with C-d
set -o ignoreeof

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add autocomplete for terminal
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
complete -C '/usr/local/bin/aws_completer' aws
eval "`npm completion`"

# show current git branch in terminal
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[31m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[m\]$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=vim
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# fzf plugin
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
