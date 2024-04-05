-- NVIM Comment Manager Plugin

return {
  'numToStr/Comment.nvim',
  opts = {},
  lazy = false,
  config = function()
    local comment = require('Comment')

    -- Plugin Setup
    comment.setup()
  end,
}

