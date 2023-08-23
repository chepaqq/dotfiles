local mason_installer_ok, mason_installer = pcall(require, "mason-tool-installer")
if not mason_installer_ok then
  return
end

local servers = {
  "ansible-language-server",
  "bash-language-server",
  "beautysh",
  "black",
  "clang-format",
  "clangd",
  "codelldb",
  "css-lsp",
  "docker-compose-language-service",
  "dockerfile-language-server",
  "gopls",
  "html-lsp",
  "json-lsp",
  "lua-language-server",
  "prettier",
  "pyright",
  "revive",
  "rust-analyzer",
  "shellcheck",
  "sql-formatter",
  "staticcheck",
  "stylua",
  "texlab",
  "yaml-language-server",
}

mason_installer.setup({
  ensure_installed = servers,
})
