-- NVIM LSP Plugin Manager
-- Reference: https://www.josean.com/posts/neovim-linting-and-formatting

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				-- "tailwindcss",
				-- "svelte",
				"lua_ls",
				-- "graphql",
				-- "emmet_ls",
				-- "prismals",
				-- "pyright",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"jq", -- json formatter
				"shfmt", -- shell formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
				"jsonlint", -- json linter
				"yamllint", -- yaml linter
				"selene", -- lua linter
				"shellcheck", -- shell linter
			},
		})
	end,
}
