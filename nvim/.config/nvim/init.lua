require("core/options")
require("core.autocmds")
require("core.keymaps")
require("core/lazy")
require("utils")
vim.api.nvim_exec(
  [[
          autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
        ]],
  false
)
