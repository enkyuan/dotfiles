local is_available = require("cmd.core.utils").is_available
local M = {}

local modes = {
	["n"] = { "NORMAL", "TeSTTNormalMode" },
	["niI"] = { "NORMAL i", "TeSTTNormalMode" },
	["niR"] = { "NORMAL r", "TeSTTNormalMode" },
	["niV"] = { "NORMAL v", "TeSTTNormalMode" },
	["no"] = { "N-PENDING", "TeSTTNormalMode" },
	["i"] = { "INSERT", "TeSTTInsertMode" },
	["ic"] = { "INSERT (completion)", "TeSTTInsertMode" },
	["ix"] = { "INSERT completion", "TeSTTInsertMode" },
	["t"] = { "TERMINAL", "TeSTTTerminalMode" },
	["nt"] = { "NTERMINAL", "TeSTTNTerminalMode" },
	["v"] = { "VISUAL", "TeSTTVisualMode" },
	["V"] = { "V-LINE", "TeSTTVisualMode" },
	["Vs"] = { "V-LINE (Ctrl O)", "TeSTTVisualMode" },
	[""] = { "V-BLOCK", "TeSTTVisualMode" },
	["R"] = { "REPLACE", "TeSTTReplaceMode" },
	["Rv"] = { "V-REPLACE", "TeSTTReplaceMode" },
	["s"] = { "SELECT", "TeSTTSelectMode" },
	["S"] = { "S-LINE", "TeSTTSelectMode" },
	[""] = { "S-BLOCK", "TeSTTSelectMode" },
	["c"] = { "COMMAND", "TeSTTCommandMode" },
	["cv"] = { "COMMAND", "TeSTTCommandMode" },
	["ce"] = { "COMMAND", "TeSTTCommandMode" },
	["r"] = { "PROMPT", "TeSTTConfirmMode" },
	["rm"] = { "MORE", "TeSTTConfirmMode" },
	["r?"] = { "CONFIRM", "TeSTTConfirmMode" },
	["!"] = { "SHELL", "TeSTTTerminalMode" },
}
local icon = {
	["n"] = { " ", "TeSTTNormalModeIcon" },
	["niI"] = { " ", "TeSTTNormalModeIcon" },
	["niR"] = { " ", "TeSTTNormalModeIcon" },
	["niV"] = { " ", "TeSTTNormalModeIcon" },
	["no"] = { " ", "TeSTTNormalModeIcon" },
	["i"] = { " ", "TeSTTInsertModeIcon" },
	["ic"] = { " ", "TeSTTInsertModeIcon" },
	["ix"] = { " ", "TeSTTInsertModeIcon" },
	["t"] = { " ", "TeSTTTerminalModeIcon" },
	["nt"] = { " ", "TeSTTNTerminalModeIcon" },
	["v"] = { " ", "TeSTTVisualModeIcon" },
	["V"] = { " ", "TeSTTVisualModeIcon" },
	["Vs"] = { " ", "TeSTTVisualModeIcon" },
	[""] = { " ", "TeSTTVisualModeIcon" },
	["R"] = { " ", "TeSTTReplaceModeIcon" },
	["Rv"] = { " ", "TeSTTReplaceModeIcon" },
	["s"] = { " ", "TeSTTSelectModeIcon" },
	["S"] = { " ", "TeSTTSelectModeIcon" },
	[""] = { " ", "TeSTTSelectModeIcon" },
	["c"] = { " ", "TeSTTCommandModeIcon" },
	["cv"] = { " ", "TeSTTCommandModeIcon" },
	["ce"] = { " ", "TeSTTCommandModeIcon" },
	["r"] = { " ", "TeSTTConfirmModeIcon" },
	["rm"] = { " ", "TeSTTConfirmModeIcon" },
	["r?"] = { " ", "TeSTTConfirmModeIcon" },
	["!"] = { " ", "TeSTTTerminalModeIcon" },
}
local mode = function()
	local mode = vim.api.nvim_get_mode().mode
	return "%#"
		.. icon[mode][2]
		.. "#"
		.. icon[mode][1]
		.. " "
		.. "%#"
		.. modes[mode][2]
		.. "#"
		.. " "
		.. modes[mode][1]
		.. " "
