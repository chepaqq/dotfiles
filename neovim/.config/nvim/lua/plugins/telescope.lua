return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
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
  keys = {
    { "<leader>bl", "<Cmd>lua require('telescope.builtin').buffers()<CR>", desc = "List buffers" },
    { "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Find Files" },
    { "<leader>fr", "<cmd>Telescope old_files<cr>", desc = "Previously open files" },
    { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "Browser" },
    { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide" },
    { "<leader>hc", "<cmd>lua require('telescope.builtin').commands()<cr>", desc = "Commands" },
    { "<leader>hk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = "Keymaps" },
    { "<leader>ht", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help tags" },
    { "<leader>hm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", desc = "Man pages" },
    { "<leader>sb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "Buffer" },
    { "<leader>sw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Workspace" },
    { "<leader>ps", "<cmd>Telescope repo list<cr>", desc = "Search" },
    { "<leader>pp", "<cmd>Telescope project<cr>", desc = "List" },
    { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Files" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
    { "<leader>df", "<cmd>Telescope dap frames<cr>", desc = "Frames" },
    { "<leader>dT", "<cmd>Telescope dap list_breakpoints<cr>", desc = "List breakboints" },
    { "<leader>dv", "<cmd>Telescope dap variables<cr>", desc = "Variables" },
  },
  config = function()
    local telescope = require("telescope")
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
