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

### Contains my config files for linux
- zsh (~/.zshrc)
- bash (~/.bashrc)
- nvim (~/.config/nvim)
- powerlevel10k (~/.p10k.zsh)

### installing
```bat
ping 192.168.0.1
```
#### zsh
```bat
ping 192.168.0.1
```
#### ohmyzsh
```bat
ping 192.168.0.1
```
#### nvim
```bat
ping 192.168.0.1
```
#### powerlevel10k
```bat
ping 192.168.0.1
```
#### nerdfonts
```bat
ping 192.168.0.1
```
#### pulgins
```bat
ping 192.168.0.1
```
#### usefull commands
```bat
ping 192.168.0.1
```

