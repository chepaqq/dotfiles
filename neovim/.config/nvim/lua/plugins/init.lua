return {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  { "tpope/vim-repeat", event = "VeryLazy" },
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
    event = "BufReadPre",
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
    opts = { delay = 50 },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  {
    "ray-x/go.nvim",
    build = ':lua require("go.install").update_all_sync()',
    dependencies = {
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
  { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
}
