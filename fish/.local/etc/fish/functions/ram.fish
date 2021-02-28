if command -v free &>/dev/null
    function ram -w free
        free --human --wide
    end
end
