-- lua/config/keymaps.lua
-- Key mappings migrated from vimrc

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set working directory to current file
keymap("n", "<leader>.", ":lcd %:p:h<CR>", opts)

-- Folding level controls
keymap("n", "<leader>z<Up>", ":set foldlevel+=1<CR>", opts)
keymap("n", "<leader>z<Down>", ":set foldlevel-=1<CR>", opts)
keymap("n", "<leader>z1", ":set foldlevel=1<CR>", opts)
keymap("n", "<leader>zz", ":set foldlevel=99<CR>", opts)

-- Paste from clipboard
keymap("n", "<leader>p", '"+p', opts)

-- Quit window
keymap("n", "<leader>q", ":q<CR>", opts)

-- Hide search matches
keymap("n", "<leader><space>", ":nohlsearch<CR>", opts)

-- Remove trailing whitespace
keymap("n", "<leader>S", ":%s/\\s\\+$//<CR>:let @/=''<CR>", opts)

-- Select item in completion menu with enter
keymap("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]], { expr = true, noremap = true })

-- Split navigation
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)

-- Split navigation in insert mode
keymap("i", "<C-w>", "<C-O><C-w>", { noremap = true })

-- Buffer navigation (tab-like)
keymap("n", "<C-S-tab>", ":bprevious<CR>", opts)
keymap("n", "<C-tab>", ":bnext<CR>", opts)
keymap("i", "<C-S-tab>", "<Esc>:bprevious<CR>i", opts)
keymap("i", "<C-tab>", "<Esc>:bnext<CR>i", opts)

-- Buffer selection shortcuts (for airline/bufferline)
keymap("n", "<leader>1", ":buffer 1<CR>", opts)
keymap("n", "<leader>2", ":buffer 2<CR>", opts)
keymap("n", "<leader>3", ":buffer 3<CR>", opts)
keymap("n", "<leader>4", ":buffer 4<CR>", opts)
keymap("n", "<leader>5", ":buffer 5<CR>", opts)
keymap("n", "<leader>6", ":buffer 6<CR>", opts)
keymap("n", "<leader>7", ":buffer 7<CR>", opts)
keymap("n", "<leader>8", ":buffer 8<CR>", opts)
keymap("n", "<leader>9", ":buffer 9<CR>", opts)
keymap("n", "<leader>-", ":bprevious<CR>", opts)
keymap("n", "<leader>+", ":bnext<CR>", opts)

-- Quickfix window
keymap("n", "<leader>c", ":copen<CR>", opts)
keymap("n", "<leader>cc", ":cclose<CR>", opts)

-- Sudo write
keymap("c", "w!!", "w !sudo tee % >/dev/null", { noremap = true })

-- Reload vimrc
keymap("n", "<leader>V", ":source $MYVIMRC<CR>:lua print('vimrc reloaded')<CR>", opts)

-- Plugin-specific keymaps will be defined in their respective plugin configs
-- These are placeholders for reference:
-- <leader>n  - NERDTree/File explorer
-- <leader>f  - Fuzzy file finder (Telescope)
-- <leader>a  - Search (live grep)
-- <leader>g  - Git (fugitive/gitsigns)
-- <leader>r  - LSP rename
-- <leader>j  - LSP goto definition
-- <leader>td - Task list
-- <leader>t* - Testing keymaps
