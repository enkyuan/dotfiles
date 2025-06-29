local colors = require("cmd.themes").getCurrentTheme()

return {
	SagaNormal = { bg = colors.darker },
	SagaBorder = { bg = colors.darker, fg = colors.darker },
	RenameNormal = { bg = colors.darker },
	RenameBorder = { bg = colors.darker, fg = colors.darker },
}
