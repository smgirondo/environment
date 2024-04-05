-- NVIM Command Line Plugins

return {
  {
    'MunifTanjim/nui.nvim',
  },
  {
    'VonHeikemen/fine-cmdline.nvim',
    enabled = false,
    requires = { {'MunifTanjim/nui.nvim'} },
    config = function()
      local finecmdline = require('fine-cmdline')
      local vapi         = vim.api

      finecmdline.setup({
        cmdline = {
          enable_keymaps = true,
          smart_history = true,
          prompt = ':> '
        },
        popup = {
          position = {
            row = '10%',
            col = '50%',
          },
          size = {
            width = '60%',
          },
          border = {
            style = 'rounded',
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
      })

      -- Keymaps
      vapi.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    end,
  },
}
