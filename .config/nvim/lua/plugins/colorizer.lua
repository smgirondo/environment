-- NVIM ViewPort Colorizer Plugin

return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    local colorizer = require('colorizer')
    local opt       = vim.opt

    -- Require Term Colors
   opt.termguicolors = true

    -- Plugin Setup
    colorizer.setup({
      '*',
    })
  end,
}
