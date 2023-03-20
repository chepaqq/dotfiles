return {
  "tpope/vim-dadbod",
  cmd = { "DBUIToggle", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  keys = {
    { "<leader>Du", "<Cmd>DBUIToggle<Cr>", desc = "Toggle UI" },
    { "<leader>Df", "<Cmd>DBUIFindBuffer<Cr>", desc = "Find buffer" },
    { "<leader>Df", "<Cmd>DBUIRenameBuffer<Cr>", desc = "Rename buffer" },
    { "<leader>Dq", "<Cmd>DBUILastQueryInfo<Cr>", desc = "Last query info" },
  },
}
