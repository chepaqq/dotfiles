  return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local whichkey = require("which-key")
    local conf = {
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
      },
    }

    local normal_opts = {
      mode = "n", -- Normal mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false, -- use `nowait` when creating keymaps
    }

    local visual_opts = {
      mode = "v", -- Normal mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false, -- use `nowait` when creating keymaps
    }

    local normal_mappings = {
      ["s"] = { "<cmd>w<CR>", "Save" },
      ["q"] = { "<cmd>qa!<CR>", "Quit" },
      ["c"] = { "<cmd>nohl<CR>", "Clear highlighting" },
      ["R"] = { "<cmd>so %<CR>", "Reload config" },
      ["u"] = { "<cmd>UndotreeToggle<CR>", "UndoTree" },
      ["tk"] = { "<C-w>t<C-w>K", "Vertical to horizontal" },
      ["th"] = { "<C-w>t<C-w>h", "Horizontal to vertical" },

      b = {
        name = "Buffer",
        d = { "<Cmd>bd!<Cr>", "Close current buffer" },
        D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
        n = { "<Cmd>bnext<CR>", "Next buffer" },
        N = { "<Cmd>bprevious<CR>", "Previous buffer" },
        b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List buffers" },
      },

      D = {
        name = "Database",
        u = { "<Cmd>DBUIToggle<Cr>", "Toggle UI" },
        f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
        r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
        q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },
      },

      f = {
        name = "Find",
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
        h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
        m = { "<cmd>lua require('telescope.builtin').marks()<cr>", "Marks" },
        o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Old Files" },
        g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
        c = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Commands" },
        r = { "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", "File Browser" },
        z = { "<cmd>lua require'telescope'.extensions.zoxide.list()<cr>", "Zoxide" },
        w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
        t = { "<cmd>TodoTelescope<Cr>", "Todo" },
        e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
      },

      G = {
        name = "Git",
        s = { "<cmd>Neogit<CR>", "Status" },
        l = { "<cmd>lua require('plugins.term').git_client_toggle()<CR>", "Lazygit" },
        f = { "<cmd>lua require'telescope.builtin'.git_files()<CR>", "Git files" },
        c = { "<cmd>lua require'telescope.builtin'.git_commits()<CR>", "Commits" },
        b = { "<cmd>lua require'telescope.builtin'.git_brances()<CR>", "Commits" },
        d = { "<cmd>DiffviewOpen<cr>", "Diff View Open" },
        D = { "<cmd>DiffviewClose<cr>", "Diff View Close" },
      },

      j = {
        name = "Jump",
        a = { "<Cmd>lua require('harpoon.mark').add_file()<Cr>", "Add File" },
        m = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<Cr>", "UI Menu" },
        c = { "<Cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<Cr>", "Command Menu" },
      },
      ["1"] = { "<Cmd>lua require('harpoon.ui').nav_file(1) <Cr>", "File 1" },
      ["2"] = { "<Cmd>lua require('harpoon.ui').nav_file(2) <Cr>", "File 2" },
      ["3"] = { "<Cmd>lua require('harpoon.term').gotoTerminal(1)<Cr>", "Terminal 1" },
      ["4"] = { "<Cmd>lua require('harpoon.term').gotoTerminal(2)<Cr>", "Terminal 2" },
      ["5"] = { "<Cmd>lua require('harpoon.term').sendCommand(1,1)<Cr>", "Command 1" },
      ["6"] = { "<Cmd>lua require('harpoon.term').sendCommand(1,2)<Cr>", "Command 2" },

      q = {
        name = "Quick menu",
        k = { "<cmd>lua require('telescope.builtin').keymaps()<CR>", "Open Neovim Keymaps" },
        c = { "<cmd>Telescope commands<CR>", "Open Available Telescope Commands" },
        m = { "<cmd>Telescope man_pages<CR>", "Opens Man Pages" },
        x = { "<cmd>TroubleToggle quickfix<CR>", "Opens Quickfix" },
        l = { "<cmd>TroubleToggle loclist<CR>", "Opens Location List" },
        f = { "<cmd>ToggleTerm direction=float<CR>", "Floating Terminal" },
        v = { "<cmd>ToggleTerm direction=vertical<CR>", "Vertical Terminal" },
        h = { "<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal Terminal" },
      },

      r = {
        name = "Refactor",
        i = { [[<cmd>lua require('refactoring').refactor('Inline Variable')<cr>]], "Inline Variable" },
        b = { [[<cmd>lua require('refactoring').refactor('Exract Block')<cr>]], "Extract Block" },
        B = {
          [[<cmd>lua require('refactoring').refactor('Exract Block To File')<cr>]],
          "Extract Block to File",
        },
        r = { [[<cmd>lua require('telescope').extensions.refactoring.refactors()<cr>]], "Refactor" },
        P = {
          [[<cmd>lua require('refactoring').debug.printf({below = false})<cr>]],
          "Debug Print",
        },
        p = {
          [[<cmd>lua require('refactoring').debug.print_var({normal = true})<cr>]],
          "Debug Print Variable",
        },
        c = { [[<cmd>lua require('refactoring').debug.cleanup({})<cr>]], "Debug Cleanup" },
      },

      x = {
        name = "External",
        d = { "<cmd>lua require('plugins.term').docker_client_toggle()<CR>", "Docker" },
        t = { "<cmd>lua require('plugins.term').docker_ctop_toggle()<CR>", "Docker top" },
        p = { "<cmd>lua require('plugins.term').project_info_toggle()<CR>", "Project Info" },
        i = { "<cmd>lua require('plugins.term').system_info_toggle()<CR>", "System Info" },
        c = { "<cmd>lua require('plugins.term').interactive_cheatsheet_toggle()<CR>", "Cheatsheet" },
        s = { "<cmd>lua require('plugins.term').so()<CR>", "Stack Overflow" },
      },

      z = {
        name = "Lazy",
        c = { "<cmd>Lazy build<cr>", "Compile" },
        i = { "<cmd>Lazy install<cr>", "Install" },
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        S = { "<cmd>Lazy profile<cr>", "Status" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        p = { "<cmd>Lazy profile<cr>", "Profile" },
      },
    }

    local visual_mappings = {
      r = {
        name = "Refactor",
        e = { [[<cmd>lua require('refactoring').refactor('Extract function')<cr>]], "Extract function" },
        f = {
          [[<cmd>lua require('refactoring').refactor('Extract function to file')<cr>]],
          "Extract function to file",
        },
        v = { [[<cmd>lua require('refactoring').refactor('Extract variable')<cr>]], "Extract variable" },
        i = { [[<cmd>lua require('refactoring').refactor('Inline variable')<cr>]], "Inline variable" },
        r = { [[<cmd>lua require('telescope').extensions.refactoring.refactors()<cr>]], "Refactor" },
        d = { [[<cmd>lua require('refactoring').debug.print_var({})<cr>]], "Debug Print Var" },
        c = { [[<cmd>lua require('refactoring').debug.cleanup({})<cr>]], "Debug Cleanup" },
      },
    }

    whichkey.setup(conf)
    whichkey.register(normal_mappings, normal_opts)
    whichkey.register(visual_mappings, visual_opts)
  end,
}
