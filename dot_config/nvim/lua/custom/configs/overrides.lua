local M = {}

-- add overrides in here(eg: mason.nvim)
M.mason = {
	ensure_installed = {
		-- Language Servers
		"typescript-language-server", -- JavaScript/TypeScript
		"html-lsp", -- HTML
		"css-lsp", -- CSS
		"json-lsp", -- JSON
		"pyright", -- Python
		"rust-analyzer", -- Rust
		"gopls", -- Go
		"clangd", -- C/C++
		"bash-language-server", -- Bash
		"yaml-language-server", -- YAML
		"docker-compose-language-service", -- Docker Compose
		"dockerfile-language-server", -- Dockerfile
		"svelte-language-server", -- Svelte
		
		-- Formatters
		"prettier", -- JS/TS/HTML/CSS/JSON/YAML formatter
		"black", -- Python formatter
		"stylua", -- Lua formatter
		"shfmt", -- Bash formatter
		
		-- Linters
		"eslint_d", -- JavaScript/TypeScript linter
		"flake8", -- Python linter
	}
}

return M