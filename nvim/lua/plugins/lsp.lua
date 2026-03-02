return {
    dependencies = {
        'williamboman/mason.nvim',
        'saghen/blink.cmp',
    },

    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        require("mason").setup()

        -- Global capabilities for all LSP configs (Neovim 0.11+)
        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        -- Lua
        vim.lsp.config('lua_ls', {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
            settings = {
                Lua = { diagnostics = { globals = { "vim" } } },
            },
        })

        -- Markdown
        vim.lsp.config('markdown_oxide', {
            cmd = { 'markdown_oxide' },
            filetypes = { 'markdown' },
            root_markers = { '.git' },
        })

        vim.lsp.enable('lua_ls')
        vim.lsp.enable('markdown_oxide')

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            end,
        })
    end
}
