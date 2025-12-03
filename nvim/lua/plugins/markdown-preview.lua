return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        
        -- FIXED: Use AppleScript to force a generic "New Window" event
        vim.cmd([[
            function! OpenInNewWindow(url)
                " 1. Build the AppleScript command
                "    - Tell Chrome to make a new window
                "    - Set that window's URL to our preview
                "    - Activate (Focus) it
                let cmd = "osascript -e 'tell application \"Google Chrome\"'"
                let cmd .= " -e 'make new window'"
                let cmd .= " -e 'set URL of active tab of front window to \"" . a:url . "\"'"
                let cmd .= " -e 'activate'"
                let cmd .= " -e 'end tell'"
                
                " 2. Execute it silently
                call system(cmd)
            endfunction
        ]])

        vim.g.mkdp_browserfunc = 'OpenInNewWindow'
    end,
    ft = { "markdown" },
    keys = {
        { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
}
