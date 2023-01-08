# myconfig
###  This is a bare Git repository
- this is a way to store dotfiles
- The technique consists in storing a Git bare repository in a "side" folder (like $HOME/.myconfig)
- use alias "config" so that commands are run against that repository and not the usual .git local folder, which would interfere with any other Git repositories around.
- more details on https://www.atlassian.com/git/tutorials/dotfiles

### Set up bare Git repository for config files
```bat
# create a bare repo
git init --bare $HOME/.myconfig
config config --local status.showUntrackedFiles no
# write the alias config to a shell config file, this alias acts like git  
echo "alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'" >> $HOME/.bashrc
# connect your repo to github.com
git remote add <name> <url>
```
### Install dotfiles onto a new system
```bat
# create directory for bare repository
cd
mkdir .myconfig
# clone dotfiles into bare repository 
 git clone --bare https://github.com/kuba22z/myconfig $HOME/.myconfig
# Set alias config that acts like git
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
```
- make sure that you rename/backup/remove all already exisiting dotfiles that are in the repo
```bat
# get all dotfiles from the repo
config checkout
```
### Contains my config files for linux
- zsh (~/.zshrc)
- bash (~/.bashrc)
- nvim (~/.config/nvim)
- powerlevel10k (~/.p10k.zsh)
- gnome terminal settings backup (~/.gnome_terminal_settings_backup.txt)
- git config (~/.gitconfig)
- InelliJ IDEA settings (~/.config/JetBrains/IntelliJIdea2022.3/settings.zip)
- vscode backup (~/.config/Code/User/sync)

### Install required commands
```bat
sudo apt-get update
sudo apt install xdg-utils curl wget git-all ssh
sudo apt-get install zip locate

```
#### zsh
```bat
sudo apt-get install zsh
```
#### ohmyzsh
```bat
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
#### nvim
```bat
sudo apt install neovim
```
#### powerlevel10k
```bat
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
```
#### nerdfonts
```bat
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```
- then click on Droid Sans Mono for Powerline Nerd Font Complete.otf
#### pulgins
```bat
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sudo apt-get autojump

```
#### exa
```bat
sudo wget -P /usr/local/bin https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip && cd /usr/local/bin
sudo unzip exa-linux-x86_64-v0.10.0.zip 
sudo mv man /usr/share/man/man1 
sudo mv completions /usr/local/share/zsh/site-functions
sudo mv bin/exa ./
sudo rm exa-linux-x86_64-v0.10.0.zip
```
- then change the font of your terminal to a nerdfont via terminal gui (doesnt works on windows)
more details on https://the.exa.website/install/linux#manual

