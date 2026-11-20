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
- **Language servers:** nvim-lspconfig with mason.nvim, which installs servers for Lua, Python, JavaScript, HTML, CSS and Java (`gd` definition, `K` hover, `<Space>rn` rename, `<Space>ca` code action)
- **Completion:** blink.cmp (`Ctrl+Space` open, `Ctrl+n`/`Ctrl+p` select, `Enter` accept)
- **Auto pairs:** nvim-autopairs closes `(`, `{`, `[` and quotes for you

## Requirements

- [Neovim](https://neovim.io) 0.11 or later
- [Git](https://git-scm.com)
- A C compiler (builds the treesitter parsers)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (powers live grep)
- [Node.js](https://nodejs.org) (needed by the Python, JavaScript, HTML and CSS language servers)
- A JDK, version 21 or later (needed by the Java language server)

Install them with your package manager:

- **Windows** (PowerShell, using [winget](https://learn.microsoft.com/windows/package-manager/winget/)):
  ```powershell
  winget install Neovim.Neovim Git.Git BurntSushi.ripgrep.MSVC BrechtSanders.WinLibs.POSIX.UCRT OpenJS.NodeJS.LTS EclipseAdoptium.Temurin.21.JDK
  ```
- **macOS** ([Homebrew](https://brew.sh)):
  ```bash
  xcode-select --install
  brew install neovim git ripgrep node openjdk
  ```
- **Debian/Ubuntu**:
  ```bash
  sudo apt install neovim git ripgrep build-essential nodejs npm default-jdk
  ```
  The `apt` version of Neovim can be older than 0.11. Check with `nvim --version`, and if it's too old, install a newer release from the [Neovim releases page](https://github.com/neovim/neovim/releases).

Restart your terminal afterwards so the new commands are on your PATH.

## Installation

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
