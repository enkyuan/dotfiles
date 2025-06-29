# LeetCode.nvim Plugin Setup

LeetCode.nvim has been successfully integrated into your TeVim configuration with Python3 as the default language.

## 🚀 Quick Start

1. **Launch LeetCode**: Use the command `:Leet` or press `<Leader>Lm` to open the LeetCode menu
2. **Sign In**: You'll need to sign in with your LeetCode session cookie (see Sign In section below)
3. **Start Coding**: Browse problems, select one, and start solving!

## 🎯 Features Configured

- **Default Language**: Python3 (with default imports enabled)
- **Storage**: Uses standard Neovim data/cache directories
- **Picker**: Integrated with Telescope (TeVim's picker)
- **Description Panel**: Left side, 40% width with stats
- **Console**: Opens automatically when running code
- **Theme**: Integrated with TeVim's Yoru theme and transparency

## ⌨️ Key Bindings

All LeetCode commands use the `<Leader>L` prefix:

| Keybinding    | Command              | Description                |
|---------------|----------------------|----------------------------|
| `<Leader>Lm`  | `:Leet menu`         | Open LeetCode menu         |
| `<Leader>Ll`  | `:Leet list`         | Browse problems list       |
| `<Leader>Lr`  | `:Leet random`       | Open random problem        |
| `<Leader>Ld`  | `:Leet daily`        | Open daily challenge       |
| `<Leader>Lt`  | `:Leet test`         | Run tests                  |
| `<Leader>Ls`  | `:Leet submit`       | Submit solution            |
| `<Leader>Lc`  | `:Leet console`      | Open console               |
| `<Leader>Li`  | `:Leet info`         | Show problem info          |
| `<Leader>Lg`  | `:Leet lang`         | Change language            |
| `<Leader>LR`  | `:Leet reset`        | Reset code to default      |
| `<Leader>Ly`  | `:Leet yank`         | Copy solution to clipboard |
| `<Leader>Lo`  | `:Leet open`         | Open in browser            |
| `<Leader>LD`  | `:Leet desc toggle`  | Toggle description panel   |

## 🔐 Sign In Process

1. Go to [LeetCode](https://leetcode.com) in your browser
2. Sign in to your account
3. Open browser developer tools (F12)
4. Go to Network tab
5. Make any request (refresh page)
6. Copy the `Cookie` value from request headers (**not** from response set-cookie)
7. In Neovim, run `:Leet cookie update` and paste the cookie

## 🎛️ Available Commands

- `:Leet menu` - Main dashboard
- `:Leet list [status=<status>] [difficulty=<difficulty>]` - Browse problems
- `:Leet random [status=<status>] [difficulty=<difficulty>] [tags=<tags>]` - Random problem
- `:Leet daily` - Daily challenge
- `:Leet run` / `:Leet test` - Test your solution
- `:Leet submit` - Submit your solution
- `:Leet lang` - Change programming language
- `:Leet console` - Open test console
- `:Leet info` - Problem information
- `:Leet tabs` - Switch between open problems
- `:Leet yank` - Copy solution to clipboard
- `:Leet open` - Open problem in browser
- `:Leet reset` - Reset to default code
- `:Leet desc toggle` - Toggle description panel

## 🐍 Python3 Configuration

The plugin is pre-configured for Python3 with:
- Default imports enabled (common Python modules)
- Automatic code injection
- Python3 syntax highlighting
- Proper indentation settings

## 🎨 Theme Integration

LeetCode.nvim windows are integrated with:
- TeVim's Yoru color scheme
- Transparency support (matches terminal transparency)
- Consistent UI with other TeVim plugins
- Excluded from indent-blankline for better readability

## 🔧 Configuration Location

- Plugin config: `lua/tevim/plugins/configs/leetcode.lua`
- Keybindings: `lua/tevim/core/keymaps.lua`
- Storage: `~/.local/share/nvim/leetcode/` (problems) and `~/.cache/nvim/leetcode/` (cache)

## 💡 Tips

1. Use `:Leet tabs` to switch between multiple open problems
2. The description panel can be toggled if you need more space
3. Console automatically opens when testing - use `H` and `L` to focus between testcases and results
4. Your solutions are automatically saved locally
5. Use `:Leet yank` to easily copy solutions for sharing or backup

Enjoy coding on LeetCode directly from Neovim! 🎉 