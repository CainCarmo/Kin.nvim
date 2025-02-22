[//]: Header

<h1 align="center">🍡 Kin.nvim</h1>

Kin.nvim is a powerful [Neovim](https://neovim.io/) configuration, designed to deliver an efficient and optimized experience across any language. It offers the flexibility to be customized for specific languages, adapting to your workflow and maximizing your productivity.

[//]: Content

## 🚧 Requirements

### Prerequisites

Ensure you have the following installed on your system:

- **Git**: [Download](https://git-scm.com/downloads)
- **Neovim 0.9.5+**: [Installation Guide](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- **Clipboard Tool**: Required for system clipboard integration. See [Clipboard Tool](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions.

### Package Managers

You will need one of the following package managers:

- **pip**: [Installation Guide](https://pypi.org/project/pip/)
- **npm**: [Installation Guide](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- **cargo**: [Installation Guide](https://doc.rust-lang.org/cargo/getting-started/installation.html)

### Additional Tools

Make sure to have these tools installed:

- **fzf**: [Download](https://github.com/junegunn/fzf)
- **ripgrep**: [Download](https://github.com/BurntSushi/ripgrep)
- **make**: Install via package manager
  - **Ubuntu/Debian**: `sudo apt-get install build-essential`
  - **Fedora**: `sudo dnf groupinstall 'Development Tools'`
  - **Arch Linux(btw)**: `sudo pacman -S base-devel`
  - **MacOS**: `xcode-select --install`
  - **Windows**: `scoop install make`

> [!IMPORTANT]
> For Windows users, it is necessary to use Powershell 7 or higher

## 🛠️ Installation

> [!NOTE]
> There are two ways to install Kin.nvim: manually or using a script.

### Manual

<details>
<summary>Unix</summary>
<br />

1. Make a backup of your current nvim and shared folder

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

2. Setup Kin.nvim

```sh
git clone --depth 1 https://github.com/CainCarmo/Kin.nvim.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
rm -rf ~/.config/nvim/.gitignore
nvim
```

</details>

<details>
<summary>Windows</summary>
<br />

1. Make a backup of your current nvim and nvim-data folder

```pwsh
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```

2. Setup Kin.nvim

```pwsh
git clone --depth 1 https://github.com/CainCarmo/Kin.nvim.git $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
Remove-Item $env:LOCALAPPDATA\nvim\.gitignore -Recurse -Force
nvim
```

</details>

### Script

You can also use the provided installation scripts for a more automated setup:

- For Unix-based systems, run the following command in your terminal:

```sh
bash <(curl -s https://raw.githubusercontent.com/CainCarmo/Kin.nvim/main/utils/scripts/installer.sh)
```

- For Windows systems, run the following command in PowerShell:

```pwsh
pwsh -c "iwr https://raw.githubusercontent.com/CainCarmo/Kin.nvim/main/utils/scripts/install.ps1 -UseBasicParsing | iex"
```

## 📜 Knvim File

The `knvim.lua` file is the main configuration file for `Kin.nvim`. It is responsible for setting global Neovim options, configuring plugins, and defining themes and other visual elements. Below is a detailed description of how to use and configure this file.

> [!TIP]
> The `knvim.lua` file is located in the `lua/user/knvim.lua` directory. It is automatically loaded by Neovim during startup.

| Option                                | Default                 | Description                                           |
| ------------------------------------- | ----------------------- | ----------------------------------------------------- |
| `knvim.startup.header`                | `ascii.headers.default` | Defines the ASCII header displayed at Neovim startup. |
| `knvim.startup.footer`                | `""`                    | Defines the ASCII footer displayed at Neovim startup. |
| `knvim.theme.colorscheme`             | `"gruvbox"`             | Sets the default color scheme for Neovim.             |
| `knvim.langs.lsp.names`               |                         | List of LSP servers to be configured.                 |
| `knvim.langs.lsp.tools`               |                         | Additional tools for LSP support.                     |
| `knvim.langs.linter.names`            |                         | List of linters to be configured.                     |
| `knvim.langs.formatter.names`         |                         | List of formatters to be configured.                  |
| `knvim.langs.treesitter.names`        |                         | Languages supported by Treesitter.                    |
| `knvim.langs.debugger.adapters`       |                         | Debug adapters to be configured.                      |
| `knvim.langs.debugger.configurations` |                         | Debug configurations specific to each language.       |

> [!NOTE]
> For a comprehensive overview of all available types, please refer to the `lua/user/utils/types/knvim.lua` file.

> [!IMPORTANT]
> Ensure that you review and update the `knvim.lua` file according to your specific requirements and preferences. This will help you get the most out of Kin.nvim's features and customization options.

## 📂 File Structure

You may add or change plugins in `lua/user/plugins`. All files there
will be automatically loaded by [lazy.nvim](https://github.com/folke/lazy.nvim)

```txt
~/.config/nvim or ~/AppData/Local/nvim
│
├── lua
│   └── user
│       ├── config
│       │   ├── autocmd.lua
│       │   ├── init.lua
│       │   ├── keymap.lua
│       │   └── option.lua
│       ├── helpers
│       │   ├── extensions
│       │   │    ├── string.lua
│       │   │    └── table.lua
│       │   ├── file.lua
│       │   └── paths.lua
│       ├── layout
│       │   ├── ascii.lua
│       │   └── icons.lua
│       ├── packager
│       │    └── init.lua
│       ├── plugins
│       │    ├── spec1.lua
│       │    ├── spec2.lua
│       │    └── ...
│       ├── utils
│       │    ├── lsp
│       │    │   ├── jsonls.lua
│       │    │   ├── lua_ls.lua
│       │    │   └── yamlls.lua
│       │    └── types
│       │        ├── ascii.lua
│       │        └── knvim.lua
│       └── knvim.lua
├── utils
│   └── scripts
│       ├── installer.ps1
│       ├── installer.sh
│       ├── uninstaller.ps1
│       └── uninstaller.sh
│
└── init.lua
```

## Credits

The development of Kin.nvim was inspired by incredible projects that have my sincere thanks to the following repositories:

- [NvChad](https://github.com/NvChad/NvChad)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [AstroNvim](https://github.com/AstroNvim/AstroNvim)

[//]: Footer

---

> © 2025 Cainã Carmo

![][footer_wave]

[//]: Links
[footer_wave]: https://capsule-render.vercel.app/api?type=waving&height=100&color=919F50&reversal=true&section=footer
