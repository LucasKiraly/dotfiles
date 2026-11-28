# =============================================================================
# HISTORY
# =============================================================================

# Store history under the XDG state directory (110k in memory, 100k on disk)
HISTFILE="$HOME/.local/state/zsh/history"
HISTSIZE=110000
SAVEHIST=100000

# Append instead of overwriting and share history across open terminals
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Skip consecutive duplicates, expire them first, and hide them when searching
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# Skip saving commands that start with a space
setopt HIST_IGNORE_SPACE


# =============================================================================
# SHELL BEHAVIOR
# =============================================================================

# Disable the terminal bell
setopt NOBEEP

# Sort numbered files naturally (file2 before file10)
setopt NUMERIC_GLOB_SORT


# =============================================================================
# COMPLETION
# =============================================================================

# Load completion system with cache under the XDG cache directory
autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/zcompdump"

# Arrow-key menu and case-insensitive matching ("doc" -> "Documents")
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# =============================================================================
# NAVIGATION & SEARCH
# =============================================================================

# zoxide: smarter cd (e.g. z projects)
eval "$(zoxide init zsh)"

# fzf: keybindings (Ctrl+R history, Ctrl+T files, Alt+C dirs) and **<Tab>
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# fzf: search with fd (skipping .git) and preview files with bat
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :100 {}'"


# =============================================================================
# ALIASES
# =============================================================================

# File listing with eza
alias ls='eza --icons=auto'
alias ll='eza -lh --icons=auto --git'
alias la='eza -lah --icons=auto --git'
alias tree='eza --tree --icons=auto'

# Colored diff and human-readable disk sizes
alias diff='diff --color=auto'
alias df='df -h'


# =============================================================================
# KEYBINDINGS
# =============================================================================

# Register prefix-based history search widgets
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Bind Up/Down arrows (normal and application terminal modes)
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search


# =============================================================================
# PROMPT
# =============================================================================

# Oh My Posh with the Tokyo Night Storm theme
eval "$(oh-my-posh init zsh --config "$HOME/.config/oh-my-posh/tokyonight_storm.omp.json")"


# =============================================================================
# PLUGINS
# =============================================================================

# Autosuggestions: history first, then completion (Right arrow accepts)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (must be sourced last)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
