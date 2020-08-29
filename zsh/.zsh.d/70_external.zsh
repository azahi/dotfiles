#!/usr/bin/env zsh

# https://github.com/direnv/direnv {{{
[[ $(command -v direnv) ]] \
    && eval "$(direnv hook zsh)"
# }}}

# https://github.com/wting/autojump {{{
[[ -s /usr/share/autojump/autojump.zsh ]] && \
    source /usr/share/autojump/autojump.zsh
# }}}

# https://github.com/garabik/grc {{{
[[ -s /usr/share/grc/grc.zsh ]] && \
    source /usr/share/grc/grc.zsh
# }}}

# https://github.com/junegunn/fzf {{{
[[ -s /usr/share/fzf/key-bindings.zsh ]] && \
    source /usr/share/fzf/key-bindings.zsh
# }}}
