# Kitty Terminal Configuration

This document provides comprehensive documentation for the Kitty terminal configuration, including settings, themes, and its relationship to the current Ghostty migration.

## Overview

This Kitty configuration was previously used as the primary terminal emulator and has since been migrated to Ghostty. The configuration remains as:
- Reference for terminal setup preferences  
- Backup configuration for systems where Ghostty isn't available
- Source of inspiration for terminal customization
- Documentation of migration decisions

## Configuration Structure

```
~/.config/kitty/
├── kitty.conf                 # Main configuration file
├── maps.conf                  # Keyboard mappings and shortcuts
├── tab_bar.py                 # Custom tab bar implementation
└── themes/                    # Color theme definitions
    ├── alabaster-dark.conf    # Light theme variant
    ├── minimal.conf           # Minimal color scheme
    ├── oxocarbon.conf         # IBM Carbon-inspired theme
    └── yoru.conf              # Primary dark theme (matches current setup)
```

## Main Configuration (`kitty.conf`)

### Font Configuration
```properties
# JetBrains Mono with Nerd Font support
font_family                     JetBrainsMono Nerd Font Mono Regular
bold_font                       JetBrainsMono Nerd Font Mono ExtraBold  
italic_font                     JetBrainsMono Nerd Font Mono Italic
bold_italic_font                JetBrainsMono Nerd Font Mono ExtraBold Italic

font_size                       16.0
modify_font                     underline_position 150%
modify_font                     underline_thickness 1.05
modify_font                     cell_height 110%
```

**Features**:
- Consistent with current Ghostty font setup
- Nerd Font support for icons and symbols
- Optimized spacing and underline positioning
- Larger font size (16pt) compared to Ghostty (13pt)

### Symbol Font Mapping
```properties
# Comprehensive symbol support
symbol_map U+F0001-U+F1af0 Hack Nerd Font
symbol_map U+F8FF,U+100000-U+1018C7 SF Pro
```

**Purpose**: 
- Ensures proper rendering of Nerd Font icons
- Falls back to SF Pro for macOS-specific symbols
- Prevents font fallback issues with development tools

### Cursor Configuration
```properties
cursor                          none
cursor_shape                    block
cursor_trail                    2
cursor_stop_blinking_after      10.0
disable_ligatures               cursor
```

**Features**:
- Block cursor for visibility
- Cursor trail for smooth movement
- Disables ligatures when cursor is over them for easier editing
- Auto-stops blinking after 10 seconds

### Mouse Behavior
```properties
copy_on_select                  yes
scrollback_lines                20000
focus_follows_mouse             yes
mouse_hide_wait                 16

# macOS-style URL opening
map cmd+left click to open URLs
mouse_map cmd+left release ungrabbed pass_selection_to_program /usr/bin/open
```

**Features**:
- Automatic text copying on selection
- Extensive scrollback history (20k lines)
- Focus follows mouse for multi-window workflows
- Native macOS URL opening with cmd+click

### Window Management
```properties
remember_window_size            yes
enabled_layouts                 splits, stack
window_border_width             1.0
window_margin_width             4.0
window_padding_width            8 4 8
placement_strategy              top-left
resize_draw_strategy            static
```

**Layout System**:
- `splits`: Tiled window arrangement
- `stack`: Tabbed layout for space efficiency
- Border and padding optimized for readability
- Static resizing for performance

### Tab Bar Configuration
```properties
tab_bar_style                   custom
tab_separator                   ""
tab_fade                        0 0 0 0
tab_title_template              "{fmt.fg._e5e5e5}{fmt.bg.default}  {index}:{f'{title[:6]}…{title[-6:]}' if title.rindex(title[-1]) + 1 > 25 else title}{' []' if layout_name == 'stack' else ''} "
active_tab_title_template       "{fmt.fg._ffffff}{fmt.bg.default}  {index}:{title}{' []' if layout_name == 'stack' else ''} "
tab_bar_edge                    top
tab_bar_align                   left
tab_bar_margin_width            0.0
tab_bar_margin_height           12.0 0.0
```

**Custom Features**:
- Custom Python-based tab bar (`tab_bar.py`)
- Intelligent title truncation for long names
- Layout indicators (shows `[]` for stacked layout)
- Clean, minimal appearance with proper spacing

## Yoru Color Theme (`themes/yoru.conf`)

The Yoru theme provides the dark color scheme that was migrated to Ghostty:

### Base Colors
```properties
# Core colors (matches Ghostty configuration)
foreground              #edeff0
background              #0c0e0f
selection_foreground    #edeff0
selection_background    #1f2122

# Cursor
cursor                  #edeff0
cursor_text_color       #0c0e0f

# URLs
url_color               #6791C9
```

### 16-Color Palette
The theme defines colors 0-15 matching the terminal standard:
- **Black variants** (0,8): `#0c0e0f`, `#1f2122`
- **Red variants** (1,9): Red tones for errors and highlights
- **Green variants** (2,10): Green tones for success and strings
- **Yellow variants** (3,11): Yellow/orange for warnings
- **Blue variants** (4,12): Blue tones for information and links
- **Magenta variants** (5,13): Purple tones for keywords
- **Cyan variants** (6,14): Cyan tones for constants
- **White variants** (7,15): Light gray to white for text

## Custom Tab Bar (`tab_bar.py`)

