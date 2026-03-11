bass source /etc/environment
set -x EDITOR nvim

fish_config theme choose "catppuccin-frappe"

set --universal FZF_DEFAULT_COMMAND 'fdfind'
set -x FZF_DEFAULT_OPTS '--height 10% --reverse --no-bold'
set -x FZF_CTRL_T_COMMAND ''

# disable underlining paths by default
set fish_color_valid_path
set pure_show_system_time true
#
# function fish_prompt -d "Write out the prompt"
#     # echo (set_color red) (pwd | sed -e "s|^$HOME|~|")
#     echo (set_color green)'  '(set_color normal) 
# end
#

bind -e \el 
bind \el forward-char
bind \ek up-or-search
bind \ej down-or-search
bind \eh backward-char

set -x NVM_DIR "$HOME/.nvm"
bass . $NVM_DIR/nvm.sh

fish_add_path --global --path "$HOME/bin"
fish_add_path --global --path "$HOME/bin"
fish_add_path --global --path "$HOME/.local/bin"
fish_add_path --global --path "/home/linuxbrew/.linuxbrew/bin"

set -gx LS_COLORS (vivid generate catppuccin-frappe)

set -x XDG_CONFIG_DIRS "$HOME/.config/:$XDG_CONFIG_DIRS"

set -x MASON "$HOME/.local/share/mason"

bass . ~/qnx/qnx710/qnxsdp-env.sh 2>&1 > /dev/null
source "$HOME/.cargo/env.fish" 

#/home/linuxbrew/.linuxbrew/bin/brew shellenv 2>&1 > /dev/null

