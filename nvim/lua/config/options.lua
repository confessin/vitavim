-- lua/config/options.lua
-- Basic Vim settings migrated from vimrc

local opt = vim.opt

-- General
-- Note: Neovim is always nocompatible, no need to set
opt.mouse = "a"

-- UI
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1
opt.cursorline = true
opt.showmatch = true
opt.ruler = true
opt.title = true
opt.showcmd = true
opt.laststatus = 2

-- Colors and syntax
-- Note: Syntax is enabled by default in Neovim
vim.cmd("syntax on")
opt.termguicolors = true
opt.background = "dark"

-- Completion
opt.completeopt = { "menuone", "longest", "preview" }
opt.pumheight = 6
opt.wildmenu = true
opt.wildmode = "full"
opt.wildignore = {
  "*.o",
  "*.obj",
  ".git",
  "*.pyc",
  "eggs/**",
  "*.egg-info/**",
  "*/tmp/*",
  "*.so",
  "*.swp",
  "*.zip",
  "*blaze*/*",
  "*review/*",
}

-- Editing
opt.backspace = { "indent", "eol", "start" }
opt.virtualedit = "block"
opt.scrolloff = 3
opt.startofline = false

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 2
opt.expandtab = true
opt.shiftround = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.smarttab = true
opt.hlsearch = true
opt.incsearch = true

-- Wrapping
opt.wrap = false
opt.linebreak = true

-- Folding
opt.foldmethod = "indent"
opt.foldlevel = 99

-- Files
opt.autowrite = false
opt.autowriteall = false
opt.autoread = false
opt.modeline = true
opt.modelines = 5
opt.fileformats = { "unix", "dos", "mac" }

-- Display
opt.list = true
opt.listchars = {
  tab = ">-",
  trail = "-",
  precedes = "<",
  extends = ">",
}

-- Messages
opt.report = 0
opt.shortmess:append("a")
opt.confirm = true

-- Bells
opt.errorbells = false
opt.visualbell = false

-- Matching
opt.matchpairs:append("<:>")

-- Colorcolumn
opt.colorcolumn = "79"

-- Grep
opt.grepprg = "rg --vimgrep"
