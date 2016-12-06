alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ls='ls -GFh'
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias cdd='cd ~/dotfiles'
alias cdw='cd ~/workspace'
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                   # Go back 3 directory levels
alias .....='cd ../../../../'               # Go back 4 directory levels
alias c='clear'                             # c: Clear terminal display
alias ag='ag --hidden'                      # include dotfiles
alias vi='vim'
alias iv='vim'
alias vimmin='vim -u ~/.vimrc_minimal'
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd: Makes new Dir and jumps inside

alias tmk='tmux kill-session -t ${PWD##*/} && tmux ls'
alias tmka='tmux kill-session -a && tmux kill-session && tmux ls'
alias tma='tmux a'
alias tml='tmux ls'
alias tmux="TERM=screen-256color-bce tmux -2"
tme () {
  folderName=${PWD##*/}
  if (tmux has-session -t "${folderName}"); then
    tmux -2 attach -t "${folderName}"
  else
    tmux new -s "${folderName}" -n dev -d
    tmux split-window -h -p 45
    tmux select-pane -t 1
    tmux send-keys 'vim' Enter
    tmux -2 attach-session -t "${folderName}"
  fi
}

tmd () {
  folderName=${PWD##*/}
  if (tmux has-session -t "${folderName}"); then
    tmux -2 attach -t "${folderName}"
  else
    tmux new -s "${folderName}" -n dev -d
    tmux new-window -t "${folderName}:2" -n "live-reload"
    if [ "$(uname)" == "Darwin" ]; then
      tmux send-keys 'npm run browser:mac' Enter
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
      tmux send-keys 'npm run browser:linux' Enter
    fi
    tmux split-window -h
    tmux send-keys 'npm run live-reload' Enter
    tmux select-window -t "${folderName}:1"
    tmux split-window -v -p 25
    tmux split-window -h -p 60
    tmux send-keys 'npm run watch:test:unit-api' Enter
    tmux split-window -h -p 33
    tmux send-keys 'npm start' Enter
    tmux select-pane -t 2
    tmux select-pane -t 1
    tmux send-keys 'vim' Enter
    tmux send-keys ':vsp' Enter
    tmux -2 attach-session -t "${folderName}"
    :vsp
  fi
}

tmdd () {
  folderName=${PWD##*/}
  if (tmux has-session -t "${folderName}"); then
    tmux -2 attach -t "${folderName}"
  else
    tmux new -s "${folderName}" -n dev -d
    tmux new-window -t "${folderName}:2" -n "live-reload"
    if [ "$(uname)" == "Darwin" ]; then
      tmux send-keys 'npm run browser:mac' Enter
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
      tmux send-keys 'npm run browser:linux' Enter
    fi
    tmux split-window -h
    tmux send-keys 'npm run live-reload' Enter
    tmux select-window -t "${folderName}:1"
    tmux split-window -v -p 25
    tmux split-window -h -p 58
    tmux send-keys 'npm run watch:test:unit-api' Enter
    tmux split-window -h -p 57
    tmux send-keys 'npm start' Enter
    tmux select-pane -t 2
    tmux select-pane -t 1
    tmux send-keys 'vim' Enter
    tmux send-keys ':vsp' Enter
    tmux send-keys ':vsp' Enter
    tmux -2 attach-session -t "${folderName}"
    :vsp
  fi
}
bind -r '\C-s'
stty -ixon

# Don't close Terminal with C-d
set -o ignoreeof

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[31m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[m\]$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=vim

if [ "$(uname)" == "Darwin" ]; then
  # Do something under Mac OS X platform
  export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
  complete -C '/usr/local/bin/aws_completer' aws
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under GNU/Linux platform
  if [ -f ~/.bashrc ]; then
    source ~/.bashrc
  fi
  complete -C '/home/sergej/.local/bin/aws_completer' aws
  # capslock as esc and ctrl
  setxkbmap -option 'caps:ctrl_modifier'
  xcape -e 'Control_L=Escape'
fi
. ~/git-completion.bash
