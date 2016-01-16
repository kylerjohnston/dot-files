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

export PATH=/usr/local/bin:$PATH

# Customize to your needs...

export NVM_DIR="/Users/kyle/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#Base16 Shell
BASE16_SHELL="$HOME/.vim/bundle/vim-hybrid-material/base16-material/base16-material.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
