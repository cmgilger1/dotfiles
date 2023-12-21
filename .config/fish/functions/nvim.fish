function v -d "NVIM shortcut #1"
    nvim $argv
end

function vim -d "NVIM shortcut #2"
    nvim $argv
end

function fv -d "NVIM shortcut with FZF"
    nvim $(fzf)
end

