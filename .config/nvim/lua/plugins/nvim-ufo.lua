-- NVIM Universal FOlder Plugin

return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		local ufo = require("ufo")
		local keymap = vim.keymap
		local lsp = vim.lsp
		local vopts = vim.o

		-- Set Folding Options
		vopts.foldcolumn = "1" -- '0' is not bad
		vopts.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vopts.foldlevelstart = 99
		vopts.foldenable = true

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		-- keymap.set("n", "zR", require("ufo").openAllFolds)
		-- keymap.set("n", "zM", require("ufo").closeAllFolds)
		keymap.set("n", "zR", require("ufo").openAllFolds)
		keymap.set("n", "zM", require("ufo").closeAllFolds)
		keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
		keymap.set("n", "K", function()
			local winid = ufo.peekFoldedLinesUnderCursor()
			if not winid then
				-- choose one of coc.nvim and nvim lsp
				-- vim.fn.CocActionAsync('definitionHover') -- coc.nvim
				lsp.buf.hover()
			end
		end)

		-- Folding Text Customize
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		-- Option 3: treesitter as a main provider instead
		-- (Note: the `nvim-treesitter` plugin is *not* needed.)
		-- ufo uses the same query files for folding (queries/<lang>/folds.scm)
		-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
		ufo.setup({
			-- Set Handler function for Folding Text
			fold_virt_text_handler = handler,
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					jumpTop = "[",
					jumpBot = "]",
				},
			},
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
