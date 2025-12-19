return {
   "gabrielpoca/replacer.nvim",  -- Corrected username here
   keys = {
      {
         "<leader>qr",
         function() require("replacer").run() end,
         desc = "Make Quickfix Editable (Replacer)",
      },
   },
}
