-----------------------------------------------------------
-- External tools
-----------------------------------------------------------
local M = {}

local status_ok, terminal = pcall(require, "toggleterm.terminal")
if not status_ok then
  return
end

local Terminal = terminal.Terminal

local lazygit = "lazygit"
local docker_lazydocker = "lazydocker"
local docker_ctop = "ctop"
local tokei = "tokei"
local btop = "btop"
local navi = "navi fn welcome"

local git_client = Terminal:new({
  cmd = lazygit,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

local project_info = Terminal:new({
  cmd = tokei,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = false,
})

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

local docker_client = Terminal:new({
  cmd = docker_lazydocker,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

local docker_ctop_client = Terminal:new({
  cmd = docker_ctop,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

local interactive_cheatsheet = Terminal:new({
  cmd = navi,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = false,
})

function M.interactive_cheatsheet_toggle()
  interactive_cheatsheet:toggle()
end

function M.so()
  local buf = vim.api.nvim_get_current_buf()
  lang = ""
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

function M.system_info_toggle()
  system_info:toggle()
end

function M.project_info_toggle()
  project_info:toggle()
end

function M.git_client_toggle()
  git_client:toggle()
end

function M.docker_client_toggle()
  docker_client:toggle()
end

function M.docker_ctop_toggle()
  docker_ctop_client:toggle()
end
return M
