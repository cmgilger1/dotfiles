set -x EDITOR nvim

if not set -q $WEZTERM_PANE
  set -x NVIM_LISTEN_ADDRESS "/tmp/nvim$WEZTERM_PANE"
end

set -x FZF_DEFAULT_COMMAND 'fd --type file --hidden --no-ignore --exclude .git --exclude build --exclude tags --exclude .cache'
set -x FZF_DEFAULT_OPTS '--height 10% --reverse --no-bold'
set -x FZF_CTRL_T_COMMAND ''

# disable underlining paths by default
set fish_color_valid_path

function fish_prompt -d "Write out the prompt"
    echo (set_color blue)'caroline@fish'(set_color normal) ' '
end

set -x AARCH64_SDK "/home/caroline/ti/ti-am62x-sdk/"

export LS_COLORS="$(vivid generate iceberg-dark)"

bind -e \el 
bind \el forward-char

set -x NVIM_DIR "$HOME/.nvm"

fish_add_path -p "$HOME/bin/cmake-3.28.1-linux-x86_64/bin/"
fish_add_path -p "$HOME/.cargo/bin/"
fish_add_path -p "$HOME/tools/nodejs/bin/"
fish_add_path -p "$HOME/bin"
fish_add_path -p "$HOME/.local/bin"

set -x MASON "$HOME/.local/share/mason"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

bass . ~/qnx/qnx710/qnxsdp-env.sh 2>&1 > /dev/null
