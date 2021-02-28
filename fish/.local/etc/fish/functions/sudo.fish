if command -v doas &>/dev/null and not command -s sudo &>/dev/null
    function sudo -w doas
        doas $argv
    end
end
