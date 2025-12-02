return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    
    config = function()
        local builtin = require('telescope.builtin')
        
        -- Set Keybinds
        -- <leader>ff = Find Files
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        
        -- <leader>fg = Find Grep (search text inside all files)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        
        -- <leader>fb = Find Buffers (open tabs)
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    end
}
