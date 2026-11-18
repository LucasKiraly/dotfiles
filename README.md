# dotfiles

Personal configuration files for the development environment, editors, and CLI tools.

## Structure

```text
dotfiles/
└── config/
    ├── ruff/
    │   └── ruff.toml       # Ruff linter configuration
    └── zed/
        ├── keymap.json     # Custom keybindings
        └── settings.json   # Editor preferences and UI setup
```

## Setup

Clone the repository and create symbolic links pointing to `~/.config`:

```bash
# Clone the dotfiles repository
git clone [https://github.com/LucasKiraly/dotfiles.git](https://github.com/LucasKiraly/dotfiles.git) ~/Documentos/repos/dotfiles

# Ensure target config directories exist
mkdir -p ~/.config/zed ~/.config/ruff

# Link Zed keymap
ln -sfn ~/Documentos/repos/dotfiles/config/zed/keymap.json ~/.config/zed/keymap.json

# Link Zed settings
ln -sfn ~/Documentos/repos/dotfiles/config/zed/settings.json ~/.config/zed/settings.json

# Link global Ruff config
ln -sfn ~/Documentos/repos/dotfiles/config/ruff/ruff.toml ~/.config/ruff/ruff.toml
```
