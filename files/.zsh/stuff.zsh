HISTSIZE=100000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Automatically go to dir (without cd)
setopt AUTO_CD

# menu completion
autoload -Uz compinit; compinit
zstyle ':completion:*' menu select

# hist search text up arrow
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

# line navigation
bindkey '^E' end-of-line
bindkey '^A' beginning-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# edit line in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# split words like bash
setopt SH_WORD_SPLIT
