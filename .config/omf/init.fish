function la
    ls -latrh $argv
end

function fuck
    sudo $history[1]
end

function pjson
  python -m json.tool $argv | pygmentize -l json
end

function fish_user_key_bindings
    bind § forward-char
end
