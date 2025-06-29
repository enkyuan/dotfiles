local M = {}

-- Enhanced clipboard setup for macOS
M.setup = function()
	-- Ensure clipboard is properly set
	if vim.fn.has('mac') == 1 then
		-- macOS specific clipboard setup
		vim.g.clipboard = {
			name = 'macOS-clipboard',
			copy = {
				['+'] = 'pbcopy',
				['*'] = 'pbcopy',
			},
			paste = {
				['+'] = 'pbpaste',
				['*'] = 'pbpaste',
			},
			cache_enabled = 1,
		}
	elseif vim.fn.has('unix') == 1 then
		-- Linux/Unix clipboard with xclip/xsel
		if vim.fn.executable('xclip') == 1 then
			vim.g.clipboard = {
				name = 'xclip',
				copy = {
					['+'] = 'xclip -selection clipboard',
					['*'] = 'xclip -selection primary',
				},
				paste = {
					['+'] = 'xclip -selection clipboard -o',
					['*'] = 'xclip -selection primary -o',
				},
				cache_enabled = 1,
			}
		elseif vim.fn.executable('xsel') == 1 then
			vim.g.clipboard = {
				name = 'xsel',
				copy = {
					['+'] = 'xsel --clipboard --input',
					['*'] = 'xsel --primary --input',
				},
				paste = {
					['+'] = 'xsel --clipboard --output',
					['*'] = 'xsel --primary --output',
				},
				cache_enabled = 1,
			}
		end
	end

	-- Additional clipboard settings
	vim.opt.clipboard:append('unnamedplus')
	
	-- Create clipboard sync command
	vim.api.nvim_create_user_command('ClipboardTest', function()
		vim.fn.setreg('+', 'Clipboard test - this should appear in your system clipboard!')
		print('Clipboard test: copied text to system clipboard. Try pasting elsewhere!')
	end, { desc = 'Test system clipboard functionality' })
end

return M 