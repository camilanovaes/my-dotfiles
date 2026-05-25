#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$DOTFILES_DIR/config"

# Add entries here as "binary:package" (or just "binary" when they match).
APPS=(
    zsh
    nvim:neovim
    tmux
    fzf
    rg:ripgrep
    git
    htop
    lazygit
    tree-sitter:tree-sitter-cli
    npm
)

# ── Colors ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

info()    { echo -e "${CYAN}[info]${NC}  $*"; }
ok()      { echo -e "${GREEN}[ ok ]${NC}  $*"; }
warn()    { echo -e "${YELLOW}[warn]${NC}  $*"; }
missing() { echo -e "${RED}[miss]${NC}  $*"; }

# ── OS detection ──────────────────────────────────────────────────────────────
detect_os() {
    if [[ "$(uname)" == "Darwin" ]]; then
        echo "macos"
    elif [[ -f /etc/os-release ]]; then
        source /etc/os-release
        case "$ID" in
            ubuntu|debian|pop) echo "debian" ;;
            fedora|rhel|centos|rocky|alma) echo "fedora" ;;
            *) echo "unknown" ;;
        esac
    else
        echo "unknown"
    fi
}

# ── Package manager helpers ───────────────────────────────────────────────────
install_stow() {
    local os="$1"
    info "Installing stow..."
    case "$os" in
        macos)  brew install stow ;;
        debian) sudo apt-get install -y stow ;;
        fedora) sudo dnf install -y stow ;;
        *)      missing "Cannot auto-install stow on this OS. Install it manually and re-run." ; exit 1 ;;
    esac
}

# ── Stow dotfiles ─────────────────────────────────────────────────────────────
stow_configs() {
    info "Stowing dotfiles from $CONFIG_DIR → $HOME"
    for pkg in "$CONFIG_DIR"/*/; do
        name="$(basename "$pkg")"
        if stow -d "$CONFIG_DIR" -t "$HOME" "$name" 2>/dev/null; then
            ok "stowed: $name"
        else
            # Retry with --adopt to handle pre-existing files, then restore
            warn "Conflict in '$name' — trying with --restow"
            stow -d "$CONFIG_DIR" -t "$HOME" --restow "$name"
            ok "restowed: $name"
        fi
    done
}

# ── App presence checks ───────────────────────────────────────────────────────
check_apps() {
    echo ""
    info "Checking commonly used apps..."

    local os="$1"
    case "$os" in
        macos)   local mgr="brew install" ;;
        debian)  local mgr="sudo apt install" ;;
        fedora)  local mgr="sudo dnf install" ;;
        *)       local mgr="install via your package manager:" ;;
    esac

    for entry in "${APPS[@]}"; do
        local bin="${entry%%:*}"
        local pkg="${entry##*:}"
        if command -v "$bin" &>/dev/null; then
            ok "$bin"
        else
            missing "$bin not found — $mgr $pkg"
        fi
    done
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
    echo ""
    info "Dotfiles installer"
    info "Directory: $DOTFILES_DIR"

    local os
    os="$(detect_os)"
    info "Detected OS: $os"
    echo ""

    # Ensure stow is available
    if ! command -v stow &>/dev/null; then
        install_stow "$os"
    else
        ok "stow is available"
    fi

    stow_configs
    check_apps "$os"

    echo ""
    ok "Done."
}

main "$@"
