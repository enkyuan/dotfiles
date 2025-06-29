local colors = require("cmd.themes").getCurrentTheme()
local utils = require("cmd.core.utils")

local M = {}

--- General ---
local normal = {
	"Normal",
	"NormalFloat",
	"WinBar",
	"WinBarNC",
	"Folded",
	"FoldColumn",
	"LineNr",
	"CursorColumn",
	"ColorColumn",
	"SignColumn",
	"CursorLine",
	"MsgArea",
}

M.WinSeparator = {
	fg = utils.blend(colors.foreground, colors.background, 0.1),
	bg = "NONE",
}

for _, normal_hl in ipairs(normal) do
	M[normal_hl] = {
		bg = "NONE",
	}
end

--- UI ---
local ui = {
	"StatusLine",
	"StatusLineNC",
	"STTNothing",
	"STTNothing2",
	"BufOnInactive",
	"BufOnActive",
	"BufOnClose",
	"BufOffClose",
	"BufEmptyColor",
	"BufOffModified",
	"BufEmpty",
	"BufTree",
}

for _, ui_hl in ipairs(ui) do
	M[ui_hl] = {
		bg = "NONE",
	}
end

-- Statusline transparency overrides
-- These need to match the exact names from ui.lua
M.STTNormalMode = { bg = "NONE" }
M.STTVisualMode = { bg = "NONE" }
M.STTCommandMode = { bg = "NONE" }
M.STTInsertMode = { bg = "NONE" }
M.STTTerminalMode = { bg = "NONE" }
M.STTNTerminalMode = { bg = "NONE" }
M.STTConfirmMode = { bg = "NONE" }
M.STTNormalModeIcon = { bg = "NONE" }
M.STTVisualModeIcon = { bg = "NONE" }
M.STTCommandModeIcon = { bg = "NONE" }
M.STTInsertModeIcon = { bg = "NONE" }
M.STTTerminalModeIcon = { bg = "NONE" }
M.STTNTerminalModeIcon = { bg = "NONE" }
M.STTConfirmModeIcon = { bg = "NONE" }
M.STTFileIcon = { bg = "NONE" }
M.STTFileName = { bg = "NONE" }
M.STTFolder = { bg = "NONE" }
M.STTLsp = { bg = "NONE" }
M.STTLspIcon = { bg = "NONE" }
M.STTCopilot = { bg = "NONE" }
M.STTCodeium = { bg = "NONE" }
M.STTTabnine = { bg = "NONE" }
M.STTError = { bg = "NONE" }
M.STTErrorIcon = { bg = "NONE" }
M.STTWarning = { bg = "NONE" }
M.STTWarningIcon = { bg = "NONE" }
M.STTHints = { bg = "NONE" }
M.STTHintsIcon = { bg = "NONE" }
M.STTInfo = { bg = "NONE" }
M.STTInfoIcon = { bg = "NONE" }
M.STTBranchName = { bg = "NONE" }
M.STTBranchIcon = { bg = "NONE" }
M.STTDiffAdd = { bg = "NONE" }
M.STTDiffChange = { bg = "NONE" }
M.STTDiffRemove = { bg = "NONE" }
M.STTGithub = { bg = "NONE" }
M.STTTabIcon = { bg = "NONE" }
M.STTTab = { bg = "NONE" }
M.STTProgressIcon = { bg = "NONE" }
M.STTProgress = { bg = "NONE" }
M.STTLocationIcon = { bg = "NONE" }
M.STTLocation = { bg = "NONE" }

--- Telescope ---
local telescope = {
	"TelescopeNormal",
	"TelescopePrompt",
	"TelescopeBorder",
	"TelescopeResults",
	"TelescopePromptNormal",
	"TelescopePromptPrefix",
	"TelescopeSelection",
}

M.TelescopePromptBorder = {
	fg = utils.blend(colors.foreground, colors.background, 0.1),
	bg = "NONE",
}

M.TelescopePreviewBorder = {
	fg = utils.blend(colors.foreground, colors.background, 0.1),
	bg = "NONE",
}

M.TelescopeResultsBorder = {
	fg = utils.blend(colors.foreground, colors.background, 0.1),
	bg = "NONE",
}

for _, telescope_hl in ipairs(telescope) do
	M[telescope_hl] = {
		bg = "NONE",
	}
end

--- NeoTree ---
local tree = {
	"NeoTreeNormal",
	"NeoTreeNormalNC",
	"NeoTreeTitleBar",
	"NeoTreeEndOfBuffer",
	"NeoTreeFloatNormal",
	"NeoTreeFloatBorder",
	"NeoTreeTabInactive",
	"NeoTreeTabActive",
	"NeoTreeTabSeparatorInactive",
	"NeoTreeTabSeparatorActive",
}

M.NeoTreeWinSeparator = {
	fg = utils.blend(colors.foreground, colors.background, 0.1),
	bg = "NONE",
}

-- Make title bar more transparent to match Kitty's 0.95 opacity
M.NeoTreeTitleBar = {
	bg = "NONE",
	fg = colors.foreground,
	bold = true,
}

for _, tree_hl in ipairs(tree) do
	M[tree_hl] = {
		bg = "NONE",
	}
end

--- WhichKey ---
local whichkey = {
	"WhichKey",
	"WhichKeyGroup",
	"WhichKeyDesc",
	"WhichKeyFloat",
}

for _, whichkey_hl in ipairs(whichkey) do
	M[whichkey_hl] = {
		bg = "NONE",
	}
end

--- CMP ---
local cmp = {
	"CmpNormal",
	"CmpItemAbbr",
	"CmpItemAbbrDeprecated",
	"CmpItemMenu",
}

M.CmpBorder = {
	fg = utils.blend(colors.foreground, colors.background, 0.1),
	bg = "NONE",
}

M.CmpItemAbbrMatch = {
	bg = "NONE",
	bold = true,
}

for _, cmp_hl in ipairs(cmp) do
	M[cmp_hl] = {
		bg = "NONE",
	}
end

--- Noice ---
local noice = {
	"NoiceMini",
	"NoiceCmdlinePopup",
	"NoiceCmdlinePopupBorder",
	"NoiceCmdlinePopupBorderSearch",
	"NoiceCmdlinePopupTitle",
	"NotifyBackground",
	"NotifyINFOBorder",
	"NotifyWARNBorder",
	"NotifyERRORBorder",
	"NotifyDEBUGBorder",
	"NotifyTRACEBorder",
	"NotifyLogTime",
	"NotifyERRORIcon",
	"NotifyWARNIcon",
	"NotifyINFOIcon",
	"NotifyDEBUGIcon",
	"NotifyTRACEIcon",
	"NotifyERRORTitle",
	"NotifyWARNTitle",
	"NotifyINFOTitle",
	"NotifyDEBUGTitle",
	"NotifyTRACETitle",
	"NotifyERRORBody",
	"NotifyWARNBody",
	"NotifyINFOBody",
	"NotifyDEBUGBody",
	"NotifyTRACEBody",
}

for _, noice_hl in ipairs(noice) do
	M[noice_hl] = {
		bg = "NONE",
	}
end

-- Treesitter Context --
M.TreesitterContext = {
	bg = "NONE",
}

return M
