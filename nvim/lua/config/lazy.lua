-- lua/config/lazy.lua

-- 1. Installation Logic
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Configuration & Plugin Loading
require("lazy").setup({
  spec = {
    -- Import any file inside lua/plugins/ directory!
    { import = "plugins" },
  },
  checker = { enabled = true }, -- Checks for updates automatically
})
