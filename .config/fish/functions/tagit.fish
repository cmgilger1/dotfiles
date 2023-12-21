function tagit
    ctags --exclude=build --exclude=.git '--exclude=*.txt' --recurse=yes --excmd=number .
end
