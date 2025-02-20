# VSTax

Arch Linux package for VSTax, the official tax declaration software for the Canton of Valais, Switzerland.

VSTax is developed and distributed by the Valais Cantonal Tax Service. While the original software is available for free download, this package provides an Arch Linux-compatible installation with improved Java compatibility.

## Installation

### Via AUR Helper

```bash
yay -S vstax
```

### Manual Installation from AUR

```bash
# Clone the AUR repository
git clone https://aur.archlinux.org/vstax.git
cd vstax

# Build and install the package
makepkg -si
```

Required packages (installed automatically as dependencies):
- `xdg-utils`: For desktop integration and browser settings
- `qt5-tools`: Required by xdg-utils for MIME type handling

You can verify their installation with:
```bash
pacman -Q xdg-utils qt5-tools
```

## Required Setup

VSTax requires a default browser to be set in your system. Set it before running VSTax:

```bash
# For Firefox
xdg-settings set default-web-browser firefox.desktop

# For Chromium
xdg-settings set default-web-browser chromium.desktop

# For Google Chrome
xdg-settings set default-web-browser google-chrome.desktop
```

## Installation Testing

A test script is provided to verify the installation:

```bash
# Make the test script executable
chmod +x test-vstax-install.sh

# Run the tests (requires root privileges)
sudo ./test-vstax-install.sh
```

The test script checks:
- Package installation status
- Required dependencies
- File structure and permissions
- Configuration settings
- Java environment setup

A summary report will show if all tests passed successfully.

## Troubleshooting

1. If you see errors about `qtpaths` when setting the default browser:
   ```
   /usr/bin/xdg-mime: line 885: qtpaths: command not found
   ```
   Install qt5-tools:
   ```bash
   sudo pacman -S qt5-tools
   ```

2. If you see a warning about no default browser being set, use one of the commands in the "Required Setup" section to set your preferred browser.

## License

The original software is provided by the Canton of Valais. This package simply provides Arch Linux compatibility.
