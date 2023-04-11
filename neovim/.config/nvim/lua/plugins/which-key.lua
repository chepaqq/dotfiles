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

    local mappings = {
      D = { name = "Database" },
      b = { name = "Buffer" },
      c = { name = "Code", R = { name = "Refactor" }, g = { name = "Annotation" }, w = { name = "Workspace" } },
      d = { name = "Debug" },
      f = { name = "Find" },
      g = { name = "Git", h = { name = "Hunk" }, t = { name = "Toggle" } },
      h = { name = "Help" },
      j = { name = "Jump" },
      r = { name = "Run" },
      p = { name = "Project" },
      s = { name = "Search" },
      z = { name = "System" },
    }

    local visual_mappings = {
      c = { name = "Code", r = { name = "Refactor" } },
      d = { name = "Debug" },
      g = { name = "Git", h = { name = "Hunk" } },
      r = { name = "Run" },
    }
    whichkey.setup(conf)
    whichkey.register(mappings, normal_opts)
    whichkey.register(visual_mappings, visual_opts)
  end,
}
