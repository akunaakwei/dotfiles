# fix windows symlinks on msys
export MSYS=winsymlinks:nativestrict

# zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local}/share/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone --quiet --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# custom variables
export GOBIN=$(cygpath -wa ~/.local/bin)

# autocomplete
autoload -Uz compinit && compinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# path
path+=("$(cygpath $PROGRAMFILES)/Microsoft VS Code/bin")
path+=("$HOME/.local/bin")

# starship prompt
export STARSHIP_CONFIG="$HOME/.starship.toml"
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# fzf
eval "$(fzf --zsh)"
zinit ice wait lucid atinit"source fzf-git.sh" has"fzf"
zinit light junegunn/fzf-git.sh

# eza (ls alternative)
export _EZA_PARAMS=('--git' '--group' '--group-directories-first' '--time-style=long-iso' '--color-scale=all')
zinit ice wait lucid has"eza"
zinit light z-shell/zsh-eza

# zinit plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light fourdim/zsh-archlinux

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select=1

# history
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=290000
SAVEHIST=$HISTSIZE
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect              # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu

# keybindings
bindkey "^[[1;5C" forward-word # ctrl+right
bindkey "^[[1;5D" backward-word # ctrl+left
bindkey "^[[3~" delete-char # delete
bindkey "^[[3;5~" delete-word # ctrl+backspace
bindkey "^[[1~" beginning-of-line # home
bindkey "^[[4~" end-of-line # end
bindkey "^[[A" history-search-backward # up
bindkey "^[[B" history-search-forward # down