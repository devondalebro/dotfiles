-- lua/plugins/catppuccin.lua
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Load this before everything else
    config = function()
        -- This function runs after the plugin is installed
        vim.cmd.colorscheme "catppuccin"
    end
}
