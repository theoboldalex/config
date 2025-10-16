# Config

These are my new and improved system config files. I have purposely streamlined a lot of areas and dropped some tools that
I have relied heavily on in the past (thanks for everything tmux).

## Dependencies

I have tried to keep dependencies to a minimum but in order to get the most out of this config you will need a bare minimum of the following
installed in your environment.

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [zsh](https://www.zsh.org/)
- [vim](https://www.vim.org/) or [neovim >= v0.12](https://neovim.io/)
- [ghostty](https://ghostty.org/)
- [fzf](https://github.com/junegunn/fzf)

If using Neovim, you will also want to install the following LSP servers in your environment to get full LSP support for Go, JavaScript, TypeScript, PHP and Lua.
- [Intelephense](https://intelephense.com/)
- [Gopls](https://go.dev/gopls/)
- [Lua LS](https://github.com/LuaLS/lua-language-server)
- [VTSLS](https://github.com/yioneko/vtsls)

> [!NOTE]  
> If you have a paid license for Intelephense, place the license key in a `.txt` file at `$HOME/intelephense/license.txt`.


## Installation
If you want to use these dotfiles (looking at you [vaugenwake](https://github.com/vaugenwake)) simply clone the repo to your machine and
run `./install.sh`.

:wq
