return {
    "dkarter/bullets.vim",
    lazy = false,
    ft = { "markdown", "text", "gitcommit", "scratch" },
    config = function()
        -- Optional: Disable default key mappings if they conflict with your other keys
        -- vim.g.bullets_set_mappings = 0 
        
        -- Ensure it works for nested lists
        vim.g.bullets_enabled_file_types = {
            'markdown',
            'text',
            'gitcommit',
            'scratch'
        }
    end
}
