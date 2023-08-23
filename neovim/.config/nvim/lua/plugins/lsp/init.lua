return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.lsp.servers").setup()
    end,
  },
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "jose-elias-alvarez/null-ls.nvim",
  },
  {
    {
      "williamboman/mason.nvim",
      cmd = { "Mason", "MasonInstall", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
      keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
      config = function()
        require("mason").setup()
      end,
    },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "TroubleClose", "Trouble", "TroubleRefresh" },
    config = true,
    keys = {
      { "<leader>cd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>cD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
      diagnostic = {
        on_insert = false,
      },
    },
  },
  {
    "liuchengxu/vista.vim",
    cmd = "Vista",
    event = "VeryLazy",
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "BufReadPre",
    config = function()
      require("lsp-inlayhints").setup()
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
    end,
  },
  { "j-hui/fidget.nvim", config = true, lazy = false, tag = "legacy" },
}
