-- Lazy Plugin Manager
--
-- Check requirements: NeoVIM v0.8, GIT v2.19
-- Check recommendations: Nerd Font (should be installedd and enabled on terminal)
--

-- Lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Add Lazy to Runtime Path
vim.opt.rtp:prepend(lazypath)

-- Load and Setup Lazy
-- Import plugins located in the plugins directory (*.lua)
-- no need to maintain ini.lua
require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp"}, })
