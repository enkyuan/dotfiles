return {
	-- Default argument for Neovim
	arg = "leetcode.nvim",

	-- Default language set to Python3 as requested
	lang = "python3",

	-- LeetCode.cn support (disabled by default)
	cn = {
		enabled = false,
		translator = true,
		translate_problems = true,
	},

	-- Storage directories using standard Neovim paths
	storage = {
		home = vim.fn.stdpath("data") .. "/leetcode",
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},

	-- Plugin configuration
	plugins = {
		non_standalone = true,
	},

	-- Enable logging for status notifications
	logging = true,

	-- Code injection for Python3 with default imports
	injector = {
		["python3"] = {
			before = true, -- Use default imports for Python3
		},
		["python"] = {
			before = true, -- Use default imports for Python
		},
	},

	-- Cache settings
	cache = {
		update_interval = 60 * 60 * 24 * 365, --  1 year (365 days)
	},

	-- Console configuration
	console = {
		open_on_runcode = true,
		dir = "row",
		size = {
			width = "90%",
			height = "75%",
		},
		result = {
			size = "60%",
		},
		testcase = {
			virt_text = true,
			size = "40%",
		},
	},

	-- Description panel configuration
	description = {
		position = "left",
		width = "40%",
		show_stats = true,
	},

	-- Picker configuration (TeVim uses Telescope)
	picker = {
		provider = "telescope",
	},

	-- Hooks for custom functionality
	hooks = {
		["enter"] = {},
		["question_enter"] = {},
		["leave"] = {},
	},

	-- Key mappings
	keys = {
		toggle = { "q" },
		confirm = { "<CR>" },
		reset_testcases = "r",
		use_testcase = "U",
		focus_testcases = "H",
		focus_result = "L",
	},

	-- Theme integration with TeVim's Yoru theme
	theme = {
	-- Use default theme, TeVim's theme system will handle colors
	},

	-- Image support (disabled for better compatibility)
	image_support = false,
}
