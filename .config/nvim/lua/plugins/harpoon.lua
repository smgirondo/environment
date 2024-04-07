-- NVIM Marker & Navigation Plugin

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	enabled = true,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		-- local telescope = require("telescope")
		local keymap = vim.keymap -- for conciseness

		-- REQUIRED
		harpoon:setup({})
		-- REQUIRE{}D

		-- Basic Telescope Configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		-- Set Keymaps
		-- Mark file with harpoon
		-- keymap.set("n", "<leader>fhm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "[F]ile [H]arpoon [M]ark" })
		-- Harpoon Next Mark
		-- keymap.set("n", "<leader>fhn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "[F]ile [H]arpoon [N]ext" })
		-- Harpoon Previous Mark
		-- keymap.set("n", "<leader>fhp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "[F]ile [H]arpoon [P]revious" })

		keymap.set("n", "<leader>fha", function()
			harpoon:list():add()
		end, { desc = "[F]ile [H]arpoon [A]dd Anchor" })
		-- keymap.set("n", "<C-e>", function()
		-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end)
		keymap.set("n", "<leader>fhw", function()
			toggle_telescope(harpoon:list())
		end, { desc = "[F]ile [H]arpoon [W]indow Open" })

		keymap.set("n", "<leader>fhs1", function()
			harpoon:list():select(1)
		end, { desc = "[F]ile [H]arpoon [S]elect [1]" })
		keymap.set("n", "<leader>fhs2", function()
			harpoon:list():select(2)
		end, { desc = "[F]ile [H]arpoon [S]elect [2]" })
		keymap.set("n", "<leader>fhs3", function()
			harpoon:list():select(3)
		end, { desc = "[F]ile [H]arpoon [S]elect [3]" })
		keymap.set("n", "<leader>fhs4", function()
			harpoon:list():select(4)
		end, { desc = "[F]ile [H]arpoon [S]elect [4]" })

		-- Toggle previous & next buffers stored within Harpoon list
		keymap.set("n", "<leader>fhbp", function()
			harpoon:list():prev()
		end, { desc = "[F]ile [H]arpoon [B]uffer [P]revious" })
		keymap.set("n", "<leader>fhbn", function()
			harpoon:list():next()
		end, { desc = "[F]ile [H]arpoon [B]uffer [N]ext" })
	end,
}
