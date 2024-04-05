-- NVIM Marker & Navigation Plugin

return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<leader>fhm",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "[F]ile [H]arpoon [M]ark" } -- Mark file with harpoon
		)
		keymap.set(
			"n",
			"<leader>fhn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "[F]ile [H]arpoon [N]ext" } -- Harpoon Next Mark
		)
		keymap.set(
			"n",
			"<leader>fhp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "[F]ile [H]arpoon [P]revious" } -- Harpoon Previous Mark
		)
	end,
}
