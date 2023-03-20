return {
  {
    "nvim-orgmode/orgmode",
    ft = { "org" },
    opts = {
      org_agenda_files = { vim.env.HOME .. "/Documents/Todo/*" },
      org_default_notes_file = vim.env.HOME .. "/Documents/Notes/default.org",
    },
    config = function(plugin, opts)
      require("orgmode").setup_ts_grammar()
      require("orgmode").setup(opts)
    end,
  },
}
