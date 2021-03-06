if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

if [[ `uname` == 'Darwin' ]]; then

    export CLICOLOR=true
    export LSCOLORS="gxfxbEaEBxxEhEhBaDaCaD"
    eval `gdircolors ~/.dir_colors`
    zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
    autoload -Uz compinit
    compinit
else
    eval `dircolors ~/.dotfiles/system/dircolors.256dark`
fi

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

# ZLE options
zle -N newtab

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^r' history-incremental-search-backward
bindkey '^A' beginning-of-line

export KEYTIMEOUT=1
