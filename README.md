# Dotfiles

This is the comprehensive documentation for my entire `~/.config` dotfiles ecosystem, covering all applications, tools, and their integrations.

## System Architecture

```
~/.config/
├── 🚀 Core Development Tools
│   ├── nvim/                   # TeVim (Neovim) - Primary editor
│   ├── ghostty/               # Terminal emulator (current)
│   └── kitty/                 # Terminal emulator (legacy/backup)
├── 🎨 Theming & Aesthetics  
│   ├── spicetify/             # Spotify customization
│   ├── btop/                  # System monitor theming
│   └── zathura/               # PDF reader configuration
├── 🔧 System Tools
│   ├── git/                   # Git configuration
│   ├── ranger/                # File manager
│   ├── nnn/                   # Alternative file manager
│   └── psysh/                 # PHP REPL
├── 🌐 Development Infrastructure
│   ├── code/                  # VS Code customizations
│   ├── herd-lite/             # PHP development environment
│   ├── uv/                    # Python package manager
│   └── xata/                  # Database credentials
├── ⚙️  Package Managers & Tools
│   ├── pip/                   # Python package manager
│   ├── configstore/           # Application configurations
│   └── simple-update-notifier/ # Update management
├── 🔐 Security & Credentials
│   ├── github-copilot/        # AI coding assistant
│   └── chezmoi/               # Dotfiles management
└── 🎮 Alternative Interfaces
    └── zed/                   # Alternative editor
```

**Key Customizations**:
- Personal configuration layer in `lua/custom/`
- Custom keymaps and options overrides
- Integration with terminal and git workflows
- Consistent theming with terminal setup

### Terminal: Ghostty (Primary)
**Location**: `~/.config/ghostty/`  
**Documentation**: [`ghostty/README.md`](ghostty/README.md)

**Features**:
- Native macOS integration with optimal performance
- Yoru dark color theme matching editor
- JetBrainsMono Nerd Font for icon support
- Comprehensive vim-style keybindings
- Proper tab management and split navigation

**Configuration Highlights**:
- macOS titlebar integration for clean interface
- Environment variable management (PATH, EDITOR)
- Shell integration with zsh
- Tab and window behavior optimization

### Terminal: Kitty (Legacy/Backup)
**Location**: `~/.config/kitty/`  
**Documentation**: [`kitty/README.md`](kitty/README.md)

**Purpose**: Maintains previous terminal setup for:
- Systems where Ghostty isn't available
- Reference configuration for terminal preferences
- Advanced features not yet in Ghostty
- Cross-platform compatibility

## Theming System

### Color Scheme: Yoru
The Yoru color scheme provides consistency across all applications:

```
Primary Colors:
├── Background: #0c0e0f      # Deep dark background
├── Foreground: #edeff0      # Light text
├── Accent:     #6791C9      # Blue highlights
├── Selection:  #1f2122      # Selection background
└── Cursor:     #f2f4f5      # Bright cursor
```

**Applied To**:
- Ghostty/Kitty terminal background and text colors
- Neovim colorscheme and UI elements  
- btop system monitor interface
- Zathura PDF reader colors
- Custom applications and scripts

### Font System: JetBrainsMono Nerd Font
Consistent typography across all applications:
- **Terminal**: JetBrainsMono Nerd Font (13pt in Ghostty, 16pt in Kitty)
- **Editor**: Inherits from terminal or uses JetBrainsMono
- **System**: Nerd Font symbols for icons and UI elements

## Application Integrations

### Git Workflow Integration
**Location**: `~/.config/git/`

**Integration Points**:
- Neovim: Git fugitive and signs for in-editor git operations
- Terminal: Git status in shell prompt and shortcuts
- Global ignore patterns for development files

### File Management
**Dual System Approach**:

1. **Ranger** (`~/.config/ranger/`):
   - Full-featured file manager with vim keybindings
   - Preview capabilities for code, images, and documents
   - Integration with terminal workflows

2. **nnn** (`~/.config/nnn/`):
   - Lightweight, fast file navigation
   - Plugin system for extended functionality  
   - Bookmarks and session management

### Development Environment: PHP
**Location**: `~/.config/herd-lite/`

**Components**:
- PHP runtime and extensions
- Composer for dependency management
- Laravel CLI tools
- Local development server capabilities

**Integration**:
- Path configuration in terminal setup
- Editor LSP integration for PHP development
- Database tools and credentials management

### Python Environment
**Location**: `~/.config/uv/`

**Features**:
- Modern Python package management with uv
- Virtual environment handling
- Fast dependency resolution
- Integration with development workflows

