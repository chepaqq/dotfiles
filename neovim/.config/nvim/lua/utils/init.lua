M = {}
local status_ok, terminal = pcall(require, "toggleterm.terminal")
if not status_ok then
  return
end

local Terminal = terminal.Terminal

local lazygit = "lazygit"
local docker_lazydocker = "lazydocker"
local docker_ctop = "ctop"
local scc = "scc"
local btop = "btop"
local so = "so"

-- Lazygit
local git_client = Terminal:new({
  cmd = lazygit,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

local function git_client_toggle()
  git_client:toggle()
end

-- Code counter
local project_info = Terminal:new({
  cmd = scc,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = false,
})

local function project_info_toggle()
  project_info:toggle()
end

-- System moniitor
local system_info = Terminal:new({
  cmd = btop,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = true,
})

local function system_info_toggle()
  system_info:toggle()
end

-- Lazydocker
local docker_client = Terminal:new({
  cmd = docker_lazydocker,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

local function docker_client_toggle()
  docker_client:toggle()
end

-- Docker ctop
local docker_ctop_client = Terminal:new({
  cmd = docker_ctop,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

local function docker_ctop_toggle()
  docker_ctop_client:toggle()
end

local file_type = ""
local lang = ""

local function default_on_open(term)
  vim.cmd("stopinsert")
  vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
end

local function cht_on_open(term)
  vim.cmd("stopinsert")
  vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_name(term.bufnr, "cheatsheet-" .. term.bufnr)
  vim.api.nvim_buf_set_option(term.bufnr, "filetype", "cheat")
  vim.api.nvim_buf_set_option(term.bufnr, "syntax", lang)
end

local function cht_on_exit(_)
  vim.cmd([[normal gg]])
end
function M.open_term(cmd, opts)
  opts = opts or {}
  opts.size = opts.size or vim.o.columns * 0.5
  opts.direction = opts.direction or "float"
  opts.on_open = opts.on_open or default_on_open
  opts.on_exit = opts.on_exit or nil

  local new_term = Terminal:new({
    cmd = cmd,
    dir = "git_dir",
    auto_scroll = false,
    close_on_exit = false,
    start_in_insert = false,
    on_open = opts.on_open,
    on_exit = opts.on_exit,
  })
  new_term:open(opts.size, opts.direction)
end

local function cht()
  local buf = vim.api.nvim_get_current_buf()
  lang = ""
  file_type = vim.api.nvim_buf_get_option(buf, "filetype")
  vim.ui.input({ prompt = "cht.sh input: ", default = file_type .. " " }, function(input)
    local cmd = ""
    if input == "" or not input then
      return
    elseif input == "h" then
      cmd = ""
    else
      local search = ""
      local delimiter = " "
      for w in (input .. delimiter):gmatch("(.-)" .. delimiter) do
        if lang == "" then
          lang = w
        else
          if search == "" then
            search = w
          else
            search = search .. "+" .. w
          end
        end
      end
      cmd = lang
      if search ~= "" then
        cmd = cmd .. "/" .. search
      end
    end
    cmd = "curl cht.sh/" .. cmd
    M.open_term(cmd, { direction = "vertical", on_open = cht_on_open, on_exit = cht_on_exit })
  end)
end

-- Stack overflow
local function so()
  local buf = vim.api.nvim_get_current_buf()
  file_type = vim.api.nvim_buf_get_option(buf, "filetype")
  vim.ui.input({ prompt = "so input: ", default = file_type .. " " }, function(input)
    local cmd = ""
    if input == "" or not input then
      return
    elseif input == "h" then
      cmd = "-h"
    else
      cmd = input
    end
    cmd = "so " .. cmd
    M.open_term(cmd, { direction = "float" })
  end)
end

vim.keymap.set("n", "<leader>zd", function()
  docker_client_toggle()
end, { desc = "Lazydocker", noremap = true, silent = true })
vim.keymap.set("n", "<leader>zg", function()
  git_client_toggle()
end, { desc = "Lazygit", noremap = true, silent = true })
vim.keymap.set("n", "<leader>zc", function()
  docker_ctop_toggle()
end, { desc = "Docker ctop", noremap = true, silent = true })
vim.keymap.set("n", "<leader>zi", function()
  system_info_toggle()
end, { desc = "System info", noremap = true, silent = true })
vim.keymap.set("n", "<leader>pi", function()
  project_info_toggle()
end, { desc = "Project info", noremap = true, silent = true })
vim.keymap.set("n", "<leader>so", function()
  so()
end, { desc = "Stack Overflow", noremap = true, silent = true })
vim.keymap.set("n", "<leader>sc", function()
  cht()
end, { desc = "Cheatsheets", noremap = true, silent = true })
return M
