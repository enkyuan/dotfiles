local colors = require("cmd.themes").getCurrentTheme()
local utils = require("cmd.core.utils")

return {
	-- Tebufline - Completely transparent with only active titles highlighted
	TeBufOnActive = { fg = colors.foreground, bg = "NONE", bold = true },
	TeBufOnInactive = { fg = colors.foreground, bg = "NONE" }, -- Completely transparent, no gray background
	TeBufFolderOnActive = { fg = colors.blue, bg = "NONE", italic = true }, -- Highlight folder paths on active
	TeBufFolderOnInactive = { fg = colors.foreground, bg = "NONE", italic = true }, -- Normal color for inactive
	TeBufOnModified = { fg = colors.green, bg = "NONE" },
	TeBufOffModified = { fg = colors.foreground, bg = "NONE" }, -- No special highlighting for inactive modified
	TeBufOnClose = { fg = colors.red, bg = "NONE" },
	TeBufOffClose = { fg = colors.foreground, bg = "NONE" }, -- No special highlighting for inactive close
	TeBufTree = { bg = "NONE" }, -- Make tree space completely transparent
	TeBufEmpty = { bg = "NONE" }, -- Make empty space transparent
	TeBufEmptyColor = { bg = "NONE" }, -- Make empty color transparent
	TeBufCloseButton = { bg = "NONE", fg = colors.red },

	-- Action buttons - completely transparent backgrounds
	TeBufSplit = { bg = "NONE", fg = colors.blue },
	TeBufTrans = { bg = "NONE", fg = utils.mix(colors.foreground, colors.blue, 0.7) },
	TeBufTheme = { bg = "NONE", fg = colors.green },
	TeBufQuit = { bg = colors.red, fg = utils.blend(colors.foreground, colors.background, 0.08) },

	-- TeSttLine
	StatusLine = { bg = utils.blend(colors.foreground, colors.background, 0.015) },
	TeSTTNormalMode = { fg = colors.blue, bg = utils.blend(colors.blue, colors.background, 0.1) },
	TeSTTVisualMode = {
		fg = utils.mix(colors.red, colors.blue, 0.5),
		bg = utils.blend(utils.mix(colors.red, colors.blue, 0.5), colors.background, 0.1),
	},
	TeSTTCommandMode = { fg = colors.red, bg = utils.blend(colors.red, colors.background, 0.1) },
	TeSTTInsertMode = { fg = colors.green, bg = utils.blend(colors.green, colors.background, 0.1) },
	TeSTTTerminalMode = { fg = colors.red, bg = utils.blend(colors.red, colors.background, 0.1) },
	TeSTTNTerminalMode = { fg = colors.red, bg = utils.blend(colors.red, colors.background, 0.1) },
	TeSTTConfirmMode = {
		fg = utils.mix(colors.red, colors.green, 0.5),
		bg = utils.blend(utils.mix(colors.red, colors.green, 0.5), colors.background, 0.1),
	},
	TeSTTNormalModeIcon = { fg = colors.background, bg = colors.blue },
	TeSTTVisualModeIcon = { fg = colors.background, bg = utils.mix(colors.red, colors.blue, 0.5) },
	TeSTTCommandModeIcon = { fg = colors.background, bg = colors.red },
	TeSTTInsertModeIcon = { fg = colors.background, bg = colors.green },
	TeSTTTerminalModeIcon = { fg = colors.background, bg = colors.red },
	TeSTTNTerminalModeIcon = { fg = colors.background, bg = colors.red },
	TeSTTConfirmModeIcon = { fg = colors.background, bg = utils.mix(colors.red, colors.green, 0.5) },

	TeSTTFileIcon = { fg = colors.background, bg = colors.red },
	TeSTTFileName = { fg = colors.red, bg = utils.blend(colors.red, colors.background, 0.1), bold = true },
	TeSTTFolder = { fg = colors.red, bg = utils.blend(colors.red, colors.background, 0.1), italic = true },

	TeSTTNothing = { bg = utils.blend(colors.foreground, colors.background, 0.015) },
	TeSTTNothing2 = { bg = colors.background },

	TeSTTLsp = { fg = colors.green, bg = utils.blend(colors.green, colors.background, 0.1) },
	TeSTTLspIcon = { fg = colors.background, bg = colors.green },
	TeSTTCopilot = {
		fg = utils.mix(colors.foreground, colors.blue, 0.7),
		bg = utils.blend(colors.green, colors.background, 0.1),
	},
	TeSTTCodeium = {
		fg = utils.mix(colors.foreground, colors.blue, 0.7),
		bg = utils.blend(colors.green, colors.background, 0.1),
	},
	TeSTTTabnine = {
		fg = utils.mix(colors.foreground, colors.blue, 0.7),
		bg = utils.blend(colors.green, colors.background, 0.1),
	},

	TeSTTError = { fg = colors.red, bg = utils.blend(colors.green, colors.background, 0.1) },
	TeSTTErrorIcon = { fg = colors.red, bg = utils.blend(colors.green, colors.background, 0.1) },
	TeSTTWarning = {
		fg = utils.mix(colors.red, colors.green, 0.5),
		bg = utils.blend(colors.green, colors.background, 0.1),
	},
	TeSTTWarningIcon = {
		fg = utils.mix(colors.red, colors.green, 0.5),
		bg = utils.blend(colors.green, colors.background, 0.1),
	},
	TeSTTHints = {
		fg = utils.mix(colors.red, colors.blue, 0.5),
		bg = utils.blend(colors.green, colors.background, 0.1),
	},
	TeSTTHintsIcon = {
		fg = utils.mix(colors.red, colors.blue, 0.5),
		bg = utils.blend(colors.green, colors.background, 0.1),
	},
	TeSTTInfo = { fg = colors.blue, bg = utils.blend(colors.green, colors.background, 0.1) },
	TeSTTInfoIcon = { fg = colors.blue, bg = utils.blend(colors.green, colors.background, 0.1) },

	TeSTTBranchName = {
		fg = utils.mix(colors.red, colors.blue, 0.5),
		bg = utils.blend(utils.mix(colors.red, colors.blue, 0.5), colors.background, 0.1),
	},
	TeSTTBranchIcon = { fg = colors.background, bg = utils.mix(colors.red, colors.blue, 0.5) },
	TeSTTDiffAdd = { fg = colors.green, bg = utils.blend(colors.blue, colors.background, 0.1) },
	TeSTTDiffChange = {
		fg = utils.mix(colors.red, utils.mix(colors.red, colors.green, 0.5), 0.8),
		bg = utils.blend(colors.blue, colors.background, 0.1),
	},
	TeSTTDiffRemove = { fg = colors.red, bg = utils.blend(colors.blue, colors.background, 0.1) },
	TeSTTGithub = { fg = colors.background, bg = colors.blue },

	TeSTTTabIcon = { fg = colors.background, bg = colors.red },
	TeSTTTab = { fg = colors.red, bg = utils.blend(colors.red, colors.background, 0.1) },

	TeSTTProgressIcon = { fg = colors.background, bg = utils.mix(colors.red, colors.blue, 0.5) },
	TeSTTProgress = {
		fg = utils.mix(colors.red, colors.blue, 0.5),
		bg = utils.blend(utils.mix(colors.red, colors.blue, 0.5), colors.background, 0.1),
	},

	TeSTTLocationIcon = { fg = colors.background, bg = utils.mix(colors.red, colors.green, 0.5) },
	TeSTTLocation = {
		fg = utils.mix(colors.red, colors.green, 0.5),
		bg = utils.blend(utils.mix(colors.red, colors.green, 0.5), colors.background, 0.1),
	}
}
