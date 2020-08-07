#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
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
alias cdd='cd ~/dotfiles'
alias cdw='cd ~/workspace'
alias cdp='cd $(git rev-parse --show-toplevel)' # goto git project root
alias cdl='cd -'                            # goto last folder
alias pip='pip2.7'

function chpwd() {
  ls -a
}

export EDITOR=vim

PATH="$HOME/.local/bin:$HOME/Library/Python/2.7/bin:$PATH"

#nvm
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/sergej/.sdkman"
[[ -s "/Users/sergej/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/sergej/.sdkman/bin/sdkman-init.sh"
source /usr/local/Cellar/awscli/2.0.33/libexec/bin/aws_zsh_completer.sh
