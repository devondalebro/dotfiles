-- Allow Alt+Backspace to delete the previous word
-- 'i' = Insert Mode (Writing text)
-- 'c' = Command Mode (Typing :commands)
vim.keymap.set('i', '<M-BS>', '<C-w>', { desc = 'Delete previous word' })
vim.keymap.set('c', '<M-BS>', '<C-w>', { desc = 'Delete previous word' })
