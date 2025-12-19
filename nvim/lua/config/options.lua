-- This is where the magic happens
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.mouse = 'a'           -- Enable mouse mode

vim.opt.tabstop = 8
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.expandtab = true

vim.opt.scrolloff = 4

vim.opt.ignorecase = true    -- Search case-insensitively
vim.opt.smartcase = true     -- ...unless you type a Capital letter

vim.opt.termguicolors = true -- Better colors

vim.opt.colorcolumn = "85"


-- Treat Arista .tin/.itin files as C++ so clangd can read them
vim.filetype.add({
   extension = {
      tin = 'cpp',
      itin = 'cpp',
      tac = 'tac'
   }
})

-- Arista Specific Configuration
-- Source the system-wide vim settings if they exist
if vim.fn.filereadable('/usr/share/vim/vimfiles/arista.vim') == 1 then
   vim.cmd([[source /usr/share/vim/vimfiles/arista.vim]])
end
