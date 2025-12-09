return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        -- --> 1. NEW: Add these two plugins for LaTeX power
        'rafamadriz/friendly-snippets', -- Massive collection of pre-made snippets
        'kdheepak/cmp-latex-symbols',   -- Emoji/Symbol completion (e.g., \alpha)
    },

    config = function()
        -- 1. Setup Mason
        require("mason").setup()
        
        -- 2. Setup Mason-LSPConfig
        require("mason-lspconfig").setup({
            -- --> 2. NEW: Add "texlab" to this list
            ensure_installed = { "lua_ls", "pyright", "html", "markdown_oxide", "texlab" },
            automatic_installation = true, 
        })

        -- 3. Define Capabilities
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- 4. Global Server Config
        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        -- 5. Specific Server Overrides
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } }
                }
            }
        })

        -- --> 3. NEW: Force texlab to attach to markdown files
        vim.lsp.config('texlab', {
            filetypes = { "tex", "bib", "markdown" }, -- The magic line
            settings = {
                texlab = {
                    -- Optional: Disable texlab's linting if it gets annoying in markdown
                    diagnostics = { ignoredPatterns = { "^chktex$" } }
                }
            }
        })

        -- 6. Autocomplete (CMP)
        local cmp = require('cmp')
        
        -- --> 4. NEW: Load the friendly-snippets library
        require("luasnip.loaders.from_vscode").lazy_load()

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
                -- --> 5. NEW: Add the latex symbol source
                { name = 'latex_symbols', option = { strategy = 0 } }, 
            })
        })

        -- 7. Keybindings
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
