local colors = require("cmd.themes").getCurrentTheme()
local utils = require("cmd.core.utils")

return {
	-- Main backgrounds will be handled by transparency system - remove explicit bg colors
	NeoTreeNormal = {},
	NeoTreeNormalNC = {},
	-- Make separator more subtle for better transparency
	NeoTreeWinSeparator = { bg = "NONE", fg = utils.blend(colors.foreground, colors.background, 0.05) },
	NeoTreeIndentMarker = { fg = utils.blend(colors.foreground, colors.background, 0.03) },
	NeoTreeExpander = { fg = utils.blend(colors.foreground, colors.background, 0.3) },
	NeoTreeDirectoryIcon = { fg = colors.blue },
	NeoTreeDirectoryName = { fg = colors.blue },
	NeoTreeRootName = { fg = colors.blue, bold = true },
	-- Title bar background will be handled by transparency system
	NeoTreeTitleBar = {},
	NeoTreeModified = { fg = colors.green },

	-- Float window elements for better transparency - remove explicit bg colors
	NeoTreeFloatNormal = {},
	NeoTreeFloatBorder = { bg = "NONE", fg = utils.blend(colors.foreground, colors.background, 0.2) },
	NeoTreeEndOfBuffer = {},

	-- Tab elements for consistency - remove explicit bg colors
	NeoTreeTabInactive = { fg = utils.blend(colors.foreground, colors.background, 0.6) },
	NeoTreeTabActive = { fg = colors.foreground, bold = true },
	NeoTreeTabSeparatorInactive = { bg = "NONE", fg = utils.blend(colors.foreground, colors.background, 0.1) },
	NeoTreeTabSeparatorActive = { bg = "NONE", fg = utils.blend(colors.foreground, colors.background, 0.2) },

	NeoTreeGitAdded = { fg = colors.green },
	NeoTreeGitConflict = { fg = colors.red },
	NeoTreeGitDeleted = { fg = colors.red },
	NeoTreeGitIgnored = { fg = utils.blend(colors.foreground, colors.background, 0.3) },
	NeoTreeGitModified = { fg = utils.mix(colors.red, utils.mix(colors.red, colors.green, 0.5), 0.8) },
	NeoTreeGitUnstaged = { fg = colors.red },
	NeoTreeGitUntracked = { fg = colors.green },
	NeoTreeGitStaged = { fg = colors.green },
}
