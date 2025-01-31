set -x EDITOR nvim

if not set -q $WEZTERM_PANE
  set -x NVIM_LISTEN_ADDRESS "/tmp/nvim$WEZTERM_PANE"
end

set -x FZF_DEFAULT_COMMAND 'fdfind --hidden --no-ignore'
set -x FZF_DEFAULT_OPTS '--height 10% --reverse --no-bold'
set -x FZF_CTRL_T_COMMAND ''

# disable underlining paths by default
set fish_color_valid_path

function fish_prompt -d "Write out the prompt"
    echo (set_color green)' 󱞩 '(set_color normal) 
end

set -x AARCH64_SDK "/home/caroline/ti/ti-am62x-sdk/"

export LS_COLORS="$(vivid generate iceberg-dark)"

bind -e \el 
bind \el forward-char
bind \ek up-or-search
bind \ej down-or-search
bind \eh backward-char

set -x NVM_DIR "$HOME/.nvm"
bass . $NVM_DIR/nvm.sh

fish_add_path -p "$HOME/tools/nodejs/bin/"
fish_add_path -p "$HOME/bin"
fish_add_path -p "$HOME/.local/bin"
fish_add_path -p "/opt/cmake-3.30.4/bin"
fish_add_path -p "/opt/nvim-linux64/bin"

set -x XDG_CONFIG_DIRS "$HOME/.config/:$XDG_CONFIG_DIRS"


set -x MASON "$HOME/.local/share/mason"

#bass . ~/qnx/qnx710/qnxsdp-env.sh 2>&1 > /dev/null
source "$HOME/.cargo/env.fish" 
