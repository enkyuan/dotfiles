local plugins = {
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"nvim-tree/nvim-web-devicons",
		event = "BufRead",
		opts = function()
			require("nvim-web-devicons").set_default_icon("󰈚")
			return require("cmd.plugins.configs.devicons")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = { { mode = { "n", "v" }, "<C-e>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" } },
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = function()
			return require("cmd.plugins.configs.neotree")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUninstall", "TSUpdate" },
		build = ":TSUpdate",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
			{
				"windwp/nvim-ts-autotag",
				ft = { "html", "javascript", "jsx", "typescript", "tsx", "svelte", "vue", "xml", "markdown" },
				opts = { enable_close_on_slash = false },
			},
		},
		opts = function()
			return require("cmd.plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"echasnovski/mini.indentscope",
				opts = { symbol = "│" },
			},
		},
		opts = function()
			return require("cmd.plugins.configs.blankline")
		end,
	},
	{
		"numToStr/Comment.nvim",
		keys = {
			{ mode = "n", "<C-/>", "<Plug>(comment_toggle_linewise_current)",      desc = "Toggle Comment" },
			{ mode = "i", "<C-/>", "<esc><Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment(Insert)" },
			{ mode = "v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)",       desc = "Toggle Comment(Visual)" },
		},
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		cmd = "TodoTelescope",
		opts = { signs = false },
	},
	{
		"nvim-telescope/telescope.nvim",
		commit = "a0bbec21",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("cmd.plugins.configs.telescope")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		ft = { "gitcommit", "diff" },
		init = function()
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
				callback = function()
					vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
						on_exit = function(_, return_code)
							if return_code == 0 then
								vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
								vim.schedule(function()
									require("lazy").load({ plugins = { "gitsigns.nvim" } })
								end)
							end
						end,
					})
				end,
				desc = "Load gitsigns only if git repository",
			})
		end,
		opts = function()
			return require("cmd.plugins.configs.gitsign")
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		opts = function()
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
			return require("colorizer").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = function()
			return require("cmd.plugins.configs.whichkey")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			{
				mode = { "n", "t", "v" },
				[[<C-`>]],
				"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
				{ desc = "Toggle Terminal" },
			},
		},
		version = "*",
		opts = {
			shading_factor = 0.2,
			highlights = { NormalFloat = { link = "NormalFloat" } },
			float_opts = { border = "none" },
		},
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { filetypes_denylist = { "neo-tree", "Trouble", "DressingSelect", "TelescopePrompt" } },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				ft_ignore = { "neo-tree", "Outline" },
				segments = {
					{ sign = { namespace = { "diagnostic*" } } },
					{ sign = { namespace = { "gitsign" } },    click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, "  " },       click = "v:lua.ScLa" },
					{ text = { builtin.foldfunc, "  " },       click = "v:lua.ScFa" },
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = "kevinhwang91/promise-async",
		init = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
		config = function()
			require("ufo").setup()
		end,
	},

	--------------------------------------------------------------
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("cmd.plugins.configs.luasnips").luasnip(opts)
				end,
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				opts = function()
					require("nvim-autopairs").setup({ fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } })
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
		},
		opts = function()
			return require("cmd.plugins.configs.cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
		dependencies = {
			-- {
			-- 	"nvimdev/lspsaga.nvim",
			-- 	opts = { 
			-- 		symbol_in_winbar = { enable = false }, -- Disable symbol_in_winbar to fix deprecation warnings
			-- 		lightbulb = { enable = false }, -- Disable lightbulb to reduce deprecation warnings
			-- 		outline = { enable = false }, -- Disable outline to fix client.request deprecation warnings
			-- 		beacon = { enable = false }, -- Disable beacon feature
			-- 		symbol = { enable = false }, -- Completely disable symbol feature to fix symbol/head.lua warnings
			-- 		ui = {
			-- 			-- Disable code action sign to avoid deprecation warnings
			-- 			code_action = false,
			-- 		},
			-- 		hover = {
			-- 			-- Disable max_width/height to avoid potential issues
			-- 			max_width = 0.6,
			-- 			max_height = 0.8,
			-- 		},
			-- 	},
			-- },
			{
				"williamboman/mason.nvim",
				cmd = { "Mason", "MasonInstall", "MasonUpdate" },
				opts = function()
					return require("cmd.plugins.configs.mason")
				end,
			},
			{
				"ray-x/lsp_signature.nvim",
				opts = { hint_enable = false },
			},
		},
		config = function()
			require("cmd.plugins.configs.lspconfig")
		end,
	},
	{
		"kawre/leetcode.nvim",
		cmd = "Leet",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = function()
			return require("cmd.plugins.configs.leetcode")
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		keys = {
			{ "<leader>tt", "<cmd>TransparentToggle<cr>", desc = "Toggle Transparency" },
		},
		opts = function()
			return require("cmd.plugins.configs.transparent")
		end,
		config = function(_, opts)
			require("transparent").setup(opts)
			-- Enable transparency by default
			require("transparent").toggle(true)
			require("transparent").clear_prefix("BufferLine")
			require("transparent").clear_prefix("NeoTree")
			require("transparent").clear_prefix("WhichKey")
			require("transparent").clear_prefix("Telescope")
			require("transparent").clear_prefix("Lazy")
			require("transparent").clear_prefix("Mason")
			require("transparent").clear_prefix("LeetCode")
			-- Note: TeBuf groups are handled individually in transparent.lua config, not with clear_prefix
			
			-- Force TeBufQuit to keep red background after transparency is applied
			local function set_quit_highlight()
				local colors = require("cmd.themes").getCurrentTheme()
				local utils = require("cmd.core.utils")
				vim.api.nvim_set_hl(0, "TeBufQuit", { 
					bg = colors.red, 
					fg = utils.blend(colors.foreground, colors.background, 0.08) 
				})
			end
			
			vim.schedule(set_quit_highlight)
			
			-- Ensure highlight is preserved on colorscheme changes
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = set_quit_highlight,
				desc = "Preserve TeBufQuit red background"
			})
		end,
	},
	{
		"ojroques/nvim-osc52",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- Enhanced clipboard for macOS and terminal environments
			local function copy(lines, _)
				require('osc52').copy(table.concat(lines, '\n'))
			end
			local function paste()
				return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
			end
			if vim.env.SSH_CONNECTION or vim.env.TMUX then
				vim.g.clipboard = {
					name = 'osc52',
					copy = {['+'] = copy, ['*'] = copy},
					paste = {['+'] = paste, ['*'] = paste},
				}
			end
		end,
	},
}

local check, _ = pcall(require, "custom")
if check then
	require("custom")
	local custom_plugins = require("custom.plugins")
	if #custom_plugins > 0 then
		for _, plugin in ipairs(custom_plugins) do
			table.insert(plugins, plugin)
		end
	end
else
	vim.cmd("TeVimCreateCustom")
end

require("lazy").setup(plugins, {
	defaults = { lazy = true },
	ui = {
		backdrop = 100,
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})
