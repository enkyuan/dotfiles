local M = {}

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.inlay_hints = true

M.on_attach = function(_, bufnr)
	if M.inlay_hints then
		vim.lsp.inlay_hint.enable(true)
	end
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = { border = "rounded" },
	}, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
M.capabilities.offsetEncoding = { "utf-16", "utf-8" }

vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	signs = { text = { [1] = "", [2] = "", [3] = "", [4] = "󰌶" } },
	float = {
		suffix = "",
		header = { "  Diagnostics", "String" },
		prefix = function(_, _, _)
			return "  ", "String"
		end,
	},
})
if vim.fn.has("nvim-0.9") == 1 then
	vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶", texthl = "DiagnosticSignHint" })
end

-- Lua Language Server
lspconfig.lua_ls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
})

-- TypeScript/JavaScript Language Server
lspconfig.ts_ls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- HTML Language Server
lspconfig.html.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- CSS Language Server
lspconfig.cssls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- JSON Language Server
lspconfig.jsonls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- Python Language Server
lspconfig.pyright.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- Rust Language Server
lspconfig.rust_analyzer.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- Go Language Server
lspconfig.gopls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- C/C++ Language Server
lspconfig.clangd.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- Bash Language Server
lspconfig.bashls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- YAML Language Server
lspconfig.yamlls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- Docker Language Servers
lspconfig.dockerls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

lspconfig.docker_compose_language_service.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

-- Svelte Language Server
lspconfig.svelte.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

return M
