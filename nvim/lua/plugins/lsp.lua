return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
    },

    config = function()
        -- 1. Setup Mason (The Installer)
        require("mason").setup()
        
        -- 2. Setup Mason-LSPConfig
        -- In 2.0, this handles the "auto-enabling" of servers effectively
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright", "html" , "markdown_oxide" },
            automatic_installation = true, 
        })

        -- 3. Define Capabilities (for Autocomplete)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- 4. The NEW Way: Configure Servers globally (Neovim 0.11+)
        -- The '*' key applies this config to ALL servers, including those Mason installs
        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        -- 5. Specific Server Overrides (e.g., Lua)
        -- Instead of a handler, you just configure the specific server directly
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } }
                }
            }
        })

        -- 6. Autocomplete (CMP) - Same as before
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            })
        })

        -- 7. Keybindings (LspAttach) - Same as before
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
