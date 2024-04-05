-- NVIM-Web-DevIcons Collection Plugin

return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimwebdevicons = require("nvim-web-devicons")

    -- plugin setup
    nvimwebdevicons.setup() -- empty setup using defaults
  end,
}
