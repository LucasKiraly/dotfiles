# dotfiles

Personal development environment configurations for editors and command-line tools.

## Structure

```text
dotfiles/
└── config/
    ├── ruff/
    │   └── ruff.toml
    └── zed/
        ├── keymap.json
        └── settings.json
```

## Setup

Clone the repository and create symbolic links to place the configuration files under `~/.config`:

```bash
# Clone the repository
git clone git@github.com:LucasKiraly/dotfiles.git

# Set repository path
REPO_DIR="$PWD/dotfiles"

# Create configuration directories
mkdir -p ~/.config/zed ~/.config/ruff

# Link configuration files
ln -sfn "$REPO_DIR/config/zed/keymap.json" ~/.config/zed/keymap.json
ln -sfn "$REPO_DIR/config/zed/settings.json" ~/.config/zed/settings.json
ln -sfn "$REPO_DIR/config/ruff/ruff.toml" ~/.config/ruff/ruff.toml
```
