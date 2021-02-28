if command -s fzf &>/dev/null
    set -x FZF_DEFAULT_COMMAND
    set -x FZF_DEFAULT_OPTS "--height 20% --reverse --border"
end
