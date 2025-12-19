-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.options")
require("config.keymaps")

require("config.lazy")

-- Load Arista specific syntax highlighting for .tac, .tin, etc.
if vim.fn.filereadable('/usr/share/vim/vimfiles/arista.vim') == 1 then
    vim.cmd([[source /usr/share/vim/vimfiles/arista.vim]])
end
