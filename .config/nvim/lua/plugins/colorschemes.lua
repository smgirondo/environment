-- Colorscheme Plugins
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() -- load the colorscheme here
      vim.cmd("colorscheme tokyonight")
    end,
  },
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() -- load the colorscheme here
      --vim.cmd("colorscheme catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function() -- load the colorscheme here
      --vim.cmd("colorscheme kanagawa")
    end,
  },
}


