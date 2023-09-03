# myconfig

### Contains my config files for linux
- zsh (~/.zshrc)
- bash (~/.bashrc)
- nvim (~/.config/nvim)
- powerlevel10k (~/.p10k.zsh)
- gnome terminal settings backup (~/.gnome_terminal_settings_backup.txt)
- git config (~/.gitconfig)
- InelliJ IDEA settings (~/.config/JetBrains/IntelliJIdea2022.3/settings.zip)
- vscode backup (~/.config/Code/User/sync)

## Create bare Git repository

###  What is a bare Git repository
- its a way to store dotfiles
- The technique consists in storing a Git bare repository in a "side" folder (like $HOME/.myconfig)
- use alias "config" so that commands are run against that repository and not the usual .git local folder, which would interfere with any other Git repositories around.
- more details on https://www.atlassian.com/git/tutorials/dotfiles

### Setup new bare Git repository for config files (is not needed before cloning this repo)
```bash
# create a bare repo
git init --bare $HOME/.myconfig
# write the alias config to a shell config file, this alias acts like git  
echo "alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'" >> $HOME/.bashrc
config config --local status.showUntrackedFiles no
# connect your repo to github.com
git remote add <name> <url>
```

## Setup

### Clone my config repo to new system
- make sure that you rename/backup/remove all already exisiting dotfiles that are in the repo
- when you dont generate ssh key then you have to follow this documentation: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
```bash
git clone --bare git@github.com:kuba22z/myconfig.git $HOME/.myconfig
```
```bash
# create alias config, this alias acts like git  
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
# get all dotfiles from the repo
config checkout
config config --local status.showUntrackedFiles no
```

### Install required commands
```bat
sudo apt-get update
sudo apt install xdg-utils curl wget git-all ssh
sudo apt-get install zip locate

```
#### zsh
```bash
sudo apt-get install zsh
#set zsh as default, for root terminal need sudo ... 
chsh -s $(which zsh)
```

#### ohmyzsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
#### nvim
```bash
sudo apt install neovim
```
#### vim-plug
- simplifies the installation of plugins in vim/nvim

install vim-plug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
install nvim plugins
```bash
nvim +'PlugInstall --sync' +qa 
```
#### powerlevel10k
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
For mac:
```bash
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
```
#### pulgins
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo apt-get install autojump zsh-autosuggestions zsh-syntax-highlighting
```

#### nerdfonts
Go to https://www.nerdfonts.com/font-downloads and download a font of your choice 

My recommendations

For Windows: Caskaydia Cove Nerd Font
- unzip the font, click on Caskaydia Cove Nerd Font Complete Windows Compatible Bold Italic.otf and install
- go to windows terminal settings -> appearance and choose Caskaydia Cove NF 

For Linxu: FiraCode Nerd Font
- unzip the font, click on FiraCode.otf and install

For Mac:
```bash
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
```
And go to itermi2 preferences and change text font of your profile  
see https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/

#### exa
install older version of exa without bugs:
```bash
sudo wget -P /usr/local/bin https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip && cd /usr/local/bin
sudo unzip exa-linux-x86_64-v0.10.0.zip 
sudo mv man /usr/share/man/man1 
sudo mv completions /usr/local/share/zsh/site-functions
sudo mv bin/exa ./
sudo rm exa-linux-x86_64-v0.10.0.zip
```
install latest version of exa (with --git bug)
```bash
sudo apt install exa
```
- then change the font of your terminal to a nerdfont via terminal gui (doesnt works on windows)
more details on https://the.exa.website/install/linux#manual

#### restore gnu terminal settings
```bat
restore-terminal-backup
```
