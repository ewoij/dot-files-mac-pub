autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b) '
zstyle ':vcs_info:*' enable git

PROMPT_STATUS='%(?..%B%F{1}[%?]%f%b )'
PROMPT_PATH='%F{2}%1~%f '
PROMPT_VCS='%F{6}${vcs_info_msg_0_}%f'
PROMPT_END='%# '
PROMPT="${PROMPT_PATH}${PROMPT_VCS}${PROMPT_STATUS}${PROMPT_END}"
