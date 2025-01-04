[//]: Header

<h1 align="center">🍡 Kin.nvim</h1>

Kin.nvim is a powerful [Neovim](https://neovim.io/) configuration, designed to deliver an efficient and optimized experience across any language. It offers the flexibility to be customized for specific languages, adapting to your workflow and maximizing your productivity.

[//]: Content

## 🚧 Requirements

- [Git](https://git-scm.com/downloads)
- [Neovim 0.9.5+](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- A clipboard tool is necessary for the integration with the system clipboard (see [`Clipboard Tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Package Manager
  - [pip](https://pypi.org/project/pip/)
  - [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
  - [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
- Tools
  - [fzf](https://github.com/junegunn/fzf)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)

> [!NOTE]
> For Windows users, it is necessary to use Powershell 7 or higher

## 🛠️ Installation

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

<br />

<details>
<summary>Linux/MacOS</summary>
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

## 📂 File Structure

You may add or change plugins in `lua/user/plugins`. All files there
will be automatically loaded by [lazy.nvim](https://github.com/folke/lazy.nvim)

```txt
~/.config/nvim
├── lua
│   └── user
│       ├── config
│       │   ├── autocmds.lua
│       │   ├── keymaps.lua
│       │   └── options.lua
│       ├── helpers
│       │   └── extensions
│       │       └── table.lua
│       ├── interface
│       │   ├── ascii.lua
│       │   └── icons.lua
│       ├── packager
│       │   └── init.lua
│       └── plugins
│           ├── spec1.lua
│           ├── spec2.lua
│           └── ...
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
[footer_wave]: https://capsule-render.vercel.app/api?type=waving&height=100&color=d5c4a1&reversal=true&section=footer
