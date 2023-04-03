return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
      },
      prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
      },
    },
    config = function(_, opts)
      require("refactoring").setup(opts)
      require("telescope").load_extension("refactoring")
    end,
    keys = {
      {
        "<leader>cRF",
        function()
          require("telescope").extensions.refactoring.refactors()
        end,
        mode = { "v" },
        desc = "Refactor",
      },
      {
        "<leader>cRe",
        "<cmd>lua require('refactoring').refactor('Extract Function')<cR>]",
        mode = { "v" },
        desc = "Extract function",
      },
      {
        "<leader>cRf",
        "<cmd>lua require('refactoring').refactor('Extract Function To File')<cR>]",
        mode = { "v" },
        desc = "Extract function to file",
      },
      {
        "<leader>cRv",
        "<cmd>lua require('refactoring').refactor('Extract Variable')<cR>]",
        mode = { "v" },
        desc = "Extract variable",
      },
      {
        "<leader>cRi",
        "<cmd>lua require('refactoring').refactor('Inline Variable')<cR>]",
        mode = { "v" },
        desc = "Inline variable",
      },
      { "<leader>cRp", "<cmd>lua require('refactoring').debug.printf({})<cR>", mode = { "v" }, desc = "Debug print" },
      {
        "<leader>cRc",
        "<cmd>lua require('refactoring').debug.cleanup({})<cR>",
        mode = { "v" },
        desc = "Debug cleanup",
      },
      {
        "<leader>cRv",
        "<cmd>lua require('refactoring').debug.print_var({})<cR>",
        mode = { "v" },
        desc = "Debug print variable",
      },

      { "<leader>cRi", "<cmd>lua require('refactoring').refactor('Inline Variable')<cR>]", desc = "Inline variable" },
      { "<leader>cRb", "<cmd>lua require('refactoring').refactor('Extract Block')<cR>]", desc = "Extract Block" },
      {
        "<leader>cRf",
        "<cmd>lua require('refactoring').refactor('Extract Block To File')<cR>]",
        desc = "Extract Block To File",
      },
      { "<leader>cRp", "<cmd>lua require('refactoring').debug.printf({below = false})<cR>", desc = "Debug print" },
      {
        "<leader>cRv",
        "<cmd>lua require('refactoring').debug.print_var({normal = true})<cR>",
        desc = "Debug print variable",
      },
      { "<leader>cRc", "<cmd>lua require('refactoring').debug.cleanup({})<cR>", desc = "Debug cleanup" },
    },
  },
}
