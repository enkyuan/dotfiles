# Ghostty Terminal Configuration

This document provides comprehensive documentation for my Ghostty setup, including configuration structure, platform considerations, and setup instructions for replication on other machines.

## Overview

This Ghostty configuration is migrated from Kitty and provides:
- Custom keybindings optimized for OSX machines 
- Yoru dark color theme
- Font configuration with Nerd Font support
- Environment variable management

## Configuration Structure

```
~/.config/ghostty/
├── config          # Main configuration file
├── keybinds        # Custom keybinding definitions
└── themes/         # Color theme definitions
    ├── alabaster-dark
    ├── minimal
    ├── oxocarbon
    └── yoru        # Active theme
```

## Main Configuration (`config`)

### Font Configuration
```toml
font-family = "JetBrainsMono Nerd Font"
font-size = 13
font-feature = -liga  # Disables ligatures for cleaner code display
```

**Purpose**: Uses JetBrains Mono with Nerd Font patches for programming symbols and icons. Ligatures are disabled for clarity in code.

### macOS-Specific Settings
```toml
macos-titlebar-style = hidden
macos-option-as-alt = left
```

**Purpose**: 
- `macos-titlebar-style = hidden`: Removes the title bar for a cleaner interface and enables proper tab functionality
- `macos-option-as-alt = left`: Makes the left Option key function as Alt for Unix-style shortcuts

### Tab and Window Management
```toml
window-new-tab-position = after
window-inherit-working-directory = true
window-inherit-font-size = true
```

**Purpose**: 
- New tabs open after the current tab (not at the end)
- Working directory is inherited from the current tab
- Font size changes apply to new tabs

### Environment Variables
```toml
custom-shader-animation = true
shell-integration = zsh
shell-integration-features = cursor,sudo,title

# Environment setup
env = "PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"
env = "EDITOR=nvim"
```

**Purpose**: 
- Enables shell integration features for better terminal experience
- Sets up proper PATH for Homebrew and system binaries
- Configures nvim as the default editor

### Theme Integration
```toml
include = keybinds
theme = yoru
```

**Purpose**: Includes external keybind file and applies the yoru color theme.

## Keybindings (`keybinds`)

The keybindings are designed to match macOS conventions while providing efficient terminal operations:

### Clipboard Operations
```toml
keybind = cmd+c=copy_to_clipboard
keybind = cmd+v=paste_from_clipboard
```

### Font Control
```toml
keybind = cmd+equal=increase_font_size:1
keybind = cmd+minus=decrease_font_size:1
keybind = cmd+0=reset_font_size
```

### Tab Management
```toml
keybind = cmd+t=new_tab
keybind = cmd+w=close_surface
keybind = cmd+n=new_window
```

### Split Management
```toml
keybind = cmd+d=new_split:right
keybind = cmd+shift+d=new_split:down
```

### Navigation (Vim-style)
```toml
keybind = ctrl+h=goto_split:left
keybind = ctrl+j=goto_split:down
keybind = ctrl+k=goto_split:up
keybind = ctrl+l=goto_split:right
```

### Window Operations
```toml
keybind = cmd+enter=toggle_fullscreen
keybind = cmd+shift+enter=toggle_split_zoom
```

## Yoru Color Theme (`themes/yoru`)

The Yoru theme provides a dark, low-contrast color scheme optimized for extended coding sessions:

### Base Colors
```toml
background = #0c0e0f      # Deep dark background
foreground = #edeff0      # Light foreground text
cursor-color = #f2f4f5    # Bright cursor for visibility
selection-background = #6791C9  # Blue selection highlight
```

### Terminal Color Palette
The theme defines a 16-color palette (0-15) with:
- **Black/Gray tones** (0, 8): `#16181a` and `#262a2d`
- **Red tones** (1, 9): `#e8646a` variations
- **Green tones** (2, 10): `#82c29c` variations
- **Yellow tones** (3, 11): `#e79881` variations
- **Blue tones** (4, 12): `#6791C9` and `#709ad2`
- **Magenta tones** (5, 13): `#b08aed` variations
- **Cyan tones** (6, 14): `#50a4c7` and `#82c29c`
- **White tones** (7, 15): `#c6c8ca` and `#f2f4f5`

### Special Features
```toml
split-divider-color = #6791C9  # Uses theme blue for split borders
```

## Platform Considerations

