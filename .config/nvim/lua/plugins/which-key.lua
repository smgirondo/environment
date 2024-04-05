-- NVIM Key Maps PopUp Plugin

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		local vopt = vim.o
		vopt.timeout = true
		vopt.timeoutlen = 250

		-- default labels
		local wk = require("which-key")

		wk.register({
			["g"] = { name = "[G]o|[C]omment", _ = "which_key_ignore" },
			["<leader>"] = { name = "[Leader]", _ = "which_key_ignore" },
			["<leader>b"] = { name = "[B]uffer(s)", _ = "which_key_ignore" },
			["<leader>c"] = { name = "[C]ommand(s)", _ = "which_key_ignore" },
			["<leader>f"] = { name = "[F]ile", _ = "which_key_ignore" },
			["<leader>fe"] = { name = "[F]ile [E]xplorer", _ = "which_key_ignore" },
			["<leader>fh"] = { name = "[F]ile [H]arpoon", _ = "which_key_ignore" },
			["<leader>h"] = { name = "[H]elp|[H]ighlight", _ = "which_key_ignore" },
			["<leader>hl"] = { name = "[H]igh[L]ight", _ = "which_key_ignore" },
			["<leader>k"] = { name = "[K]eymap(s)", _ = "which_key_ignore" },
			["<leader>o"] = { name = "[O]ption(s)", _ = "which_key_ignore" },
			["<leader>t"] = { name = "[T]ab(s)", _ = "which_key_ignore" },
			["<leader>w"] = { name = "[W]indow(s)", _ = "which_key_ignore" },
		}, { prefix = "" })
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
