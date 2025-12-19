return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Needed for icons

  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto', -- Tries to match your colorscheme (e.g., Catppuccin)
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
      sections = {
        -- Defines what shows up on the left side: mode, filetype, git
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        -- Defines what shows up on the right side: line number, percentage
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
      }
    })
  end
}
