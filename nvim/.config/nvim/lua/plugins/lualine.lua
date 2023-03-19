return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  required = {
    "nvim-tree/nvim-web-devicons",
  },
  dependencies = {
    "SmiteshP/nvim-navic",
  },
  config = function()
    local lualine = require("lualine")
    local navic = require("nvim-navic")
    lualine.setup({
      options = {
        theme = "gruvbox-material",
        globalstatus = true,
        disabled_filetypes = {
          winbar = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "alpha",
            "lir",
            "Outline",
            "spectre_panel",
            "toggleterm",
          },
        },
      },
      extensions = { "nvim-tree", "toggleterm", "fugitive", "nvim-dap-ui" },
      winbar = {
        lualine_c = { navic.get_location },
      },
    })
  end,
}
