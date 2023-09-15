return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    local sources = {
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.gomodifytags,
      null_ls.builtins.code_actions.impl,
      null_ls.builtins.code_actions.refactoring,
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.diagnostics.buf,
      null_ls.builtins.diagnostics.golangci_lint,
      null_ls.builtins.diagnostics.revive,
      null_ls.builtins.formatting.beautysh,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.sql_formatter,
      null_ls.builtins.hover.printenv,
      null_ls.builtins.formatting.clang_format.with({
        extra_args = { "--style={BasedOnStyle: llvm, IndentWidth: 4, UseTab: Never}" },
      }),
      null_ls.builtins.formatting.golines.with({
        extra_args = {
          "--max-len=180",
          "--base-formatter=gofumpt",
        },
      }),
      null_ls.builtins.formatting.stylua.with({
        extra_args = { "--indent-type=Spaces", "--indent-width=2" },
      }),
      null_ls.builtins.formatting.rustfmt.with({
        extra_args = { "--edition=2021" },
      }),
    }

    null_ls.setup({
      sources = sources,
      debounce = 300,
      default_timeout = 5000,
      save_after_format = true,
      on_attach = require("plugins.lsp.handlers").on_attach,
    })
  end,
}
