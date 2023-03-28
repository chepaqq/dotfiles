vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { buffer = ev.buf, desc = "Goto references" })
    vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { buffer = ev.buf, desc = "Find definition " })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Goto declaration" })
    vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", { buffer = ev.buf, desc = "Goto definition" })
    vim.keymap.set(
      "n",
      "gt",
      "<Cmd>Telescope lsp_type_definitions<CR>",
      { buffer = ev.buf, desc = "Goto type definition" }
    )
    vim.keymap.set(
      "n",
      "gi",
      "<Cmd>Telescope lsp_implementations<CR>",
      { buffer = ev.buf, desc = "Goto implementation" }
    )
    vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", { buffer = ev.buf, desc = "Peek definition" })
    vim.keymap.set(
      "n",
      "gP",
      "<Cmd>Lspsaga peek_type_definition<CR>",
      { buffer = ev.buf, desc = "Peek type definition" }
    )

    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set(
      "n",
      "<leader>e",
      "<cmd>Lspsaga show_line_diagnostics<CR>",
      { buffer = ev.buf, desc = "Line diagnostic" }
    )
    vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prcr>", { buffer = ev.buf, desc = "Prdiagnostic" })
    vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", { buffer = ev.buf, desc = "Next diagnostic" })
    vim.keymap.set(
      "n",
      "[e",
      '<cmd>lua require("lspsaga.diagnostic"):goto_pr{ severity = vim.diagnostic.severity.ERROR })<CR>',
      { buffer = ev.buf, desc = "Prerror" }
    )
    vim.keymap.set(
      "n",
      "]e",
      '<cmd>lua require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>',
      { buffer = ev.buf, desc = "Next error" }
    )
    vim.keymap.set(
      "n",
      "[w",
      '<cmd>lua require("lspsaga.diagnostic"):goto_pr{ severity = vim.diagnostic.severity.WARNING })<CR>',
      { buffer = ev.buf, desc = "Prwarning" }
    )
    vim.keymap.set(
      "n",
      "]w",
      '<cmd>lua require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARNING })<CR>',
      { buffer = ev.buf, desc = "Next warning" }
    )

    vim.keymap.set("n", "<leader>cwa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "Add workspace" })
    vim.keymap.set(
      "n",
      "<leader>cwr",
      vim.lsp.buf.remove_workspace_folder,
      { buffer = ev.buf, desc = "Remove workspace" }
    )
    vim.keymap.set("n", "<leader>cwl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, desc = "List workspaces" })

    vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename ++project<CR>", { buffer = ev.buf, desc = "Rename" })
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { buffer = ev.buf, desc = "Code action" })
    vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outline<CR>", { buffer = ev.buf, desc = "Outline" })
    vim.keymap.set("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { buffer = ev.buf, desc = "Code action" })
    vim.keymap.set("n", "<leader>cl", function()
      vim.lsp.codelens.run()
    end, { buffer = ev.buf, desc = "Run codelens" })
    vim.keymap.set("n", "<leader>cL", function()
      vim.lsp.codelens.refresh()
    end, { buffer = ev.buf, desc = "Refresh codelens" })
    vim.keymap.set("n", "<leader>cf", function()
      require("lsp.handlers").lsp_formatting()
    end, { buffer = ev.buf, desc = "Format document" })
    vim.keymap.set("v", "<leader>cf", function()
      require("lsp.handlers").range_formatting()
    end, { buffer = ev.buf, desc = "Format document" })
    vim.keymap.set(
      "n",
      "<leader>cs",
      "<cmd>Telescope lsp_document_symbols<CR>",
      { buffer = ev.buf, desc = "Document symbols" }
    )
    vim.keymap.set(
      "n",
      "<leader>cS",
      "<cmd>Telescope dynamic_workspace_symbols<CR>",
      { buffer = ev.buf, desc = "Workspace symbols" }
    )

    vim.keymap.set("n", "<leader>zl", "<Cmd>LspInfo<CR>", { buffer = ev.buf, desc = "LSP Info" })
  end,
})
