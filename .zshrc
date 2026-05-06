# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
DEFAULT_USER="royce"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH=$PATH:/snap/bin
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$PATH:/usr/local/go/bin
export PATH="/home/royce/.config/herd-lite/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/royce/.bun/_bun" ] && source "/home/royce/.bun/_bun"

# PHP (Herd Lite)
export PHP_INI_SCAN_DIR="/home/royce/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# XDG
export XDG_DATA_DIRS="$HOME/.local/share:/usr/local/share:/usr/share"

# Aliases
alias python='python3'
alias vim='nvim'
alias xampp='sudo /opt/lampp/lampp'
alias jlox='~/Documents/github/craftinginterpreters/jlox'
alias warmane='nohup wine /media/royce/Other\ Files/Downloads/World\ of\ Warcraft\ 3.3.5a/Wow.exe &'
alias eve-ng="~/start-eve.sh"
alias artix="~/Downloads/Artix/Artix_Games_Launcher-x86_64.AppImage"
