#instant prompt prints prompt instantly upon Zsh startup allowing you to start typing while plugins are still loading.
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# This sets up colors properly

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add exports from your profile
source ~/.profile

# Path to your oh-my-zsh installation.
export ZSH="/home/kuba/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# my old theme
#ZSH_THEME="bira"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_MODE="nerdfont-complete"
# My aliases

# open IDE's
alias i="/snap/intellij-idea-ultimate/current/bin/idea.sh"
alias c="/snap/clion/current/bin/clion.sh"
alias p="/snap/pycharm-professional/current/bin/pycharm.sh"
alias ana="conda activate 
anaconda-navigator"

# config files
alias zshc="nvim ~/.zshrc"
alias zshu="source ~/.zshrc"
alias nvimc="cd ~/.config/nvim/"
alias youtube-dlc="nvim ~/.config/youtube-dl/config"

# working directories
alias doc="~/Documents"
alias dl="~/Downloads"

#overwrite ls with a modern ls "exa", it provides icons for files
alias ls="exa --grid --color auto --icons --sort=type --git" 
alias o="xdg-open"
alias v="nvim"
alias gsm="gnome-system-monitor"
alias tp='trash-put'
alias rbox='rhythmbox'
#download a youtube video
alias youtube-dl="~/.local/bin/youtube-dl"
# download youtube video as mp3, duplicate downloaded videos are disallowed
alias youtube-dl-mp3="youtube-dl -o '~/Music/%(title)s.%(ext)s' --download-archive '~/Music/downloaded.txt' --no-post-overwrites -ciwx --extract-audio --audio-format mp3"
# connect bluetooth to my headphone Doqaus
alias condoqaus='bluetoothctl connect 22:22:22:88:4B:22'
# this alias I used instead of the regular git when we want to interact with our configuration repository.
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'

# functions

# command and go to it
mdc(){md $1 && cd $1}
cpc(){cp $1 $2 && cd $2}
mvc(){mv $1 $2 && cd $2}

# case sensitive search through whole system for a 
# certain file and move to his directory 
beam() 
{ 
    # -i means case insensitive	
    # ldir=$(locate -i $1 | egrep -i "$1$" | head -n 1); 
    ldir=$(locate $1 | egrep "$1$" | head -n 1); 
     if [[ -d $ldir ]]; then  
        echo $ldir;
        cd $ldir;
    else
        echo "no directory "$ldir;
    fi
}
#open key files
key(){
     if [ -z "$1"]; then
	cd ~/Hotkeys
     else 
   	v ~/Hotkeys/$1*
     fi
}


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kuba/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kuba/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kuba/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kuba/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
#DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions autojump)
. /usr/share/autojump/autojump.sh


#plugins=(z zsh-autosuggestions)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#neccesary fo fix bugs in python
#export PATH=/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH

#neccesary to start Laravel Installer from terminal 
export PATH=/home/kuba/.config/composer/vendor/bin:$PATH

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