end

local filename = function()
	---@diagnostic disable-next-line: redefined-local
	local icon = " 󰢚 "
	local filename = (vim.fn.expand("%") == "" and "Empty ") or vim.fn.expand("%:t")
	if filename ~= "Empty " then
		local devicons = require("nvim-web-devicons")
		local ft_icon = devicons.get_icon(filename)
		icon = (ft_icon ~= nil and " " .. ft_icon) or ""
		if string.find(filename, "filesystem") then
			filename = "File Explorer"
			return "%#TeSTTFileIcon#" .. " 󰝰 " .. "%#TeSTTFileName#" .. " " .. filename .. " "
		end
		if string.find(filename, "toggleterm") then
			filename = "Terminal"
			return "%#TeSTTFileIcon#" .. "  " .. "%#TeSTTFileName#" .. " " .. filename .. " "
		end
		return "%#TeSTTFileIcon#"
			.. icon
			.. " "
			.. "%#TeSTTFolder#"
			.. " "
			.. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			.. "/"
			.. "%#TeSTTFileName#"
			.. filename
			.. " "
	else
		return "%#TeSTTFileIcon#" .. icon .. "%#TeSTTFileName# GTFO "
	end
end

local branch = function()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return "%#TeSTTBranchIcon#" .. " 󱓌 "
	end

	local git_status = vim.b.gitsigns_status_dict
	local branch_name = git_status.head .. " "

	return "%#TeSTTBranchIcon#" .. "  " .. "%#TeSTTBranchName#" .. " " .. branch_name
end

