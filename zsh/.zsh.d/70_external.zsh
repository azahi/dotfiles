#!/usr/bin/env zsh

# https://github.com/direnv/direnv {{{
if command -v direnv >/dev/null 2>&1 && \
    eval "$(direnv hook zsh)"
# }}}

# https://github.com/wting/autojump {{{
[[ -s /usr/share/autojump/autojump.zsh ]] && \
    source /usr/share/autojump/autojump.zsh
# }}}

# https://github.com/garabik/grc {{{
[[ -s /usr/share/grc/grc.zsh ]] && \
    source /usr/share/grc/grc.zsh
# }}}
