local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options
opt.undofile = true
opt.keymap = "russian-jcukenwin"
opt.iminsert = 0
opt.imsearch = 0
opt.autochdir = true
opt.autowrite = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.joinspaces = false
opt.whichwrap:append("<>[]hl")

opt.number = true -- Show line number
opt.relativenumber = true -- Show relative number
opt.showmatch = true -- Highlight matching parenthesis
opt.colorcolumn = "80" -- Line lenght marker at 80 columns
opt.showmode = false
opt.signcolumn = "yes"
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.breakindent = true -- Wrap on line boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline
opt.hlsearch = true -- Set highlight on search
opt.incsearch = true
opt.scrolloff = 8
opt.scrollback = 100000
opt.splitbelow = true
opt.splitright = true
opt.cursorline = true

opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.softtabstop = 4
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.autoindent = true -- Autoindent new lines
opt.smartindent = true
opt.smarttab = true
opt.textwidth = 0

opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 700 -- ms to wait for trigger an event
opt.timeout = true
opt.timeoutlen = 300 -- wait for a mapped sequence to complete.

-- Better search
opt.path:remove("/usr/include")
opt.path:append("**")
opt.wildignorecase = true
opt.wildignore:append("**/.git/*")

-- Disable nvim intro
opt.shortmess:append("sI")

-- Better Netrw
g.netrw_banner = 0 -- Hide banner
g.netrw_altv = 1 -- Open with right splitting
g.netrw_liststyle = 3 -- Tree-style view
g.netrw_browse_split = 3 -- Open file in new tab
g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore
