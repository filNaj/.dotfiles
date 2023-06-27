# My dotfiles

## Installation
- Clone repo in ~/ and `cd` into it
- Run `./install.sh`. You may need to run `chmod +x install.sh` first.
- Log out and log back in.
- In Vim, run `:PackerInstall`. MGight have to install the language servers via `:Mason` and Packer. See chris@machine videos.

If there are any problems, this [video](https://www.youtube.com/watch?v=on0jOlJ5U6A) might help. 

### **What will be installed from `install.sh`:**
- git
- tree
- tmux
- fisher
- fish
- Tide
- stow

### **What needs to be installed:**
- nvim
- alacritty
- [oi ](https://github.com/PureArtistry/oi)
- Nerdfonts 


### Folder Structure
```
$HOME
 .tmux.conf
 .gitconfig
 .config/
   alacritty/
    alacritty.toml
    alacritty.yaml
   nvim/
   fish/
    config.fish
    git_aliases.fish
    tide_config.fish
```
