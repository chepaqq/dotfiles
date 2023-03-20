local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ","

-- Map Esc to kk
map("i", "kk", "<Esc>")

-- Toggle auto-indenting for code paste
map("n", "<F2>", ":set invpaste paste?<CR>")
vim.opt.pastetoggle = "<F2>"

-- Visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Quick save
map("n", "<leader>s", "<cmd>w<CR>", { desc = "Save", noremap = true, silent = true })

-- Close all windows
map("n", "<leader>q", "<cmd>qa!<CR>", { desc = "Quit", noremap = true, silent = true })

-- Clear highlighting
map("n", "<ESC>", "<cmd>nohl<CR>", { desc = "Clear highlighting", noremap = true, silent = true })

-- Fast reload config
map("n", "<leader>R", "<cmd>so %<CR>", { desc = "Reload config", noremap = true, silent = true })

-- Buffers movement
map("n", "<leader>bd", "<Cmd>bd!<Cr>", { desc = "Close current buffer", noremap = true, silent = true })
map("n", "<leader>bD", "<Cmd>%bd|e#|bd#<Cr>", { desc = "Delete all buffers", noremap = true, silent = true })
map("n", "]b", "<Cmd>bnext<CR>", { desc = "Next buffer", noremap = true, silent = true })
map("n", "[b", "<Cmd>bprevious<CR>", { desc = "Previous buffer", noremap = true, silent = true })
map("n", "[B", "<Cmd>bfirst<CR>", { desc = "First buffer", noremap = true, silent = true })
map("n", "]B", "<Cmd>blast<CR>", { desc = "Last buffer", noremap = true, silent = true })

-- Change split orientation
map("n", "<leader>tk", "<C-w>t<C-w>K", { desc = "Vertical to horizontal", noremap = true, silent = true })
map("n", "<leader>th", "<C-w>t<C-w>H", { desc = "Horizontal to vertical", noremap = true, silent = true })

-- Scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Move around plits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Insert blank line
map("n", "]<Space>", "o<Esc>", { desc = "Blank line after", noremap = true, silent = true })
map("n", "[<Space>", "O<Esc>", { desc = "Blank line before", noremap = true, silent = true })

-- Better indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP')

-- Move text up and down
map("x", "K", ":move '<-2<CR>gv=gv")
map("x", "J", ":move '>+1<CR>gv=gv")

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>")
map("n", "<Right>", ":vertical resize -1<CR>")
map("n", "<Up>", ":resize -1<CR>")
map("n", "<Down>", ":resize +1<CR>")

-- Terminal mappings
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "kk", "<C-\\><C-n>")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")
