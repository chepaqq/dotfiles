return {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  { "nacro90/numb.nvim", event = "BufReadPre", config = true },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      require("colorizer").setup({})
      require("colorizer").attach_to_buffer(0)
    end,
  },
  {
    "numToStr/Comment.nvim",
    keys = { "gcc", "gbc", { "gc", mode = "v" }, { "gb", mode = "v" } },
    config = function()
      require("Comment").setup({
        ignore = "^$",
      })
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    keys = {
      { "<leader>ch", "<cmd>RustHoverActions<cr>", desc = "Hover Actions" },
      { "<leader>cR", "<cmd>RustRunnables<cr>", desc = "Runnables" },
      { "<leader>dl", "<cmd>RustDebuggables<cr>", desc = "Debuggales" },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "BufReadPre",
    config = true,
  },

  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
  },

  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "UndoTree" },
    },
  },

  {
    "abecodes/tabout.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
    },
    config = true,
  },
}
