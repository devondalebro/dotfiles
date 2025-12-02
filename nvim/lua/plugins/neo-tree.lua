return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Requires a Nerd Font installed
      "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true, -- Close Neo-tree if it is the last window left
            filesystem = {
                filtered_items = {
                    visible = true, -- Make hidden files (dotfiles) visible
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })

        -- Keymap to toggle the explorer
        vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', {})
    end
}
