# Spicetify Configuration

This document provides comprehensive documentation for the Spicetify setup, which customizes Spotify's appearance and functionality with themes and extensions.

## Overview

Spicetify is a command-line tool that enables customization of the Spotify Desktop client through:
- **Theme System**: Custom visual themes and color schemes
- **Extensions**: JavaScript-based functionality additions
- **Custom Apps**: Third-party applications within Spotify
- **Marketplace Integration**: Easy access to community themes and extensions

## Configuration Structure

```
~/.config/spicetify/
├── config-xpui.ini           # Main configuration file
├── spicetify_apply.sh        # Application script
├── spicetify_backup.sh       # Backup script
├── Backups/                  # Spotify client backups
│   ├── config-xpui.ini      # Configuration backups
│   ├── spicetify_apply.sh   # Script backups
│   ├── spicetify_backup.sh  # Backup script backups
│   ├── CustomApps/          # App backups
│   ├── Extensions/          # Extension backups
│   ├── Themes/              # Theme backups
│   └── spicetify/           # Nested backup structure
├── CustomApps/              # Custom Spotify applications
│   └── marketplace/         # Spicetify Marketplace app
├── Extensions/              # JavaScript extensions (currently empty)
└── Themes/                  # Custom theme definitions
    └── marketplace/         # Marketplace theme files
```

## Main Configuration (`config-xpui.ini`)

### Preprocessing Options
```ini
[Preprocesses]
expose_apis        = 1      # Enables API access for extensions
disable_sentry     = 1      # Disables Spotify crash reporting
disable_ui_logging = 1      # Disables UI event logging
remove_rtl_rule    = 1      # Removes right-to-left layout rules
```

**Security & Privacy**:
- Disables telemetry and crash reporting
- Enables API access for custom functionality
- Removes unnecessary UI rules

### Additional Options
```ini
[AdditionalOptions]
extensions            =     # No custom extensions currently loaded
custom_apps           = marketplace  # Marketplace app enabled
sidebar_config        = 0   # Default sidebar configuration
home_config           = 1   # Modified home screen layout
experimental_features = 1   # Enable experimental Spotify features
```

**Feature Configuration**:
- **Marketplace App**: Provides access to community themes and extensions
- **Experimental Features**: Enables newer Spotify features
- **Modified Home**: Customized home screen experience

### Injection Settings
```ini
[Setting]
inject_theme_js        = 1  # Enable theme JavaScript injection
inject_css             = 1  # Enable CSS theme injection
overwrite_assets       = 0  # Don't overwrite Spotify assets
replace_colors         = 1  # Enable color scheme replacement
check_spicetify_update = 1  # Check for Spicetify updates
always_enable_devtools = 0  # Keep dev tools disabled
current_theme          = marketplace  # Active theme
color_scheme           =    # No specific color scheme override
```

**Theme System**:
- Full CSS and JavaScript injection enabled
- Uses "marketplace" theme as default
- Automatic update checking enabled
- Color replacement system active

### Application Paths
```ini
spotify_path           = /Applications/Spotify.app/Contents/Resources
prefs_path             = /Users/enkyuan/Library/Application Support/Spotify/prefs
```

**System Integration**:
- Points to standard macOS Spotify installation
- Uses default Spotify preferences location

## Marketplace Integration

### Spicetify Marketplace App
The marketplace app (`CustomApps/marketplace/`) provides:

#### Core Files
- **`manifest.json`**: App metadata and configuration
- **`index.js`**: Main application logic and UI
- **`extension.js`**: Extension functionality
- **`style.css`**: Custom styling and layout
- **`README.md`**: Documentation and usage instructions

#### Features
- **Theme Browser**: Browse and install community themes
- **Extension Manager**: Install and manage extensions
- **Preview System**: Preview themes before installation
- **Auto-Updates**: Keep themes and extensions updated
- **Community Integration**: Access to Spicetify community resources

### Marketplace Theme
The marketplace theme (`Themes/marketplace/`) includes:
- **`color.ini`**: Color scheme definitions
- **Theme assets**: Custom styling files
- **Integration scripts**: JavaScript enhancements

## Installation and Setup

### Prerequisites
```bash
# Install Spicetify CLI
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh

# Or via Homebrew
brew install spicetify-cli

# Ensure Spotify is installed
brew install --cask spotify
```

### Initial Setup
```bash
# Grant Spicetify permission to modify Spotify
sudo spicetify backup apply

# Install marketplace (recommended)
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh
```

### Configuration Deployment
```bash
# Copy configuration files
cp config-xpui.ini ~/.config/spicetify/
cp -r CustomApps/* ~/.config/spicetify/CustomApps/
cp -r Themes/* ~/.config/spicetify/Themes/

# Apply configuration
spicetify backup apply
```

## Usage Guide

### Basic Commands
```bash
# Apply current configuration
spicetify apply

# Backup Spotify before modifications
spicetify backup

# Restore original Spotify
spicetify restore

# Update Spicetify
spicetify update

# Watch for config changes and auto-apply
spicetify watch
```

### Theme Management
```bash
# List available themes
spicetify config theme_list

# Set theme
spicetify config current_theme THEME_NAME
spicetify apply

# Set color scheme
spicetify config color_scheme SCHEME_NAME
spicetify apply
```

### Extension Management
```bash
# Add extension
spicetify config extensions EXTENSION_NAME

# Remove extension
spicetify config extensions EXTENSION_NAME-

# Apply changes
spicetify apply
```

## Marketplace Usage

### Accessing Marketplace
1. Open Spotify after Spicetify setup
2. Look for "Marketplace" in the sidebar or apps section
3. Browse available themes and extensions
4. Install with one-click functionality

