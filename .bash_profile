alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ls='ls -GFh'
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias c='clear'                             # c: Clear terminal display
alias ag='ag --hidden'                      # include dotfiles
alias vi='vim'
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd: Makes new Dir and jumps inside

alias tmk='tmux kill-session -t ${PWD##*/} && tmux ls'
alias tmka='tmux kill-session -a && tmux kill-session && tmux ls'
alias tma='tmux a'
alias tml='tmux ls'
tmd () {
  folderName=${PWD##*/} 
  echo ${folderName}
  tmux new -s "${folderName}" -n dev -d 
  tmux new-window -t "${folderName}:2" -n "etc"
  tmux select-window -t "${folderName}:1"
  tmux split-window -h -p 45
  tmux select-pane -t 1
  tmux send-keys 'vim' Enter
  tmux -2 attach-session -t "${folderName}"
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

if [ "$(uname)" == "Darwin" ]; then

  # Do something under Mac OS X platform        
  trash () { command mv "$@" ~/.Trash ; }     # trash: Moves a file to the MacOS trash
  alias atom='open -a Atom'		    # atom: Opens Atom Editor
  alias f='open -a Finder ./' # f: Opens current directory in MacOS Finder
  export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  # Do something under GNU/Linux platform
  if [ -f ~/.bashrc ]; then
    source ~/.bashrc
  fi
fi
