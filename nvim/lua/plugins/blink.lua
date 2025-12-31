return {
   'saghen/blink.cmp',

   -- Use a specific version or '*' for the latest release
   version = '*',

   -- REQUIRED: Blink needs 'friendly-snippets' to provide the actual snippet data
   dependencies = 'rafamadriz/friendly-snippets',

   opts = {
      -- 1. KEYMAPS
      -- 'default' preset sets up basic keys. We extend it below.
      keymap = {
         preset = 'default',

         -- Map Enter to accept the suggestion
         ['<CR>'] = { 'accept', 'fallback' },

         -- Map Tab/Shift+Tab to navigate the list
         ['<Tab>'] = { 'select_next', 'fallback' },
         ['<S-Tab>'] = { 'select_prev', 'fallback' },

         -- Scroll documentation up/down with Ctrl+b / Ctrl+f
         ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
         ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      },

      -- 2. APPEARANCE
      appearance = {
         -- Sets the fallback highlight groups to nvim-cmp's highlight groups
         -- Useful for themes like Catppuccin that support nvim-cmp
         use_nvim_cmp_as_default = true,

         -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
         nerd_font_variant = 'mono',
      },

      -- 3. SOURCES (Where completions come from)
      sources = {
         default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- 4. SIGNATURE HELP (The popup for function arguments)
      signature = { enabled = true },

      -- 5. WINDOWS (Documentation and menu borders)
      completion = {
         -- Menu border stays here
         menu = {
            -- Make auto_show a function instead of just 'true'
            auto_show = function(ctx)
               -- Don't show automatically in Markdown files
               if vim.bo.filetype == 'markdown' then
                  return false
               end
               -- Standard logic: don't show in cmdline, otherwise yes
               return ctx.mode ~= 'cmdline'
            end,
            border = 'single'
         },

         -- Documentation settings
         documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
            window = {
               border = 'single', -- MOVE 'border' INSIDE 'window'
            },
         },
      }
   },


   --
   -- This makes sure specific highlight groups are set for the icons
   opts_extend = { "sources.default" },
}
