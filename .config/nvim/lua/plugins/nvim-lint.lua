-- NVIM Linter Plugin

return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		local keymap = vim.keymap
		local vapi = vim.api

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			lua = { "selene" },
			bash = { "shellcheck" },
			sh = { "shellcheck" },
			zsh = { "shellcheck" },
		}

		-- AutoCmd for automatic linting (on events)
		local lint_augroup = vapi.nvim_create_augroup("lint", { clear = true })

		vapi.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- Keymap for manual linting
		keymap.set("n", "<leader>fl", function()
			lint.try_lint()
		end, { desc = "[F]ile [L]inting" }) -- Trigger linting for current file
	end,
}
