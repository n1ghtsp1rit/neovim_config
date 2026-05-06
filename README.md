# 🌌 MISTVIM

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg)](https://neovim.io/)
[![Maintainer](https://img.shields.io/badge/Maintainer-m1stD3V-blueviolet)](https://github.com/m1stD3V)

A highly modular, aesthetically pleasing, and efficient Neovim configuration built for speed and organization. **MISTVIM** is designed to provide a centered, distraction-free environment with quick access to projects and system configurations.

---

## ✨ Features

- 🧩 **Modular Architecture**: Organized into logical components (Core, Plugins, UI) for easy maintenance.
- 🎯 **Centered UI**: Command panel and search popups are centered via `noice.nvim` for a focused workflow.
- 🏠 **Custom Dashboard**: A beautiful `alpha-nvim` home screen with quick-access buttons:
  - **New File**: Instant empty buffer.
  - **Find File**: Global file search via Telescope.
  - **Projects**: Custom picker for your `~/projects` directory.
  - **Configuration**: Filtered picker for `hypr`, `wezterm`, and `nvim` configs.
- 🎨 **Catppuccin Mocha**: A dark, vibrant theme with transparent background support.
- 🛠️ **Full LSP Support**: Pre-configured for TypeScript, C#, and C++ with Mason for easy management.
- 🔍 **Telescope Integration**: Powerful fuzzy finding for files, grep, and custom directories.
- 🌳 **File Explorer**: Integrated `nvim-tree` for intuitive file management.

---

## 📋 Prerequisites

To get the most out of MISTVIM, ensure you have the following installed:

- **Neovim** (v0.10 or higher)
- **Nerd Font**: [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) (Recommended for icons)
- **Git** (For plugin management)
- **Find** (For custom project/config pickers)
- **C Compiler** (For some LSP/Treesitter features)

---

## 🚀 Installation

1. **Back up your current config**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone MISTVIM**:
   ```bash
   git clone https://github.com/m1stD3V/nvim_config.git ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```
   *Lazy.nvim will automatically bootstrap and install all plugins on the first run.*

---

## 📁 Modular Structure

MISTVIM follows a strict modular structure to keep your configuration clean and manageable:

```text
~/.config/nvim/
├── init.lua                # Entry point (requires core/plugins)
└── lua/
    └── mistvim/
        ├── core/
        │   ├── options.lua  # General settings (numbers, tabs, etc.)
        │   └── keymaps.lua  # Global keybindings
        └── plugins/
            ├── init.lua     # Lazy.nvim bootstrap & imports
            ├── ui.lua       # Dashboard, Noice, Lualine, Catppuccin
            ├── lsp.lua      # LSP, Mason, & Autocomplete
            ├── telescope.lua# Telescope search settings
            └── utils.lua    # Tree explorer & utilities
```

---

## ⌨️ Keybindings

| Key | Action |
|-----|--------|
| `<Leader>e` | Toggle File Tree |
| `<Leader>ff` | Find Files |
| `<Leader>fg` | Live Grep |
| `gd` | Go to Definition |
| `K` | Hover Documentation |
| `<Leader>rn` | Rename Symbol |
| `<Leader>ca` | Code Action |

---

## 👤 Author

**m1stD3V**
- GitHub: [@m1stD3V](https://github.com/m1stD3V)

## 📄 License

This project is licensed under the **GPL-3.0 License**. See the [LICENSE](LICENSE) file for details.
