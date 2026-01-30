# zmodload zsh/zprof

# GIT BRANCH IN PROMPT
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{green}${vcs_info_msg_0_}%f$ '

# PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.config/scripts:$PATH"

# ALIAS
alias vi="nvim"
alias l="ls -lah --color=auto"
alias h="bash -c history_fuzzy_search.sh"

. "$HOME/.local/bin/env"

if [ -f $HOME/.secrets ]; then
    source $HOME/.secrets
fi

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# zprof

