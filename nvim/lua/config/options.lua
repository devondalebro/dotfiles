-- This is where the magic happens
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.mouse = 'a'           -- Enable mouse mode

vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 8

vim.opt.ignorecase = true    -- Search case-insensitively
vim.opt.smartcase = true     -- ...unless you type a Capital letter

vim.opt.termguicolors = true -- Better colors

vim.opt.colorcolumn = "85"

-- Set a vertical line at the 80th character
vim.opt.colorcolumn = "80"
vim.opt.wrap = true
vim.opt.linebreak = true -- Break at words rather than random characters

vim.opt.clipboard = "unnamedplus"
