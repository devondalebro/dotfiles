return {
   "lewis6991/gitsigns.nvim",
   event = "VeryLazy",
   opts = {
      current_line_blame = true, -- Shows who committed the line next to your cursor
      current_line_blame_opts = {
         delay = 500,          -- Delay in ms before blame shows up
      },
   },
   keys = {
      { "<leader>gp", function() require("gitsigns").preview_hunk() end,          desc = "Preview Git Hunk" },
      { "<leader>gb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Full Git Blame" },
   }
}
