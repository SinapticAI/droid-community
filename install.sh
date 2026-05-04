#!/bin/sh
set -e

# DROID+ Installer
# Usage: curl -fsSL https://get.droid.plus | sh

REPO="SinapticAI/droid-community"
INSTALL_DIR="/usr/local/bin"
BINARY_NAME="droid"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

info() { printf "${CYAN}info${NC}  %s\n" "$1"; }
ok()   { printf "${GREEN}ok${NC}    %s\n" "$1"; }
err()  { printf "${RED}error${NC} %s\n" "$1" >&2; exit 1; }

# Detect OS
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
case "$OS" in
    linux)  OS="linux" ;;
    darwin) OS="darwin" ;;
    mingw*|msys*|cygwin*) OS="windows" ;;
    *) err "Unsupported OS: $OS" ;;
esac

# Detect architecture
ARCH=$(uname -m)
case "$ARCH" in
    x86_64|amd64)  ARCH="amd64" ;;
    aarch64|arm64) ARCH="arm64" ;;
    *) err "Unsupported architecture: $ARCH" ;;
esac

info "Detected: ${OS}/${ARCH}"

# Get latest version
info "Fetching latest version..."
LATEST=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
if [ -z "$LATEST" ]; then
    err "Failed to fetch latest version"
fi
info "Latest version: v${LATEST}"

# Build download URL
EXT="tar.gz"
[ "$OS" = "windows" ] && EXT="zip"
FILENAME="droid-${LATEST}-${OS}-${ARCH}.${EXT}"
URL="https://github.com/${REPO}/releases/download/v${LATEST}/${FILENAME}"
CHECKSUM_URL="https://github.com/${REPO}/releases/download/v${LATEST}/checksums.txt"

# Download
TMPDIR=$(mktemp -d)
info "Downloading ${FILENAME}..."
curl -fsSL -o "${TMPDIR}/${FILENAME}" "$URL" || err "Download failed: ${URL}"

# Verify checksum
info "Verifying checksum..."
curl -fsSL -o "${TMPDIR}/checksums.txt" "$CHECKSUM_URL" || err "Checksum download failed"
EXPECTED=$(grep "${FILENAME}" "${TMPDIR}/checksums.txt" | awk '{print $1}')
if [ -z "$EXPECTED" ]; then
    err "Checksum not found for ${FILENAME}"
fi

if command -v sha256sum >/dev/null 2>&1; then
    ACTUAL=$(sha256sum "${TMPDIR}/${FILENAME}" | awk '{print $1}')
elif command -v shasum >/dev/null 2>&1; then
    ACTUAL=$(shasum -a 256 "${TMPDIR}/${FILENAME}" | awk '{print $1}')
else
    info "Warning: sha256sum not found, skipping checksum verification"
    ACTUAL="$EXPECTED"
fi

if [ "$EXPECTED" != "$ACTUAL" ]; then
    err "Checksum mismatch!\n  Expected: ${EXPECTED}\n  Actual:   ${ACTUAL}"
fi
ok "Checksum verified"

# Extract
info "Installing..."
if [ "$EXT" = "tar.gz" ]; then
    tar -xzf "${TMPDIR}/${FILENAME}" -C "${TMPDIR}"
else
    unzip -q "${TMPDIR}/${FILENAME}" -d "${TMPDIR}"
fi

# Remove macOS quarantine flag (prevents Gatekeeper unsigned binary warning)
if [ "$OS" = "darwin" ]; then
    xattr -d com.apple.quarantine "${TMPDIR}/${BINARY_NAME}" 2>/dev/null || true
fi

# Install
if [ -w "$INSTALL_DIR" ]; then
    cp "${TMPDIR}/${BINARY_NAME}" "${INSTALL_DIR}/${BINARY_NAME}"
    chmod +x "${INSTALL_DIR}/${BINARY_NAME}"
else
    info "Need sudo to install to ${INSTALL_DIR}"
    sudo cp "${TMPDIR}/${BINARY_NAME}" "${INSTALL_DIR}/${BINARY_NAME}"
    sudo chmod +x "${INSTALL_DIR}/${BINARY_NAME}"
fi

# Cleanup
rm -rf "$TMPDIR"

# Verify
VERSION=$("${INSTALL_DIR}/${BINARY_NAME}" version 2>/dev/null | head -1)
ok "Installed: ${VERSION}"

echo ""
echo "Get started:"
echo "  droid init my-agent"
echo "  cd my-agent"
echo "  # edit .env with your API key"
echo "  droid up"
echo ""
echo "Documentation: https://docs.droid.plus"
echo "GitHub: https://github.com/SinapticAI/droid-community"
