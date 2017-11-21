alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias rm='rm -rf'                           # always delete recursive
alias ls='ls -GFh'
alias ll='ls -FGlAh'                        # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                   # Go back 3 directory levels
alias .....='cd ../../../../'               # Go back 4 directory levels
alias ag='ag --hidden'                      # include dotfiles
alias f='find . -name'                      # search for files in current folder by name
alias ssh='ssh -oStrictHostKeyChecking=no'  # don't check known_hosts
alias fci='find . -iname'                   # search for files in current folder case insensitive
alias vi='vim'
alias iv='vim'
# cd enhancements
cd() { builtin cd "$@"; ls -l; }            # Always list directory contents upon 'cd'
alias cdd='cd ~/dotfiles'
alias cdw='cd ~/workspace'
alias cdp='cd $(git rev-parse --show-toplevel)' # goto git project root
alias cdl='cd -'                            # goto last folder

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
export PS1="\[\033[31m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[m\]\n\$ "
export CLICOLOR=1

export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=vim
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# fzf plugin
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
