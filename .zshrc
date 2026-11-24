# zmodload zsh/zprof

# HOMEBREW
eval "$(/opt/homebrew/bin/brew shellenv)"

# GIT BRANCH IN PROMPT
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{green}${vcs_info_msg_0_}%f$ '

# ALIAS
alias vi="vim"
alias l="ls -lah --color=auto"

if [ -f "$HOME/.local/bin/env" ]; then
    . "$HOME/.local/bin/env"
fi

if [ -f $HOME/.secrets ]; then
    source $HOME/.secrets
fi

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# FZF (Ctrl+R history search)
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

# Machine-only config (not in the repo)
if [ -f "$HOME/.zshrc.local" ]; then
    source "$HOME/.zshrc.local"
fi

# zprof