### macOS (Native Build)
- Uses Cocoa/AppKit framework
- Full integration with macOS features
- Limited customization options due to native UI constraints
- **Border radius**: Not configurable (system limitation)
- **GTK CSS**: Not supported (uses native macOS UI)

### Linux (GTK Build)
- Uses GTK framework
- More customization options available
- GTK CSS styling possible
- Different configuration options may be available

## Setup Instructions

### Prerequisites
1. **Ghostty installed** via Homebrew or official installer
2. **JetBrainsMono Nerd Font** installed:
   ```bash
   brew tap homebrew/cask-fonts
   brew install font-jetbrains-mono-nerd-font
   ```

### Installation Steps

1. **Create configuration directory**:
   ```bash
   mkdir -p ~/.config/ghostty/themes
   ```

2. **Copy configuration files**:
   ```bash
   # Copy main config
   cp config ~/.config/ghostty/
   
   # Copy keybindings
   cp keybinds ~/.config/ghostty/
   
   # Copy themes
   cp -r themes/* ~/.config/ghostty/themes/
   ```

3. **Verify setup**:
   - Launch Ghostty
   - Check that tabs work properly (cmd+t should create tabs, not windows)
   - Verify font rendering with Nerd Font icons
   - Test keybindings for splits and navigation

### Platform-Specific Setup

#### macOS Setup
```bash
# Install via Homebrew
brew install --cask ghostty

# Or download from official site
# Ensure JetBrains Mono Nerd Font is installed
```

#### Linux Setup
```bash
# Install Ghostty (method varies by distribution)
# Install JetBrains Mono Nerd Font via package manager
sudo apt install fonts-jetbrains-mono  # Ubuntu/Debian
```

## Customization Options

### Adding New Themes
1. Create a new file in `~/.config/ghostty/themes/`
2. Define color palette using the yoru theme as a template
3. Update main config: `theme = your-theme-name`

### Modifying Keybindings
1. Edit the `keybinds` file
2. Use Ghostty's action syntax: `keybind = key_combination=action:parameter`
3. Available actions include: `new_tab`, `close_surface`, `new_split`, `goto_split`, etc.

### Font Adjustments
```toml
font-family = "Your Preferred Font"
font-size = 14                    # Adjust as needed
font-feature = -liga              # Disable ligatures
font-feature = +liga              # Enable ligatures
```

## Troubleshooting

### Common Issues

1. **New tabs open as windows instead of tabs**:
   - Ensure `macos-titlebar-style = hidden` is set
   - Check that window management settings are configured

2. **Font not displaying correctly**:
   - Verify Nerd Font is installed system-wide
   - Check font name matches exactly (case-sensitive)

3. **Keybindings not working**:
   - Ensure `include = keybinds` is in main config
   - Check for conflicting system shortcuts
   - Verify keybind syntax

4. **Theme not applying**:
   - Confirm theme file exists in `themes/` directory
   - Check `theme = yoru` line in main config
   - Restart Ghostty after changes

### Migration from Other Terminals

#### From Kitty
Most configurations translate directly:
- Font settings work the same
- Color schemes need conversion to Ghostty format
- Keybindings use different syntax but same concepts

#### From iTerm2/Terminal.app
- Export color schemes and convert manually
- Keybindings need complete reconfiguration
- Shell integration features may need adjustment

## Advanced Configuration

### Shell Integration
```toml
shell-integration = zsh           # Or bash, fish, etc.
shell-integration-features = cursor,sudo,title
```

### Performance Tuning
```toml
custom-shader-animation = true   # Smooth animations
window-vsync = true              # Prevent screen tearing
```

### Security Considerations
```toml
# Restrict clipboard access if needed
clipboard-read = ask
clipboard-write = allow
```

## Backup and Sync

To backup your configuration:
```bash
# Create backup
tar -czf ghostty-config-backup.tar.gz ~/.config/ghostty/

# Sync across machines (example with rsync)
rsync -av ~/.config/ghostty/ user@remote:~/.config/ghostty/
```

## Resources

- [Official Ghostty Documentation](https://ghostty.org/docs)
- [Ghostty GitHub Repository](https://github.com/ghostty-org/ghostty)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [Color Scheme Generator](https://terminal.sexy/)

---

*This configuration is optimized for macOS development workflows with vim-style navigation and efficient terminal management. Adjust settings according to your specific needs and platform requirements.*