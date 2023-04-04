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
  },
  config = function()
    local transform_mod = require("telescope.actions.mt").transform_mod
    local nvb_actions = transform_mod({
      -- VisiData
      visidata = function(prompt_bufnr)
        -- Get the full path
        local content = require("telescope.actions.state").get_selected_entry()
        local full_path = content.cwd .. require("plenary.path").path.sep .. content.value

        -- Close the Telescope window
        require("telescope.actions").close(prompt_bufnr)

        -- Open the file with VisiData
        local term = require("utils")
        term.open_term("vd " .. full_path, { direction = "float" })
      end,
    })

    local telescope = require("telescope")
    telescope.setup({
      pickers = {
        find_files = {
          theme = "ivy",
          mappings = {
            n = {
              ["s"] = nvb_actions.visidata,
            },
            i = {
              ["<C-s>"] = nvb_actions.visidata,
            },
          },
        },
        git_files = {
          theme = "dropdown",
          mappings = {
            n = {
              ["s"] = nvb_actions.visidata,
            },
            i = {
              ["<C-s>"] = nvb_actions.visidata,
            },
          },
        },
      },
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
