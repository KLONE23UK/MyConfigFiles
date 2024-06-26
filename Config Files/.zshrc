##### .ZSHRC #####
##### Ryan Gilluley #####

### GENERAL ###

# Exports
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"
export EDITOR="vim"
export ANSIBLE_INVENTORY="$HOME/Development/Ansible/first-project/inventory"
export ANSIBLE_PLAYBOOKS="$HOME/Development/Ansible/first-project/playbooks"

# Theme
ZSH_THEME="af-magic"

# Update oh my zsh automatically
zstyle ':omz:update' mode auto

# Pasting Fix
DISABLE_MAGIC_FUNCTIONS="true"

# Standered Auto complete
autoload -Uz compinit
compinit
_comp_options+=(globdots)

unsetopt HIST_VERIFY


### Plugins ### 

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'


### PATHS ###

# Set Batcat thme
export BAT_THEME="Sublime Snazzy"
# Doom Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

### ALIAS'S ###

# General
alias shut="sudo shutdown now"
alias reboot="sudo reboot now"
alias cls="clear"
alias grep="grep --color=auto"
alias trace="traceroute $1"
# Source .zshrc
alias sr="cls;source ~/.zshrc;echo \"ZSH Reloaded!\""
# Print private ip address
alias mip="hostname -I | awk '{print \$1}'"
alias cat="bat -p --paging=never $1"

# Common
# Fully Update System
alias update="sudo pacman -Syyyu && clear"
# Compare differences in two files side by side
alias diffy="diff -y $1 $2"
# Count the number of files in the current directory
alias ct="ls -l | wc -l"
# Watch number of files/directories in the current directory
alias wct="watch 'ls -l | wc -l'"
# List size of directories in the current directory sorted by largest size
alias dua="du -sh * | sort -rh | awk 'BEGIN {print \"SIZE   \",\"NAME\" \"\n---------------------}\"}; {print}'"
# Print only the time
alias nt="cls;date | awk '{print \$4}'"

# Corrections
alias sl="ls"
alias dc="cd"
alias cdc="cd"

# ODIN Spacific
# Run the create_web_template.sh script in the current directory
alias wt="~/Development/Bash/WebTemplate/create_web_template.sh"
# Run musicStarter script
alias mu="~/Development/Bash/MpvLists/musicStarter" 
# Open SyncThing Web Gui
alias st="brave-browser https://127.0.0.1:8384/#"
# Mount the Jellyfin HDD
alias t="sudo mount /dev/sda1 ~/MOUNT/OrangeHD/"
# Start matrix show
alias mat="cmatrix -C blue -au 10"
# Ruby shortcut
alias r="ruby"
# Python3 shortcut
alias p="python3"
# Run main.py
alias pm="python3 main.py"
# Run nvim
alias vim="nvim"
# Run vim
alias ogv="/usr/bin/vim"

# better fzf
alias fzf="fzf --preview 'batcat --color=always {}' -q "
# highlight date in calender 
alias cal="ncal -b"

alias pd="pandoc -o"
# Open emacs in terminal
alias emacs="emacs -nw"
# Full shred
alias shred="shred -uvz -n 10"

## Ansible
alias update-gcloud="ansible-playbook -i $ANSIBLE_INVENTORY $ANSIBLE_PLAYBOOKS/update_systems/update_system_apt.yml"

### END ###

# Source

source $ZSH/oh-my-zsh.sh

alias ls="exa --icons"

# Set Vim mode
bindkey -v
# Enable reverse history search with vim mode enabled
bindkey '^R' history-incremental-search-backward
