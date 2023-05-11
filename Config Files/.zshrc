##### .ZSHRC #####
##### Ryan Gilluley #####

### GENERAL ###

export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="eastwood"

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
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'


### PATHS ###

# Set default Editor
export EDITOR='vim'
# Set Batcat thme
export BAT_THEME="Sublime Snazzy"


### ALIAS'S ###

# General
alias shut="sudo shutdown now"
alias reboot="sudo reboot now"
alias cls="clear"
alias trace="traceroute $1"
# Source .zshrc
alias sr="cls;source ~/.zshrc;echo \"ZSH Reloaded!\""
# Print private ip address
alias mip="hostname -I | awk '{print \$1}'"
alias bat="batcat $1"

# Common
# Fully Update System
alias update="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade"
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


### FUNCTIONS ###

function initialMessage () {
    # Time
    time=`date "+%D %T"`

    # Weather
    condition=$(curl -sX GET 'https://api.weatherapi.com/v1/current.json?key=c97b2e7e2fc44f3aad0143136221712&q=Larkhall&aqi=no' | jq -r '.current.condition.text')
    temp="$(curl -sX GET 'https://api.weatherapi.com/v1/current.json?key=c97b2e7e2fc44f3aad0143136221712&q=Larkhall&aqi=no' | jq -r '.current.temp_c' )°C"
    weather="$condition $temp"
    news=$(sh /home/rgilluley/Development/API/NewsAPI/getLatestHeadline.sh)

    # Combine and Print
    inisial="\e[32m$time\e[0m $weather\n$news\n"
    echo $inisial
}


### END ###

initialMessage

# Source
source $ZSH/oh-my-zsh.sh

# Set Vim mode
bindkey -v
# Enable reverse history search with vim mode enabled
bindkey '^R' history-incremental-search-backward
