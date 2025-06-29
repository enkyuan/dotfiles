return {
	groups = {
		'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
		'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
		'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
		'SignColumn', 'CursorColumn', 'CursorLine', 'TabLine', 'TabLineFill', 'StatusLine', 
		'StatusLineNC', 'VertSplit', 'WinSeparator', 'WinBar', 'WinBarNC'
	},
	extra_groups = {
		-- NeoTree
		"NeoTreeNormal",
		"NeoTreeNormalNC", 
		"NeoTreeWinSeparator",
		"NeoTreeEndOfBuffer",
		"NeoTreeTitleBar",
		"NeoTreeFloatNormal",
		"NeoTreeFloatBorder",
		"NeoTreeTabInactive",
		"NeoTreeTabActive",
		"NeoTreeTabSeparatorInactive",
		"NeoTreeTabSeparatorActive",
		-- Telescope
		"TelescopeNormal",
		"TelescopeBorder",
		"TelescopePromptNormal",
		"TelescopePromptBorder",
		"TelescopeResultsNormal",
		"TelescopeResultsBorder",
		"TelescopePreviewNormal",
		"TelescopePreviewBorder",
		"TelescopeTitle",
		-- WhichKey
		"WhichKey",
		"WhichKeyGroup",
		"WhichKeyDesc",
		"WhichKeySeperator",
		"WhichKeyFloat",
		"WhichKeyBorder",
		"WhichKeyValue",
		-- CMP (Completion Menu)
		"CmpNormal",
		"CmpBorder",
		"CmpDocumentation",
		"CmpDocumentationBorder",
		"CmpItemAbbr",
		"CmpItemMenu",
		-- BufferLine/StatusLine (Custom TeVim components)
		"TeBufOnInactive",
		"TeBufOnActive", 
		"TeBufOnClose",
		"TeBufOffClose",
		"TeBufEmptyColor",
		"TeBufOffModified",
		"TeBufEmpty",
		"TeBufTree",
		"TeSTTNothing",
		"TeSTTNothing2",
		-- Terminal
		"ToggleTerm",
		"ToggleTermBorder",
		"TerminalNormal",
		-- Notifications
		"NotifyBackground",
		"NotifyINFOBorder",
		"NotifyWARNBorder", 
		"NotifyERRORBorder",
		"NotifyDEBUGBorder",
		"NotifyTRACEBorder",
		"NotifyINFOBody",
		"NotifyWARNBody",
		"NotifyERRORBody",
		"NotifyDEBUGBody",
		"NotifyTRACEBody",
		-- LSP/Diagnostics
		"LspInfoBorder",
		"LspSagaBorder",
		"LspSagaTitle",
		"LspReferenceText",
		"LspReferenceRead",
		"LspReferenceWrite",
		"DiagnosticVirtualTextError",
		"DiagnosticVirtualTextWarn",
		"DiagnosticVirtualTextInfo",
		"DiagnosticVirtualTextHint",
		-- Mason
		"MasonNormal",
		"MasonBorder",
		"MasonHeader",
		-- Folding
		"Folded",
		"FoldColumn",
		-- Indent Blankline
		"IndentBlanklineChar",
		"IndentBlanklineSpaceChar",
		"IndentBlanklineContextChar",
		-- Git Signs
		"GitSignsAdd",
		"GitSignsChange", 
		"GitSignsDelete",
		-- Mini plugins
		"MiniIndentscopeSymbol",
		-- Treesitter Context
		"TreesitterContext",
		"TreesitterContextLineNumber",
		-- Noice
		"NoicePopup",
		"NoicePopupBorder",
		"NoiceCmdlinePopup",
		"NoiceCmdlinePopupBorder",
		"NoiceMini",
		-- Lazy
		"LazyNormal",
		"LazyBorder",
		-- Help
		"HelpNormal",
		-- Autocomplete/Snippets
		"LuasnipInsertNodeText",
		"LuasnipChoiceNodeText",
		-- LeetCode
		"LeetCodeNormal",
		"LeetCodeBorder",
		"LeetCodeDescription",
		"LeetCodeConsole",
		"LeetCodeTestCase",
	},
	exclude_groups = {
		-- Keep some elements opaque for better readability
		"CursorLineNr", -- Keep cursor line number visible
		"Search", -- Keep search highlighting visible
		"IncSearch", -- Keep incremental search visible
	},
} 