return {
    "ojroques/nvim-osc52",
    config = function()
        local osc52 = require("osc52")
        
        -- Configure the plugin
        osc52.setup({
            max_length = 0,           -- Unlimited length
            silent = false,           -- Show message on success
            trim = false,             -- Don't trim whitespace
            tmux_passthrough = true,  -- VITAL: Fixes the Tmux issue
        })

        -- OPTION A: Automatic Sync (Recommended)
        -- This copies to system clipboard whenever you yank to the '+' register
        local function copy()
            if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
                osc52.copy_register("+")
            end
        end
        vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })

        -- OPTION B: Manual Keymaps (If you prefer explicit keys)
        vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, { expr = true })
        vim.keymap.set('n', '<leader>yy', '<leader>y_', { remap = true })
        vim.keymap.set('v', '<leader>y', require('osc52').copy_visual)
    end
}
