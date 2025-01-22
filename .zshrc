# fix windows symlinks on msys
export MSYS=winsymlinks:nativestrict

# zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local}/share/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone --quiet --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# autocomplete
autoload -Uz compinit && compinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# path
export PATH="$HOME/.local/bin:$PATH"

# zinit lbin annex
zinit light zdharma-continuum/zinit-annex-binary-symlink

# if on msys set bpick variable to windows
# because otherwise zinit will download darwin executables :(
BPICK=""
if [[ "$(uname -a)" == *Msys ]]; then
    BPICK="*x86_64*windows*.zip"
fi

# starship prompt
export STARSHIP_CONFIG="$HOME/.starship.toml"
zinit ice lbin"!starship" from"gh-r" bpick"$BPICK" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# zoxide
zinit ice lbin"!zoxide" from"gh-r" bpick"$BPICK" \
          atclone"./zoxide init zsh > init.zsh;" \
          atpull"%atclone" src"init.zsh"
zinit light ajeetdsouza/zoxide

# eza (ls alternative)
zinit ice lbin"!eza" from"gh-r"
zinit light eza-community/eza
export _EZA_PARAMS=('--git' '--group' '--group-directories-first' '--time-style=long-iso' '--color-scale=all')
zinit light z-shell/zsh-eza

# zinit plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light fourdim/zsh-archlinux
zinit ice lbin"!bin/*"
zinit light z-shell/zsh-diff-so-fancy

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt share_history

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select=1

# keybindings
bindkey "^[[1;5C" forward-word # ctrl+right
bindkey "^[[1;5D" backward-word # ctrl+left
bindkey "^[[3~" delete-char # delete
bindkey "^[[3;5~" delete-word # ctrl+backspace
bindkey "^[[1~" beginning-of-line # home
bindkey "^[[4~" end-of-line # end
