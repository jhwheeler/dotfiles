#!/usr/bin/env bash
set -euo pipefail

DOTFILES_REPO="https://github.com/jhwheeler/dotfiles.git"
DOTFILES_DIR="$HOME/projects/dotfiles"
NVIM_FORK="https://github.com/jhwheeler/NormalNvim.git"

info() { printf "\n\033[0;34m==> %s\033[0m\n" "$*"; }
ok()   { printf "\033[0;32m✓ %s\033[0m\n" "$*"; }

# ── Package detection ─────────────────────────────────────────────────────────
if command -v apt-get &>/dev/null; then
  PKG="sudo apt-get install -y"
  PKG_UPDATE="sudo apt-get update -qq"
elif command -v dnf &>/dev/null; then
  PKG="sudo dnf install -y"
  PKG_UPDATE=":"
elif command -v pacman &>/dev/null; then
  PKG="sudo pacman -S --noconfirm"
  PKG_UPDATE=":"
else
  echo "Unsupported package manager. Install git, tmux, curl, bat, fzf, ripgrep manually." >&2
  exit 1
fi

# ── Base packages ─────────────────────────────────────────────────────────────
info "Installing base packages"
$PKG_UPDATE
$PKG git curl tmux bat fzf ripgrep fd-find 2>/dev/null || \
  $PKG git curl tmux bat fzf ripgrep fd  # different distro naming

# ── Dotfiles ──────────────────────────────────────────────────────────────────
info "Setting up dotfiles"
mkdir -p "$HOME/projects"
if [[ ! -d "$DOTFILES_DIR/.git" ]]; then
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi
cd "$DOTFILES_DIR"
./install -c install-ssh.conf.yaml

# ── Neovim (AppImage - distro-agnostic, always latest) ────────────────────────
info "Installing Neovim"
mkdir -p "$HOME/.local/bin"
if ! command -v nvim &>/dev/null; then
  ARCH=$(uname -m)
  NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${ARCH}.appimage"
  curl -L "$NVIM_URL" -o "$HOME/.local/bin/nvim"
  chmod +x "$HOME/.local/bin/nvim"
  ok "Neovim installed"
else
  ok "Neovim already installed ($(nvim --version | head -1))"
fi

# ── NormalNvim config ─────────────────────────────────────────────────────────
info "Setting up Neovim config (NormalNvim fork)"
if [[ ! -d "$HOME/.config/nvim/.git" ]]; then
  git clone "$NVIM_FORK" "$HOME/.config/nvim"
fi
nvim --headless "+Lazy sync" +qa 2>/dev/null || true
ok "Neovim plugins synced"

# ── Starship ──────────────────────────────────────────────────────────────────
info "Installing Starship prompt"
if ! command -v starship &>/dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- --yes
fi

# ── Atuin ─────────────────────────────────────────────────────────────────────
info "Installing Atuin (local history)"
if ! command -v atuin &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
fi

# ── Lazygit ───────────────────────────────────────────────────────────────────
info "Installing Lazygit"
if ! command -v lazygit &>/dev/null; then
  LG_ARCH=$(uname -m)
  [[ "$LG_ARCH" == "aarch64" ]] && LG_ARCH="arm64"
  LG_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')
  curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LG_VERSION}_Linux_${LG_ARCH}.tar.gz"
  tar -xf /tmp/lazygit.tar.gz -C "$HOME/.local/bin" lazygit
  rm /tmp/lazygit.tar.gz
  ok "Lazygit installed"
else
  ok "Lazygit already installed ($(lazygit --version))"
fi

# ── TPM plugins ───────────────────────────────────────────────────────────────
info "Installing tmux plugins"
"$HOME/.tmux/plugins/tpm/bin/install_plugins" 2>/dev/null || true

echo ""
echo "Bootstrap complete! Start a new shell or run: source ~/.bashrc"
echo "Then attach tmux: tmux new -s main"
