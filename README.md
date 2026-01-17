# Quick Start

## Windows msys
```bash
pacman -S zsh git stow mingw-w64-ucrt-x86_64-eza mingw-w64-ucrt-x86_64-zoxide mingw-w64-ucrt-x86_64-starship mingw-w64-ucrt-x86_64-fzf
git clone https://github.com/akunaakwei/dotfiles.git
cd dotfiles
MSYS=winsymlinks:nativestrict stow .
```
Use the following command line for terminal: `C:/msys64/msys2_shell.cmd -defterm -here -no-start -ucrt64 -shell zsh`

## Ubuntu 24
```bash
curl -sS https://starship.rs/install.sh | sh
sudo apt install zsh stow eza zoxide fzf
git clone https://github.com/akunaakwei/dotfiles.git
cd dotfiles
stow .
chsh -s $(which zsh)
```