function dotfiles
    git --git-dir=$HOME/.config/ --work-tree=$HOME $argv
end
