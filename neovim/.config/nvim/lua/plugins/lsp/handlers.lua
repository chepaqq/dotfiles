local M = {}

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
  return
end

function M.lsp_formatting(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

function M.range_formatting()
  local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    range = {
      ["start"] = { start_row, 0 },
      ["end"] = { end_row, 0 },
    },
    async = true,
  })
end

local function switch_source_header_splitcmd(bufnr, splitcmd)
  bufnr = require("lspconfig").util.validate_bufnr(bufnr)
  local clangd_client = require("lspconfig").util.get_active_client_by_name(bufnr, "clangd")
  local params = { uri = vim.uri_from_bufnr(bufnr) }
  if clangd_client then
    clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
      if err then
        error(tostring(err))
      end
      if not result then
        print("Corresponding file can’t be determined")
        return
      end
      vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
    end, bufnr)
  else
    print("textDocument/switchSourceHeader is not supported by the clangd server active on the current buffer")
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
function M.on_attach(client, bufnr)
  -- Keymaps
  require("plugins.lsp.keymaps").setup(client, bufnr)

  -- Highlighting
  require("plugins.lsp.highlighter").setup(client, bufnr)

  -- Code context
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end

  -- Code format on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        M.lsp_formatting(bufnr)
      end,
    })
  end
end

vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

return M
