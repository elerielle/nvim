#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
INIT_LUA="$REPO_DIR/init.lua"
HEALTH_REPORT="$REPO_DIR/.checkhealth-full.txt"

log() {
  printf '[bootstrap] %s\n' "$*"
}

require_cmd() {
  local cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    log "Missing required command: $cmd"
    exit 1
  fi
}

run() {
  log "$*"
  "$@"
}

require_cmd nvim
require_cmd npm
require_cmd python3
require_cmd gem
require_cmd cpanm
require_cmd rg
require_cmd git

log "Installing Neovim provider dependencies"
run npm install -g neovim
if ! python3 -m pip install --user --upgrade --break-system-packages pynvim; then
  run python3 -m pip install --user --upgrade pynvim
fi
run gem install --user-install neovim
run cpanm --quiet --notest Neovim::Ext

log "Syncing plugins and running plugin build hooks"
run nvim --headless -u "$INIT_LUA" '+Lazy! sync' '+qa'

MD_PREVIEW_DIR="$HOME/.local/share/nvim/lazy/markdown-preview.nvim"
MD_PREVIEW_APP="$MD_PREVIEW_DIR/app"
if [[ -d "$MD_PREVIEW_APP" ]]; then
  run npm --prefix "$MD_PREVIEW_APP" install --no-package-lock
  run git -C "$MD_PREVIEW_DIR" checkout -- app/yarn.lock
else
  log "markdown-preview app directory not found: $MD_PREVIEW_APP"
  log "Re-run after Lazy sync succeeds."
  exit 1
fi

log "Running full :checkhealth"
run env -u TMUX TERM=xterm-256color XDG_STATE_HOME=/tmp \
  nvim -es -u "$INIT_LUA" '+checkhealth' "+w! $HEALTH_REPORT" '+qa'

if rg -n 'ERROR' "$HEALTH_REPORT" >/dev/null; then
  log "checkhealth reported errors:"
  rg -n 'ERROR' "$HEALTH_REPORT" || true
  log "Full report: $HEALTH_REPORT"
  exit 1
fi

log "checkhealth passed with no errors"
log "Full report: $HEALTH_REPORT"
