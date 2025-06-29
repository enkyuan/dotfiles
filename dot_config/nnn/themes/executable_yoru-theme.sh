#!/bin/bash

# Yoru Theme for nnn file manager
# Based on the Yoru color scheme by User
# 
# Usage:
#   Source this file in your shell rc file (~/.bashrc, ~/.zshrc, etc.):
#   source ~/.config/nnn/themes/yoru-theme.sh
#
#   Or run it directly to test:
#   cd ~/.config/nnn/themes && source yoru-theme.sh && nnn

# Yoru Color Palette (from kitty/nvim themes):
# Background: #0c0e0f
# Foreground: #edeff0  
# Red:        #DF5B61
# Green:      #78B892
# Blue:       #6791C9
# Yellow:     #ecd28b
# Magenta:    #c58cec
# Cyan:       #6791C9

# Context colors (4 contexts/tabs) - using Yoru blue variations
# Format: 4 hex values or basic colors, can also use #RRGGBB format
export NNN_COLORS='#4467694467'

# File-specific colors in xterm 256 format (12 values, 2 hex digits each)
# Order: BLK CHR DIR EXE REG HARDLINK SYMLINK MISSING ORPHAN FIFO SOCK OTHER
# 
# Color mapping based on Yoru palette:
# BLK (Block device)     - 9c (dark green for devices)
# CHR (Char device)      - e2 (yellow for char devices) 
# DIR (Directory)        - 67 (Yoru blue for directories)
# EXE (Executable)       - b0 (bright green for executables)
# REG (Regular file)     - 00 (default/normal text color)
# HARDLINK (Hard link)   - d5 (magenta for links)
# SYMLINK (Symbolic link)- 44 (cyan/blue for symlinks)
# MISSING (Missing)      - f7 (gray for missing files)
# ORPHAN (Orphaned link) - d1 (red for broken links) 
# FIFO (FIFO)           - e6 (orange/yellow for pipes)
# SOCK (Socket)         - d5 (magenta for sockets)
# OTHER (Unknown)       - d1 (red for unknown types)
export NNN_FCOLORS='9ce267b000d544f7d1e6d5d1'

# Optional: Additional nnn environment variables for Yoru theme consistency
export NNN_OPTS='cEnrx'           # Show colors, use $EDITOR, show hidden, auto-refresh, notifications
export NNN_BMS='d:~/Documents;D:~/Downloads;p:~/Pictures;v:~/Videos;c:~/.config'

# Color test function
test_nnn_colors() {
    echo "Testing Yoru theme for nnn..."
    echo "Context colors: $NNN_COLORS"
    echo "File colors: $NNN_FCOLORS"
    echo "Launch nnn to see the theme in action!"
}

# Auto-run test if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    test_nnn_colors
fi

echo "Yoru theme for nnn loaded!"
echo "Colors: Context=$NNN_COLORS Files=$NNN_FCOLORS" 