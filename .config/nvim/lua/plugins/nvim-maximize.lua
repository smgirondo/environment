-- NVIM Window / Split Maximizer Plugin

return {
	"declancm/maximize.nvim",
	config = function()
		local maximize = require("maximize")
		local keymap = vim.keymap

		-- Plugin Setup
		-- Disable default keymaps
		maximize.setup({ default_keymaps = false })

		-- Keymap
		keymap.set("n", "<Leader>wz", "<Cmd>lua require('maximize').toggle()<CR>", { desc = "[W]indow [Z]oom Toggle" })
	end,
}
