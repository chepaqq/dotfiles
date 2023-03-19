local M = {}

local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

local range_formatting = function()
  local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
  vim.lsp.buf.format({
    range = {
      ["start"] = { start_row, 0 },
      ["end"] = { end_row, 0 },
    },
    async = true,
  })
end

function M.setup(client, bufnr)
  local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  vim.keymap.set(
    "n",
    "[e",
    '<cmd>lua require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>',
    opts
  )
  vim.keymap.set(
    "n",
    "]e",
    '<cmd>lua require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>',
    opts
  )
  if ft == "rust" then
    keymap_c = {
      name = "Code",
      d = { "<cmd>RustDebuggables<cr>", "Debuggables" },
      h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
      R = { "<cmd>RustRunnables<cr>", "Runnables" },
    }
  end
  local mappings = {
    l = {
      name = "LSP",
      e = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Float diagnostics" },
      o = { "<cmd>Lspsaga outline<CR>", "Outline bar" },
      d = { "<cmd>TroubleToggle<cr>", "Diagnostics list" },
      D = { "<cmd>Telescope diagnostics<cr>", "Diagnostics list (Telescope)" },
      a = { "<cmd>Lspsaga code_action<CR>", "Code action menu" },
      h = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
      r = { "<cmd>Lspsaga rename ++project<CR>", "Rename" },
      i = { "<cmd>LspInfo<CR>", "Lsp Info" },
      R = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "References" },
      s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document Symbols" },
      l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "Run CodeLens" },
      L = { "<cmd>lua vim.lsp.codelens.refresh()<CR>", "Refresh CodeLens" },
      f = {
        function()
          require("lsp.handlers").lsp_formatting()
        end,
        "Format document",
      },
    },
    d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      w = {
        name = "Widgets",
        h = {
          function()
            require("dap.ui.widgets").hover()
          end,
          "Hover Variables",
        },
        s = {
          function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
          end,
          "Scopes",
        },
        p = {
          function()
            require("dap.ui.widgets").preview()
          end,
          "Preview",
        },
        f = {
          function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
          end,
          "Frames",
        },
      },
    },
    g = {
      name = "Goto",
      d = { "<Cmd>Telescope lsp_definitions<CR>", "Definition" },
      D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
      i = { "<cmd>Telescope lsp_implementations<CR>", "Implementation" },
      t = { "<cmd>Telescope lsp_type_definitions()<CR>", "Type Definition" },
      p = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" },
      P = { "<cmd>Lspsaga peek_type_definition<CR>", "Peek type definition" },
    },
    w = {
      name = "Workspace",
      a = { "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace" },
      r = { "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace" },
      s = { "<Cmd>Telescope lsp_workspace_symbols<CR", "Document symbols in the current workspace" },
      l = {
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        "Print workspace folders",
      },
    },
  }

  local keymap_v = {
    l = {
      name = "LSP",
      a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
      f = { range_formatting, "Range Formatting" },
    },
    d = {
      name = "Debug",
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    },
  }

  whichkey.register(mappings, {
    mode = "n",
    prefix = "<leader>",
    buffer = bufnr,
    silent = true,
    noremap = true,
    nowait = false,
  })

  whichkey.register(keymap_c, {
    mode = "n",
    prefix = "<leader>",
    buffer = bufnr,
    silent = true,
    noremap = true,
    nowait = false,
  })

  whichkey.register(keymap_v, {
    mode = "v",
    prefix = "<leader>",
    buffer = bufnr,
    silent = true,
    noremap = true,
    nowait = false,
  })
end
return M
