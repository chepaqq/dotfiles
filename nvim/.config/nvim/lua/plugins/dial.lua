return {
  "monaqa/dial.nvim",
  keys = { "<C-a>", "<C-x>", { "<C-a>", "v" }, { "<C-x>", "v" }, { "g<C-a>", "v" }, { "g<C-x>", "v" } },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
        augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
        augend.constant.alias.bool,
        augend.date.alias["%m/%d/%Y"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        augend.semver.alias.semver,
      },
    })
    vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
    vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
    vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
    vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
    vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
    vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
  end,

}
