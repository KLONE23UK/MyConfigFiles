##### .ZSHRC #####
##### Ryan Gilluley #####

### GENERAL ###

export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="alanpeabody"

# Update oh my zsh automatically
zstyle ':omz:update' mode auto

# Pasting Fix
DISABLE_MAGIC_FUNCTIONS="true"

#**Unsure**
autoload -Uz compinit
compinit
_comp_options+=(globdots)

unsetopt HIST_VERIFY


### Plugins ### 
plugins=(
    zsh-autosuggestions
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'


### Initial Startup ###

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


# Set default Editor
export EDITOR='vim'


### ALIAS'S ###
alias wt="~/Development/Bash/WebTemplate/create_web_template.sh"
alias mu="~/Development/Bash/MpvLists/musicStarter" 
alias st="brave-browser https://127.0.0.1:8384/#"
alias t="sudo mount /dev/sda1 ~/MOUNT/"
alias shut="sudo shutdown now"
alias reboot="sudo reboot now"
alias update="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade"
alias cls="clear"

### FUNCTIONS ###



### END ###

# Source
source $ZSH/oh-my-zsh.sh

# Set Vim mode
bindkey -v
