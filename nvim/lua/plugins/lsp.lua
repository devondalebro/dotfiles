return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'saghen/blink.cmp',
    },

    config = function()
        -- 1. Setup Mason (The installer)
        require("mason").setup()
        
        -- 2. Define the Mason servers we want
        local mason_servers = { "lua_ls", "markdown_oxide" }

        -- 3. Ensure they are downloaded
        require("mason-lspconfig").setup({
            ensure_installed = mason_servers,
            automatic_installation = true,
        })

        -- 4. Get Capabilities (for Autocomplete)
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- =========================================================
        --  PART A: MASON SERVERS (Loop and Enable)
        --  Instead of using the broken 'setup_handlers', we just loop manually.
        -- =========================================================
        for _, server in ipairs(mason_servers) do
            vim.lsp.config[server] = { capabilities = capabilities }
            
            -- Special settings for Lua
            if server == "lua_ls" then
                vim.lsp.config.lua_ls = {
                    capabilities = capabilities,
                    settings = {
                        Lua = { diagnostics = { globals = { "vim" } } }
                    }
                }
            end

            -- Enable the server
            vim.lsp.enable(server)
        end

        -- =========================================================
        --  PART B: ARISTA SYSTEM SERVERS (Clangd, Jedi)
        --  These are installed via yum/pip, so we config them manually.
        -- =========================================================

        -- C++ / TIN / ITIN (clangd)
        vim.lsp.config.clangd = {
            capabilities = capabilities,
            cmd = { "clangd", "--background-index", "--clang-tidy" },
            filetypes = { "c", "cpp", "objc", "objcpp", "tin", "itin" },
            root_dir = vim.fs.root(0, { "compile_commands.json", ".git" }) or "/src",
            init_options = { compilationDatabasePath = "/src" },
        }
        vim.lsp.enable("clangd")

      -- PYTHON (Pyright)
vim.lsp.config.pyright = {
  capabilities = capabilities,
  -- Arista-specific root logic: looks for .git, otherwise defaults to /src
  root_dir = vim.fs.root(0, { ".git" }) or "/src",
  settings = {
    python = {
      analysis = {
        -- "basic" is recommended to avoid too much noise in large codebases
        typeCheckingMode = "basic", 
      }
    }
  }}
vim.lsp.enable("pyright")

        -- =========================================================
        --  PART C: CUSTOM ARISTA SERVERS (Tac)
        -- =========================================================
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            pattern = { "*.tac" },
            callback = function()
                vim.lsp.start({
                    name = "tacc",
                    cmd = { "/usr/bin/artaclsp" },
                    cmd_args = { "-I", "/bld/" },
                    root_dir = "/src",
                    capabilities = capabilities,
                })
            end,
        })

        -- =========================================================
        --  PART D: KEYBINDINGS
        -- =========================================================
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