### Spotify Customization
**Location**: `~/.config/spicetify/`  
**Documentation**: [`spicetify/README.md`](spicetify/README.md)

**Enhancements**:
- Marketplace app for theme and extension management
- Custom themes matching system color scheme
- Privacy-focused configuration (disabled telemetry)
- JavaScript extensions for added functionality

## Setup and Installation

### Prerequisites
```bash
# Core tools
brew install neovim ghostty git

# Development tools  
brew install python node php composer

# Optional enhancements
brew install ranger nnn btop lazygit fzf ripgrep

# Fonts
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font
```

### Full System Installation

1. **Clone Configuration Repository**:
   ```bash
   # If using git for dotfiles
   git clone <your-dotfiles-repo> ~/dotfiles
   cd ~/dotfiles
   ```

2. **Deploy Configurations**:
   ```bash
   # Create config directory
   mkdir -p ~/.config
   
   # Copy all configurations
   cp -r config/* ~/.config/
   
   # Or use symbolic links for live updates
   ln -sf ~/dotfiles/config/* ~/.config/
   ```

3. **Set up Core Applications**:
   ```bash
   # Neovim setup (TeVim will auto-install on first run)
   nvim
   
   # Terminal setup (configurations load automatically)
   # ghostty or kitty will use configs immediately
   
   # Spicetify setup
   spicetify backup apply
   ```

4. **Verify Installation**:
   ```bash
   # Test Neovim startup time
   nvim --startuptime startup.log
   
   # Verify terminal theming
   echo "Terminal colors and fonts should match Yoru theme"
   
   # Check git integration
   git status
   ```

### Individual Application Setup

Each application can be set up independently:

```bash
# Neovim only
cp -r config/nvim ~/.config/

# Terminal only  
cp -r config/ghostty ~/.config/

# All theming
cp -r config/{btop,zathura,spicetify} ~/.config/

# Development tools
cp -r config/{git,herd-lite,uv} ~/.config/
```

## Maintenance and Updates

### Regular Maintenance Tasks

```bash
# Update Neovim plugins
nvim -c "Lazy update"

# Update Spicetify
spicetify update

# Check for application updates
brew update && brew upgrade

# Backup configurations
tar -czf ~/config-backup-$(date +%Y%m%d).tar.gz ~/.config/
```

### Configuration Syncing

```bash
# Export configurations to dotfiles repo
rsync -av --exclude='.DS_Store' ~/.config/ ~/dotfiles/config/

# Commit and push changes
cd ~/dotfiles
git add -A
git commit -m "Update configurations $(date)"
git push
```

### Health Checks

```bash
# Check Neovim health
nvim -c "checkhealth"

# Verify terminal capabilities
echo $TERM
tput colors

# Test font rendering
echo "  Nerd Font icons should render properly"

# Check git configuration
git config --list
```

## Troubleshooting

### Common Issues and Solutions

1. **Font Rendering Problems**:
   ```bash
   # Verify Nerd Font installation
   fc-list | grep -i "jetbrains"
   
   # Reset font cache
   fc-cache -f -v
   ```

2. **Terminal Theme Issues**:
   - Check terminal supports 24-bit color
   - Verify theme files are properly loaded
   - Restart terminal after configuration changes

3. **Editor Performance**:
   ```bash
   # Profile Neovim startup
   nvim --startuptime startup.log +q
   
   # Check plugin loading times
   nvim -c "Lazy profile"
   ```

4. **Git Integration Problems**:
   - Verify git configuration is loaded
   - Check SSH keys and authentication
   - Test git operations in both terminal and editor

### Recovery Procedures

```bash
# Reset to default configurations
mv ~/.config ~/.config.backup
mkdir ~/.config

# Restore from backup
tar -xzf ~/config-backup-DATE.tar.gz -C ~/

# Reinstall specific applications
brew uninstall --cask ghostty && brew install --cask ghostty
```

## Customization Guidelines

### Adding New Tools
1. **Choose Location**: Determine appropriate `~/.config/` subdirectory
2. **Theme Integration**: Apply Yoru color scheme where possible
3. **Font Consistency**: Use JetBrainsMono Nerd Font
4. **Keybinding Harmony**: Follow established patterns
5. **Documentation**: Create README.md with setup instructions

### Modifying Existing Configurations
1. **Backup First**: Always backup before modifications
2. **Test Incrementally**: Make small changes and test
3. **Document Changes**: Update relevant documentation
4. **Version Control**: Commit changes to dotfiles repository

---
**Last Updated**: September 19, 2025  
**Version**: 2.0  
**Maintainer**: @enkyuan
