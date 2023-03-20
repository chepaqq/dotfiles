return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    config = function(_, opts)
      require("refactoring").setup(opts)
      require("telescope").load_extension("refactoring")
    end,
    keys = {
      {
        "<leader>crF",
        function()
          require("telescope").extensions.refactoring.refactors()
        end,
        mode = { "v" },
        desc = "Refactor",
      },
      {
        "<leader>cre",
        "<cmd>lua require('refactoring').refactor('Extract Function')<cr>]",
        mode = { "v" },
        desc = "Extract function",
      },
      {
        "<leader>crf",
        "<cmd>lua require('refactoring').refactor('Extract Function To File')<cr>]",
        mode = { "v" },
        desc = "Extract function to file",
      },
      {
        "<leader>crv",
        "<cmd>lua require('refactoring').refactor('Extract Variable')<cr>]",
        mode = { "v" },
        desc = "Extract variable",
      },
      {
        "<leader>cri",
        "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>]",
        mode = { "v" },
        desc = "Inline variable",
      },
      { "<leader>crp", "<cmd>lua require('refactoring').debug.printf({})<CR>", mode = { "v" }, desc = "Debug print" },
      {
        "<leader>crc",
        "<cmd>lua require('refactoring').debug.cleanup({})<CR>",
        mode = { "v" },
        desc = "Debug cleanup",
      },
      {
        "<leader>crv",
        "<cmd>lua require('refactoring').debug.print_var({})<CR>",
        mode = { "v" },
        desc = "Debug print variable",
      },

      { "<leader>cri", "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>]", desc = "Inline variable" },
      { "<leader>crb", "<cmd>lua require('refactoring').refactor('Extract Block')<cr>]", desc = "Extract Block" },
      {
        "<leader>crbf",
        "<cmd>lua require('refactoring').refactor('Extract Block To File')<cr>]",
        desc = "Extract Block To File",
      },
      { "<leader>crp", "<cmd>lua require('refactoring').debug.printf({below = false})<cr>", desc = "Debug print" },
      {
        "<leader>crv",
        "<cmd>lua require('refactoring').debug.print_var({normal = true})<CR>",
        desc = "Debug print variable",
      },
      { "<leader>crc", "<cmd>lua require('refactoring').debug.cleanup({})<CR>", desc = "Debug cleanup" },
    },
  },
}
