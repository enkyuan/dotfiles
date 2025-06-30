-- NOTE: Author : Nguyen Thanh Son - SownteeNguyen
-- NOTE: Github : @sownteedev

------------------------------- WELCOME TO GTFO -------------------------------
-- WARNING: THIS IS A PERSONAL CONFIGURATION NOT A DISTRO, YOU CAN USE DEFAULT CONFIGURATION OR CUSTOMIZE IT

require("cmd.core.options")
require("cmd.core.keymaps")
require("cmd.core.autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.cmd("CreateCustom")
	vim.cmd("redraw")
	vim.api.nvim_echo({ { "Hi there, welcome to GTFO 󱠡 ", "Bold" } }, true, {})
	require("cmd.themes").load()
	local repo = "https://github.com/folke/lazy.nvim.git"
	local output = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath })
	assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
	vim.opt.rtp:prepend(lazypath)
	require("cmd.plugins")
	vim.cmd("CheckMason")
	vim.cmd("redraw")
	vim.api.nvim_echo({ { "Wait for everything install. Reopen Neovim then ENJOY!", "Bold" } }, true, {})
end
vim.opt.rtp:prepend(lazypath)
require("cmd.plugins")
