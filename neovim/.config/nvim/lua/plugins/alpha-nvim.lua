return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    -- Footer
    local function footer()
      local version = vim.version()
      local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
      local datetime = os.date("%Y/%m/%d %H:%M:%S")

      return print_version .. " - " .. datetime
    end

    -- Banner
    local banner = {
      "                                                    ",
      " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                    ",
    }

    dashboard.section.header.val = banner

    -- Menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "  Find file", ":Telescope file_browser<CR>"),
      dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
      dashboard.button("u", "  Update plugins", ":Lazy update<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    dashboard.section.footer.val = footer()

    require("alpha").setup(dashboard.config)

    -- Disable folding on alpha buffer
    vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
  end,
}
