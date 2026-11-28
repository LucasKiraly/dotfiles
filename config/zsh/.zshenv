# =============================================================================
# PATH
# =============================================================================

# Include user-installed binaries from ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"


# =============================================================================
# EDITOR
# =============================================================================

# Default editor for git, crontab, and other CLI/visual tools
export EDITOR="zed --wait"
export VISUAL="zed --wait"


# =============================================================================
# MAN PAGES
# =============================================================================

# Render colored man pages with bat and avoid raw escape codes
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
