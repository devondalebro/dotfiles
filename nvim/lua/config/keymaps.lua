-- Allow Alt+Backspace to delete the previous word
-- 'i' = Insert Mode (Writing text)
-- 'c' = Command Mode (Typing :commands)
vim.keymap.set('i', '<M-BS>', '<C-w>', { desc = 'Delete previous word' })
vim.keymap.set('c', '<M-BS>', '<C-w>', { desc = 'Delete previous word' })
-- "gl" stands for "Go Look"
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
-- Open a side-by-side diff of the current file
vim.keymap.set("n", "<leader>gd", function() require("gitsigns").diffthis() end)
