if command -s git &>/dev/null
    if command -s hub &>/dev/null
        alias git hub
    end

    alias g git
end
