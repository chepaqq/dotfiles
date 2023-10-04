return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local indent_blankline = require("ibl")
    indent_blankline.setup({
      indent = { char = "▏" },
      scope = { enabled = true },
      exclude = {
        filetypes = {
          "lspinfo",
          "packer",
          "checkhealth",
          "help",
          "man",
          "dashboard",
          "git",
          "markdown",
          "text",
          "terminal",
          "NvimTree",
        },
        buftypes = {
          "terminal",
          "nofile",
          "quickfix",
          "prompt",
        },
      },
    })
  end,
}
