# start docker automatically when open wsl (bash) shell
sudo service docker status || sudo service docker start

#instant prompt prints prompt instantly upon Zsh startup allowing you to start typing while plugins are still loading.
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup
plugins=(git zsh-syntax-highlighting zsh-autosuggestions autojump)
. /usr/share/autojump/autojump.sh

#plugins=(z zsh-autosuggestions)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8



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
# mtsm
# start wildfly (mtsm Backend)

# open IDE's
#alias i="/snap/intellij-idea-ultimate/current/bin/idea.sh"
#alias c="/snap/clion/current/bin/clion.sh"

# config files
alias zshc="nvim ~/.zshrc"
alias zshu="source ~/.zshrc"
alias nvimc="cd ~/.config/nvim/"

#working directories
#alias doc="~/Documents"
#alias dl="~/Downloads"
alias .config="~/.config"
alias naum="cd /mnt/c/Users/naum"
alias mtsm="cd /mnt/c/Users/naum/Documents/workspace/mtsm"
alias mtsm-log="v /mnt/c/Users/naum/Documents/workspace/mtsm/wildfly/standalone/log/server.log"

#overwrite ls with a modern ls "exa", it provides icons for files
#alias ls="exa --grid --color auto --icons --sort=type --git"
alias ls='exa --grid --sort=type'
alias l="exa --grid --color auto -l --sort=type"

#overwrite linux commands with windows command
#cmd.exe is to execute a batch file in windows, nmp.cmd is the command for npm in windows
alias npm="cmd.exe /mnt/c/Users/naum/AppData/Roaming/npm/npm.cmd"
alias git="git.exe"

#execute batch files from linux
alias bat="cmd.exe /c"
alias o="xdg-open"
alias v="nvim"
alias tp='trash-put'
# this alias I used instead of the regular git when we want to interact with our configuration repository.
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'


# functions

# command and go to it
mdc(){md $@ && cd ${@: -1}}
cpc(){cp $@ ${@: -1} && cd ${@: -1}}
mvc(){mv $@ && cd ${@: -1}}

# George Ornbo (shapeshed) http://shapeshed.com
# License - http://unlicense.org
# Fixes a corrupt .zsh_history file
zshHistoryFix() {
mv ~/.zsh_history ~/.zsh_history_bad
strings -eS ~/.zsh_history_bad > ~/.zsh_history
fc -R ~/.zsh_history
rm ~/.zsh_history_bad
}

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

lvim_uninstall() {
rm -rf ~/.local/share/lunarvim

sudo rm /usr/local/bin/lvim

rm -rf ~/.local/share/applications/lvim.desktop
}
lvim_install(){
bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/master/utils/installer/install.sh)
}

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

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export NVM_DIR="/home/kuba/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
