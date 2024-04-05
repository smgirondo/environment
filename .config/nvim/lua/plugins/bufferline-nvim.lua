-- NVIM Buffer Manager Plugin

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    -- Require Term Colors
    vim.opt.termguicolors = true

    -- Plugin Setup
    require("bufferline").setup{
      options = {
        mode = "buffers",
        --mode = "tabs",
      },
    }
  end,
}
