# Neovim Config

## Project Details

My personal Neovim setup, written in Lua and managed with [lazy.nvim](https://github.com/folke/lazy.nvim). It aims to be clean, fast and keyboard-driven.

## Features and Plugins

- **Plugin manager:** lazy.nvim, with plugins loaded asynchronously
- **Color scheme:** zenbones, a low-noise theme
- **Status line:** lualine, themed to match zenbones
- **File explorer:** neo-tree (`Ctrl+n`)
- **Syntax highlighting:** nvim-treesitter
- **Fuzzy finder:** telescope (`Ctrl+p` for files, `<Space>fg` for live grep)
- **Start screen:** alpha-nvim

## Installation

**Requirements:** Neovim 0.10 or later, Git, a C compiler (for treesitter parsers), and [ripgrep](https://github.com/BurntSushi/ripgrep) (for live grep).

1. Back up any existing config (optional).

   - Linux/macOS: `mv ~/.config/nvim ~/.config/nvim.bak`
   - Windows (PowerShell): `Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak`

2. Clone this repository.

   - Linux/macOS:
     ```bash
     git clone https://github.com/mowtiie/Neovim-Config ~/.config/nvim
     ```
   - Windows (PowerShell):
     ```powershell
     git clone https://github.com/mowtiie/Neovim-Config $env:LOCALAPPDATA\nvim
     ```

3. Start Neovim. Plugins install automatically on first launch.

   ```bash
   nvim
   ```

## License

Released under the [MIT License](LICENSE).
