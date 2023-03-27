local M = {}

require("plugins.lsp.installer")

local clang_capabilities = require("plugins.lsp.handlers").capabilities
clang_capabilities.offsetEncoding = { "utf-16" }
local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local opts = {
  gopls = {
    lsp_inlay_hints = { enable = false },
    lsp_diag_virtual_text = false,
    lsp_on_attach = require("plugins.lsp.handlers").on_attach,
    lsp_document_formatting = false,
    lsp_cfg = {
      capabilities = require("plugins.lsp.handlers").capabilities,
    },
  },
  rust_analyzer = {
    tools = {
      inlay_hints = {
        auto = false,
      },
    },
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
      on_attach = require("plugins.lsp.handlers").on_attach,
      capabilities = require("plugins.lsp.handlers").capabilities,
      settings = {
        ["rust-analyzer"] = { checkOnSave = {
          command = "clippy",
        } },
      },
    },
  },
  clangd = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = clang_capabilities,
    commands = {
      ClangdSwitchSourceHeader = {
        function()
          switch_source_header_splitcmd(0, "edit")
        end,
        description = "Open source/header in current buffer",
      },
      ClangdSwitchSourceHeaderVSplit = {
        function()
          switch_source_header_splitcmd(0, "vsplit")
        end,
        description = "Open source/header in a new vsplit",
      },
      ClangdSwitchSourceHeaderSplit = {
        function()
          switch_source_header_splitcmd(0, "split")
        end,
        description = "Open source/header in a new split",
      },
    },
  },
  lua_ls = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        hint = {
          enable = true,
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}
local servers = {
  "ansiblels",
  "bashls",
  "clangd",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "gopls",
  "html",
  "jsonls",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "sqlls",
  "texlab",
  "yamlls",
}

function M.setup()
  local lspconfig = require("lspconfig")
  for _, lsp in ipairs(servers) do
    if lsp == "clangd" then
      lspconfig.clangd.setup(opts.clangd)
    elseif lsp == "lua_ls" then
      lspconfig.lua_ls.setup(opts.lua_ls)
    elseif lsp == "gopls" then
      require("go").setup(opts.gopls)
    elseif lsp == "rust_analyzer" then
      require("rust-tools").setup(opts.rust_analyzer)
    else
      lspconfig[lsp].setup({
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities,
      })
    end
  end
end

return M