### Installing Themes
1. Navigate to "Themes" section in Marketplace
2. Preview themes with live preview
3. Click "Install" on desired theme
4. Theme applies automatically

### Installing Extensions
1. Go to "Extensions" section
2. Review extension descriptions and features
3. Install compatible extensions
4. Restart Spotify if required

## Customization Options

### Custom Themes
Create custom themes in `~/.config/spicetify/Themes/THEME_NAME/`:
```
THEME_NAME/
├── color.ini          # Color definitions
├── user.css           # Custom CSS styles
└── theme.js           # JavaScript enhancements (optional)
```

#### Color Configuration (`color.ini`)
```ini
[Base]
main_fg                = ffffff  # Primary text color
secondary_fg           = b3b3b3  # Secondary text color
main_bg                = 121212  # Primary background
sidebar_and_player_bg  = 000000  # Sidebar/player background
cover_overlay_and_shadow = 000000  # Cover overlays

[Accent]
accent_fg              = ffffff  # Accent text
accent_bg              = 1db954  # Accent background (Spotify green)
```

### Custom Extensions
Create extensions in `~/.config/spicetify/Extensions/`:
```javascript
// extension-name.js
(function() {
    // Extension code here
    console.log("Custom extension loaded");
})();
```

## Advanced Configuration

### Auto-Application Scripts
The configuration includes helper scripts:

#### `spicetify_apply.sh`
```bash
#!/bin/bash
# Automatic application script
spicetify backup apply
echo "Spicetify configuration applied successfully"
```

#### `spicetify_backup.sh`
```bash
#!/bin/bash  
# Backup creation script
spicetify backup
echo "Spotify backup created"
```

### Configuration Validation
```bash
# Check configuration status
spicetify status

# Validate theme and extensions
spicetify config

# Test current setup
spicetify apply --debug
```

## Integration with System Theme

### Consistency with Terminal Setup
While Spicetify customizes Spotify independently, it can coordinate with the overall system theme:

- **Color Harmony**: Choose themes that complement the Yoru terminal color scheme
- **Visual Consistency**: Select themes with similar design philosophy
- **Dark Mode**: Ensure dark themes across all applications

### Recommended Themes for Yoru Compatibility
- **Sleek**: Clean dark theme
- **Dribbblish**: Modern dark interface
- **Text**: Minimal text-focused theme
- **Fluent**: Modern design language theme

## Troubleshooting

### Common Issues

1. **Spicetify Won't Apply**:
   ```bash
   # Check Spotify permissions
   ls -la /Applications/Spotify.app/Contents/Resources/
   
   # Re-grant permissions
   sudo spicetify backup apply
   ```

2. **Themes Not Loading**:
   - Verify theme files exist in correct directory
   - Check `current_theme` setting in config
   - Ensure CSS injection is enabled

3. **Extensions Not Working**:
   - Check JavaScript injection is enabled
   - Verify extension compatibility with Spotify version
   - Review browser console for errors

4. **Marketplace Not Appearing**:
   - Ensure `custom_apps = marketplace` is set
   - Verify marketplace files are properly installed
   - Restart Spotify after configuration changes

### Reset Configuration
```bash
# Restore original Spotify
spicetify restore

# Clear configuration
rm -rf ~/.config/spicetify/

# Reinstall clean setup
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
```

## Security Considerations

### What Spicetify Modifies
- **Spotify Client Files**: Injects custom CSS/JavaScript
- **Application Bundle**: Modifies app resources
- **User Data**: Accesses Spotify preferences (read-only)

### Privacy Settings
The current configuration:
- ✅ Disables Sentry crash reporting
- ✅ Disables UI event logging  
- ✅ Maintains local control of modifications
- ❌ Enables API access (required for functionality)

### Best Practices
- Keep Spicetify updated for security patches
- Only install trusted themes and extensions
- Regular backups before major changes
- Monitor Spotify app permissions

## Backup and Sync

### Creating Backups
```bash
# Full configuration backup
tar -czf spicetify-config.tar.gz ~/.config/spicetify/

# Backup just customizations
cp -r ~/.config/spicetify/Themes/ ~/spicetify-themes-backup/
cp -r ~/.config/spicetify/Extensions/ ~/spicetify-extensions-backup/
```

### Syncing Across Machines
```bash
# Export configuration
rsync -av ~/.config/spicetify/ user@remote:~/.config/spicetify/

# Or use git for version control
cd ~/.config/spicetify/
git init
git add .
git commit -m "Initial Spicetify configuration"
```

## Performance Considerations

### Impact on Spotify
- **Startup Time**: Minimal increase due to theme injection
- **Memory Usage**: Slight increase from custom CSS/JS
- **Functionality**: No impact on core Spotify features
- **Updates**: Requires reapplication after Spotify updates

### Optimization Tips
- Use lightweight themes for better performance
- Limit number of active extensions
- Regular cleanup of unused themes/extensions
- Monitor resource usage with Activity Monitor

## Future Enhancements

### Planned Improvements
- Custom extension development for workflow integration
- Theme synchronization with system dark/light mode
- Integration with music workflow automation
- Custom visualizer extensions

### Community Integration
- Contribute themes to Spicetify marketplace
- Share configuration with development community
- Participate in Spicetify development and testing

## Resources

- [Spicetify CLI Documentation](https://spicetify.app/)
- [Spicetify Marketplace](https://github.com/spicetify/spicetify-marketplace)
- [Theme Development Guide](https://spicetify.app/docs/development/themes)
- [Extension Development](https://spicetify.app/docs/development/extensions)
- [Community Themes](https://github.com/spicetify/spicetify-themes)

---

*This Spicetify configuration provides a customized Spotify experience that integrates with the broader development environment while maintaining security and performance.*