The custom tab bar implementation provides:
- Dynamic tab width based on content
- Custom styling and colors
- Layout-aware indicators
- Performance optimized rendering

## Migration to Ghostty

### Why the Migration?
1. **Performance**: Ghostty offers better performance on macOS
2. **Native Integration**: Better macOS system integration
3. **Simplicity**: Cleaner configuration syntax
4. **Development**: More active development and modern architecture

### What Was Preserved?
- Font configuration (JetBrainsMono Nerd Font)
- Color scheme (Yoru theme)
- Window management preferences
- Keyboard shortcut philosophy

### What Changed?
- **Font Size**: Reduced from 16pt to 13pt in Ghostty
- **Configuration Format**: TOML-style vs properties
- **Tab Management**: Different approach to tab behavior
- **Customization**: Less extensive theming options

### Migration Mapping

| Kitty Setting | Ghostty Equivalent | Notes |
|---------------|-------------------|-------|
| `font_family` | `font-family` | Same font, different syntax |
| `font_size` | `font-size` | Reduced from 16 to 13 |
| `background` | `background` | Same color values |
| `foreground` | `foreground` | Same color values |
| `tab_bar_style` | `macos-titlebar-style` | Different approach |
| Mouse bindings | Built-in | Ghostty handles natively |
| Window layouts | Split management | Different implementation |

## Setup Instructions

### Prerequisites
```bash
# Install Kitty
brew install --cask kitty

# Install required fonts
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font
```

### Installation
```bash
# Create config directory
mkdir -p ~/.config/kitty/themes

# Copy configuration files
cp kitty.conf ~/.config/kitty/
cp maps.conf ~/.config/kitty/
cp tab_bar.py ~/.config/kitty/
cp -r themes/* ~/.config/kitty/themes/
```

### Activation
1. Launch Kitty
2. Configuration loads automatically
3. Verify font rendering and theme application
4. Test keyboard shortcuts and window management

## Configuration Comparison: Kitty vs Ghostty

### Advantages of Kitty
- **Extensive Customization**: Highly configurable
- **Plugin System**: Extensions and custom scripts
- **Advanced Layouts**: Multiple window layout options
- **Cross-Platform**: Consistent across all platforms
- **Feature Rich**: More built-in features

### Advantages of Ghostty
- **Performance**: Faster startup and rendering
- **Native macOS**: Better system integration
- **Simplicity**: Cleaner configuration
- **Modern Architecture**: Built with modern technologies
- **Active Development**: Rapid improvement cycle

## Troubleshooting

### Common Kitty Issues

1. **Font Rendering Problems**:
   ```bash
   # Check available fonts
   kitty list-fonts
   
   # Debug font fallback
   kitty --debug-font-fallback
   ```

2. **Theme Not Loading**:
   - Verify theme file exists in `themes/` directory
   - Check file permissions and syntax
   - Restart Kitty after changes

3. **Keyboard Shortcuts Conflict**:
   - Check system shortcuts in macOS settings
   - Review `maps.conf` for conflicts
   - Use `kitty --debug-keyboard` for debugging

4. **Performance Issues**:
   - Disable unnecessary features
   - Reduce scrollback buffer size
   - Check for resource-heavy plugins

### Migration Back to Kitty
If needed to return to Kitty from Ghostty:

```bash
# Backup current Ghostty config
mv ~/.config/ghostty ~/.config/ghostty.backup

# Restore Kitty as primary terminal
# Update shell integration in ~/.zshrc:
export TERM="xterm-kitty"

# Update applications to use Kitty
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{LSHandlerContentType="public.unix-executable";LSHandlerRoleAll="org.sw.Kitty";}'
```

## Advanced Configuration

### Custom Key Mappings (`maps.conf`)
Create custom keyboard shortcuts for specific workflows:
```properties
# Example custom mappings
map ctrl+shift+t new_tab_with_cwd
map ctrl+shift+enter new_window_with_cwd
map ctrl+shift+f show_scrollback
```

### Window Management Scripts
Automate common window layouts:
```bash
#!/bin/bash
# Create development layout
kitty @ new-window --new-tab --tab-title "editor" --cwd ~/projects
kitty @ new-window --title "server" --cwd ~/projects
kitty @ new-window --title "logs" --cwd ~/projects
```

### Theme Switching
Set up dynamic theme switching:
```bash
# Light theme for day
kitty @ set-colors ~/.config/kitty/themes/alabaster-dark.conf

# Dark theme for night  
kitty @ set-colors ~/.config/kitty/themes/yoru.conf
```

## Integration Notes

This Kitty configuration was designed to work with:
- **Shell**: Zsh with custom prompt
- **Editor**: Neovim (TeVim configuration)
- **Development**: Full-stack development workflows
- **Design**: Consistent with overall system theming

The configuration remains valuable as a reference for terminal preferences and can be activated when Ghostty isn't available or when specific Kitty features are needed.

## Resources

- [Kitty Terminal Documentation](https://sw.kovidgoyal.net/kitty/)
- [Kitty Configuration Reference](https://sw.kovidgoyal.net/kitty/conf/)
- [Nerd Fonts Documentation](https://www.nerdfonts.com/)
- [Color Scheme Resources](https://terminal.sexy/)

---

*This Kitty configuration served as the foundation for the current Ghostty setup, preserving the essential elements while adapting to a more modern terminal emulator.*