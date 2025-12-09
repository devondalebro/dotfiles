return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        latex = {
            enabled = true,
            converter = 'latex2text', -- specific rendering engine
            highlight = 'RenderMarkdownMath',
            top_pad = 0,
            bottom_pad = 0,
        },
    },
    config = function(_, opts)
        require('render-markdown').setup(opts)
    end,
}
