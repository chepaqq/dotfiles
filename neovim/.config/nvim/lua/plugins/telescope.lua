return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.1",
  cmd = "Telescope",
  lazy = true,
  dependencies = {
    {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-project.nvim",
      "ahmedkhalf/project.nvim",
      "jvgrootveld/telescope-zoxide",
      "cljoly/telescope-repo.nvim",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-n>"] = require("telescope.actions").cycle_history_next,
            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("dap")
    telescope.load_extension("zoxide")
    telescope.load_extension("harpoon")
    telescope.load_extension("project")
    telescope.load_extension("repo")
  end,
}
