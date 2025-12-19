return {
   "mfussenegger/nvim-lint",
   event = { "BufReadPre", "BufNewFile" },  -- Load plugin only when opening a file
   config = function()
      local lint = require("lint")

      -- 1. Tell nvim-lint to use pylint for python files
      lint.linters_by_ft = {
         python = { "pylint" },
      }

      -- 2. Create an autocommand to trigger linting
      -- This runs the linter every time you save, open, or leave insert mode
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
         group = lint_augroup,
         callback = function()
            lint.try_lint()
         end,
      })
   end,
}
