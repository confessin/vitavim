-- lua/config/autocmds.lua
-- Autocommands migrated from vimrc

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Close preview window when moving in insert mode or leaving insert
local preview_group = augroup("ClosePreview", { clear = true })
autocmd("CursorMovedI", {
  group = preview_group,
  callback = function()
    if vim.fn.pumvisible() == 0 then
      vim.cmd("pclose")
    end
  end,
})
autocmd("InsertLeave", {
  group = preview_group,
  callback = function()
    if vim.fn.pumvisible() == 0 then
      vim.cmd("pclose")
    end
  end,
})

-- Filetype specific settings
local filetype_group = augroup("FileTypeSettings", { clear = true })

-- HTML, XML, CSS
autocmd("FileType", {
  group = filetype_group,
  pattern = { "html", "xhtml", "xml", "css" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Mako/Jinja templates as HTML
autocmd({ "BufNewFile", "BufRead" }, {
  group = filetype_group,
  pattern = { "*.mako", "*.mak", "*.jinja2" },
  command = "setlocal ft=html",
})

-- Java
autocmd("FileType", {
  group = filetype_group,
  pattern = "java",
  callback = function()
    vim.opt_local.autoindent = true
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Python
autocmd("FileType", {
  group = filetype_group,
  pattern = "python",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.smartindent = true
    vim.opt_local.cinwords = "if,elif,else,for,while,try,except,finally,def,class,with"
    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})

-- CoffeeScript
autocmd("FileType", {
  group = filetype_group,
  pattern = "coffee",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.smartindent = true
    vim.opt_local.cinwords = "if,elif,else,for,while,try,except,finally,def,class,with"
  end,
})

-- Highlight lines that are too long
local highlight_group = augroup("HighlightTooLongLines", { clear = true })
autocmd({ "WinEnter", "BufNewFile", "BufRead" }, {
  group = highlight_group,
  callback = function()
    vim.cmd("highlight def link RightMargin Error")
    if vim.opt.textwidth:get() ~= 0 then
      vim.fn.matchadd("RightMargin", "\\%>" .. vim.opt.textwidth:get() .. "v.\\+")
    end
  end,
})
