#run fihs_config to open the config browser 

alias p="pnpm"
alias lg="ls | grep"
alias vi="nvim"
alias o="open ."
alias e="exit"
alias l="ls -1"
alias lf="l -d */"
alias lsf="ls -d */"
alias cc="cd ~"

#Folders
alias coding="cd ~/Personal\ Work/Coding/"
alias opcoding="open ~/Personal\ Work/Coding/"

alias algo="cd ~/Personal\ Work/Coding/Projects/Algorithm\ Project"
alias opalgo="open ~/Personal\ Work/Coding/Projects/Algorithm\ Project"

alias proj="cd ~/Personal\ Work/Coding/Projects"
alias opproj="open ~/Personal\ Work/Coding/Projects"

#Config files
alias fishrc="nvim ~/.config/fish/config.fish"
alias alacrc="nvim ~/.config/alacritty/alacritty.toml"
alias vimrc="cd ~/.config/nvim/lua/user"
alias tmuxrc="nvim ~/.tmux.conf"
alias gitrc="nvim ~/.config/fish/git_aliases.fish"
alias tiderc="nvim ~/.config/fish/tide_config.fish"

#Notes
alias vc="nvim ~/Personal\ Work/Coding/Command\ Line/vim_commands"
alias lc="nvim ~/Personal\ Work/Coding/Command\ Line/Linux\ Commands\ &\ Terminal.md"
alias tmc="nvim ~/Personal\ Work/Coding/Command\ Line/tmux_commands.txt"

#Tmux
function ide
    tmux split-window -v -p 30
    tmux split-window -h -p 66 
    tmux split-window -h -p 50 
end

function todos
  tmux new-session -d -s TODOS
  tmux split-window -h -p 66 -t TODOS
  tmux split-window -h -p 50 -t TODOS
  tmux send-keys -t 0 "nvim /home/filip/Time\ management\ \&\ Books/General-Todos.txt" Enter ":tabedit Time\ management\ \&\ Books/Todos.txt" Enter
  tmux send-keys -t 1 "nvim Time\ management\ \&\ Books/Today-Todos.txt" Enter
  tmux send-keys -t 2 "nvim /home/filip/Personal\ Work/Business/Business-Todos.txt" Enter\; \
  send-keys ":tabedit /home/filip/Personal\ Work/Finance/Finance-Todos.txt" Enter\; \
  send-keys ":tabedit /home/filip/Personal\ Work/Coding/Programming-TODOS.txt" Enter
  tmux select-layout -t TODOS even-horizontal
  tmux rename-window -t TODOS:0 "fish"
  tmux attach-session -t TODOS
end

function t
  tmux 
  tmux rename-window -t "fish"
end



set fish_greeting

#TIDE configurations
source ~/.config/fish/tide_config.fish

#GIT configurations
source ~/.config/fish/git_aliases.fish

set -x ANDROID_HOME $HOME/Library/Android/Sdk
fish_add_path  $ANDROID_HOME/emulator  $ANDROID_HOME/platform-tools
#Android Sutudio / React Native configurations
# set -x ANDROID_SDK_ROOT $HOME/Library/Android/Sdk
# fish_add_path  $ANDROID_SDK_ROOT/emulator  $ANDROID_SDK_ROOT/platform-tools


#Powerline
# set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
# source /usr/share/powerline/bindings/fish/powerline-setup.fish
# powerline-setup

#Starship
# starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/filip/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
