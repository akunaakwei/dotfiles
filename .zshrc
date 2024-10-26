# zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local}/share/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# path
export PATH="$HOME/.local/bin:$PATH"


# if on msys set bpick variable to windows
BPICK=""
if [[ "$(uname -a)" == *Msys ]]; then
    BPICK="*x86_64*windows*.zip"
fi

# starship prompt
export STARSHIP_CONFIG="$HOME/.starship.toml"
zinit ice as"command" from"gh-r" bpick"$BPICK"\
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# zoxide
zinit ice as"command" from"gh-r" bpick"$BPICK"\
          atclone"./zoxide init zsh > init.zsh;" \
          atpull"%atclone" src"init.zsh"
zinit light ajeetdsouza/zoxide

# eza (ls alternative)
zinit ice from"gh-r" as"program"bpick"$BPICK" atinit"rm ~/.local/bin/eza; ln eza ~/.local/bin/eza"
zinit light eza-community/eza
export _EZA_PARAMS=('--git' '--group' '--group-directories-first' '--time-style=long-iso' '--color-scale=all')
zinit light z-shell/zsh-eza

# zinit plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light fourdim/zsh-archlinux

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select=1