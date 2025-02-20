# VSTax

Arch Linux package for VSTax, the official tax declaration software for the Canton of Valais, Switzerland.

VSTax is developed and distributed by the Valais Cantonal Tax Service. While the original software is available for free download, this package provides an Arch Linux-compatible installation with improved Java compatibility.

## Installation

```bash
yay -S vstax
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

## License

The original software is provided by the Canton of Valais. This package simply provides Arch Linux compatibility.
