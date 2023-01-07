#instant prompt prints prompt instantly upon Zsh startup allowing you to start typing while plugins are still loading.
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast zsh-syntax-highlighting zsh-autosuggestions autojump npm sudo web-search aliases jsontools)

# required for autojump
. /usr/share/autojump/autojump.sh


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

# open IDE's
alias i="/snap/intellij-idea-ultimate/current/bin/idea.sh"
alias c="/snap/clion/current/bin/clion.sh"
alias p="/snap/pycharm-professional/current/bin/pycharm.sh"

# config files
alias zshc="nvim ~/.zshrc"
alias zshu="source ~/.zshrc"
alias nvimc="cd ~/.config/nvim/"
alias p10kc="v ~/.p10k.zsh"
alias youtube-dlc="nvim ~/.config/youtube-dl/config"

# working directories
alias doc="~/Documents"
alias dl="~/Downloads"
alias .config="~/.config"

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
alias backup-terminal='dconf dump /org/gnome/terminal/ > ~/.gnome_terminal_settings_backup.txt'
alias restore-terminal-backup='dconf reset -f /org/gnome/terminal/ && dconf load /org/gnome/terminal/ < ~/.gnome_terminal_settings_backup.txt'

#fh aachen

# compiler bau
# compiles file with mini-java compiler
alias mini-javac='java -jar ~/Documents/CB/Praktikum/Praktikumsunterlagen/MiniJava-Compiler/miniJavaCompiler.jar <'
alias mini-java-funProc='java -jar ~/Documents/CB/Praktikum/Praktikumsunterlagen/MiniJavaFunProc-Compiler/miniJavaFunProcCompiler.jar <'
# compile and run with mini java compiler
run-miniJava(){ mini-javac $1 && java miniJavaFile}
# compiler and run with mini-java-funcPronc compiler
run-miniJavaFunProc(){ mini-java-funProc $1 && java miniJavaFunProcFile} 
# run my parser/compiler on the code in input.txt
run-parser(){  javacc javacc-config.jj && cat $2 && javac "$1.java" && java $1 < $2 }
# compile my mini-java code in input.txt, translate it to Java byte code and runs the executable result.class file, $2 is the input File
run-myJava(){run-parser $1 $2 && java result}
# kryptologie
alias aribas="~/aribas165/src/aribas" 


# functions

# command and go to it
# ${@: -1} is the last argument, $@ are all arguments
mdc(){md $@ && cd ${@: -1}}
cpc(){cp $@ && cd ${@: -1}}
mvc(){ mv $@ && cd ${@: -1}}

# move files to the path that autojump finds
mvj(){ 
	pathTo2=$(autojump $2 | awk '{:t$1}');
	mv $1 $pathTo && echo $pathTo
}
# copy files to the path that autojump finds
# ${@:1:$#-1} are all arguments except the last
cpj(){ 
	array=($@)
	len=${#array[@]}
	last_arg=${@: -1}
	all_args_except_last=${array[@]:0:$len-1}
	
	pathTo=$(autojump $last_arg | awk '{print$1}') 
	cp  $pathTo && echo $pathTo
}


# case sensitive search through whole system for a certain file and move to his directory 
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

# open key files
hotkeys(){
     if [ -z "$1"]; then
	cd ~/Hotkeys
     else 
   	v ~/Hotkeys/$1*
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

#neccesary fo fix bugs in python
#export PATH=/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH

#neccesary to start Laravel Installer from terminal 
export PATH=/home/kuba/.config/composer/vendor/bin:$PATH

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

