-- NVIM Treesitter Line Splatting Toggle Plugin

return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local treesj = require("treesj")
		local keymap = vim.keymap

		treesj.setup()

		-- For default preset
		keymap.set("n", "<leader>lst", treesj.toggle, { desc = "[L]ine [S]plat [T]oggle" })
		-- For extending default preset with `recursive = true`
		keymap.set("n", "<leader>lsT", function()
			treesj.toggle({ split = { recursive = true } })
		end, { desc = "[L]ine [S]plat [T]oggle Recursive" })
	end,
}
