-- NVIM Finder, Preview and Sorter Plugin

return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.6',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" },
  },
  config = function()
    local telescope = require('telescope')
    local builtin   = require('telescope.builtin')
    local keymap    = vim.keymap

    -- Plugin Setup
    telescope.setup()

    -- This will load fzf_native and have it override the default file sorter
    telescope.load_extension('fzf')

    -- Keymaps
    keymap.set('n', '<leader>bf', builtin.buffers, { desc = "[B]uffer [F]ind"})
    keymap.set('n', '<leader>cf', builtin.commands, { desc = "[C]ommand [F]ind"})
    keymap.set('n', '<leader>cfh', builtin.command_history, { desc = "[C]ommand [F]ind [H]istory"})
    keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ile [F]ind"})
    keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "[F]ile [G]rep"})
    keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "[F]ile [O]ld"})
    keymap.set('n', '<leader>hf', builtin.help_tags, { desc = "[H]elp [F]ind"})
    keymap.set('n', '<leader>kf', builtin.keymaps, { desc = "[K]eymap [F]ind"})
    keymap.set('n', '<leader>of', builtin.vim_options, { desc = "[O]ption [F]ind"})
  end,
}
