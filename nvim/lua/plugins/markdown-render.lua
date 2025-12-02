return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('render-markdown').setup({
            -- This makes it look like a rich text editor
            -- It hides the # and replaces them with icons/colors
        })
    end,
}
