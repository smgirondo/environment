-- NVIM-Tree File Explorer / Manager Plugin

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

		-- Plugin Setup
		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
		})

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>fet", "<cmd>NvimTreeToggle<CR>", { desc = "[F]ile [E]xplorer [T]oggle" }) -- toggle file explorer
		keymap.set("n", "<leader>fef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "[F]ile [E]xplorer [F]ind" }) -- toggle file explorer finder
		keymap.set("n", "<leader>fec", "<cmd>NvimTreeCollapse<CR>", { desc = "[F]ile [E]xplorer [C]ollapse" }) -- collapse file explorer
		keymap.set("n", "<leader>fer", "<cmd>NvimTreeRefresh<CR>", { desc = "[F]ile [E]xplorer [R]efresh" }) -- refresh file explorer
	end,
}