local diff = function()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ""
	end

	local git_status = vim.b.gitsigns_status_dict

	local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
	local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
	local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
	if (#added > 0) or (#changed > 0) or (#removed > 0) then
		return "%#TeSTTDiffAdd#"
			.. added
			.. "%#TeSTTDiffChange#"
			.. changed
			.. "%#TeSTTDiffRemove#"
			.. removed
			.. " "
			.. "%#TeSTTGithub#"
			.. " 󰊤 "
	else
		return ""
	end
end

local diagnostics = function()
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	ERROR = (errors and errors > 0) and ("%#TeSTTErrorIcon#" .. "  " .. "%#TeSTTError#" .. errors) or ""
	WARNING = (warnings and warnings > 0) and ("%#TeSTTWarningIcon#" .. "  " .. "%#TeSTTWarning#" .. warnings) or ""
	HINT = (hints and hints > 0) and ("%#TeSTTHintsIcon#" .. " 󰌶 " .. "%#TeSTTHints#" .. hints) or ""
	INFO = (info and info > 0) and ("%#TeSTTInfoIcon#" .. "  " .. "%#TeSTTInfo#" .. info) or ""
	if vim.o.columns < 120 then
		return ERROR .. WARNING .. HINT .. INFO .. " "
	end
	return "%#TeSTTLspIcon#" .. " 󰒋 " .. ERROR .. WARNING .. HINT .. INFO
end

local lsp = function()
	-- Get clients for the current buffer specifically
	local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
	if not buf_clients or #buf_clients == 0 then
		return ""
	end
	
	local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
	
	-- Get active client names for current buffer
	local buf_client_names = {}
	for _, client in pairs(buf_clients) do
		-- Check if client supports this filetype
		if client.config.filetypes and vim.tbl_contains(client.config.filetypes, buf_ft) then
			table.insert(buf_client_names, client.name)
		elseif not client.config.filetypes then
			-- If no filetypes specified, assume it supports current filetype
			table.insert(buf_client_names, client.name)
		end
	end

	-- Add formatters if conform is available
	local conform_ok, conform = pcall(require, "conform")
	if conform_ok then
		local formatters = conform.list_formatters(0)
		for _, formatter in pairs(formatters) do
			table.insert(buf_client_names, formatter.name)
		end
	end

	-- Remove duplicates and return formatted string
	buf_client_names = vim.fn.uniq(buf_client_names)
	if #buf_client_names == 0 then
		return ""
	end
	
	-- RETURN CLIENTS
	if #buf_client_names > 3 then
		return "%#TeSTTLsp#" ..
			" " .. buf_client_names[1] .. ", " .. buf_client_names[2] .. ", " .. buf_client_names[3] .. " "
	end
	return "%#TeSTTLsp#" .. " " .. table.concat(buf_client_names, ", ") .. " "
end

local copilot = function()
	if not is_available("copilot.vim") and not is_available("copilot.lua") then
		return ""
	end
	for _, client in pairs(vim.lsp.get_clients()) do
		if client.name == "GitHub Copilot" then
			return "%#TeSTTCopilot#" .. "  "
		end
	end
	return "%#TeSTTCopilot#" .. "   "
end

local codeium = function()
	if is_available("codeium.nvim") then
		return "%#TeSTTCodeium#" .. "  "
	end
	return ""
end

local tabnine = function()
	if not is_available("tabnine-nvim") then
		return ""
	end
	local tabnine = require("tabnine.status").status()
	if tabnine == "⌬ tabnine starter" then
		return "%#TeSTTTabnine#" .. "⌬ "
	end
	return ""
end

local tab = function()
	return "%#TeSTTTabIcon#" .. "  " .. "%#TeSTTTab#" .. " " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
end

local location = function()
	return "%#TeSTTLocationIcon#"
		.. "  "
		.. "%#TeSTTLocation#"
		.. string.format(" %3d:%-2d ", vim.fn.line("."), vim.fn.virtcol("."))
end

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "  ", " 󰪞 ", " 󰪟 ", " 󰪠 ", " 󰪢 ", " 󰪣 ", " 󰪤 ", " 󰪥 " }
	local progress_percent = current_line / total_lines
	local index = math.ceil(progress_percent * #chars)
	if current_line == 1 then
		return "%#TeSTTProgressIcon#" .. chars[index] .. "%#TeSTTProgress#" .. " Top "
	elseif current_line == total_lines then
		return "%#TeSTTProgressIcon#" .. chars[index] .. "%#TeSTTProgress#" .. " Bot "
	else
		return "%#TeSTTProgressIcon#"
			.. chars[index]
			.. "%#TeSTTProgress#"
			.. string.format(" %2d%%%% ", math.floor(current_line / total_lines * 100))
	end
end

local countBuffer = function()
	local counter = 0
	for _, buf in pairs(vim.api.nvim_list_bufs()) do
		local filenames = vim.api.nvim_buf_get_name(buf):match("^.+/(.+)$") or ""
		if
			vim.api.nvim_buf_is_valid(buf)
			and vim.api.nvim_buf_is_loaded(buf)
			and vim.bo[buf].buflisted
			and filenames ~= ""
		then
			counter = counter + 1
		end
	end
	return counter
end

local nothing = function()
	if vim.o.columns < 120 or countBuffer() < 2 then
		return "%#TeSTTNothing2#" .. "    "
	end
	return "%#TeSTTNothing#" .. "    "
end

M.run = function()
	if vim.o.columns < 120 then
		return table.concat({
			nothing(),
			"%=",
			mode(),
			nothing(),
			diagnostics(),
		})
	end
	return table.concat({
		mode(),
		nothing(),
		filename(),
		nothing(),
		branch(),
		nothing(),
		diff(),
		nothing(),
		"%=",
		diagnostics(),
		lsp(),
		copilot(),
		codeium(),
		tabnine(),
		nothing(),
		tab(),
		nothing(),
		progress(),
		nothing(),
		location(),
	})
end

M.setup = function()
	vim.opt.laststatus = 3
	vim.opt.statusline = M.run()
	vim.api.nvim_create_autocmd({ "ModeChanged", "CursorHold", "VimResized" }, {
		callback = function()
			vim.opt.statusline = M.run()
		end,
	})
end

return M
