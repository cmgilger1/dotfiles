set -x EDITOR nvim

if not set -q $WEZTERM_PANE
  set -x NVIM_LISTEN_ADDRESS "/tmp/nvim$WEZTERM_PANE"
end

set -x FZF_DEFAULT_COMMAND 'fd --type file --hidden --no-ignore --exclude .git --exclude build --exclude tags --exclude .cache'
set -x FZF_DEFAULT_OPTS '--height 10% --reverse --no-bold'

# disable underlining paths by default
set fish_color_valid_path

function fish_prompt -d "Write out the prompt"
    # echo (set_color green) '' (set_color magenta) '' (set_color normal)
    echo (set_color magenta) '' (set_color normal)
end

export LS_COLORS="$(vivid generate snazzy)"

bind -e \el 
bind \el forward-char

set -x NVIM_DIR "$HOME/.nvm"

fish_add_path -p "$HOME/bin/cmake-3.28.1-linux-x86_64/bin/"
fish_add_path -p "$HOME/.cargo/bin/"
fish_add_path -p "$HOME/tools/nodejs/bin/"

set -x MASON "$HOME/.local/share/mason"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
