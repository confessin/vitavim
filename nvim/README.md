# Modern Neovim Configuration

A modern Neovim configuration migrated from VitaVim, featuring LSP, Treesitter, and Lua-based plugins.

## Features

- **Plugin Management**: lazy.nvim for fast, lazy-loaded plugins
- **LSP Support**: Native LSP with nvim-lspconfig, Mason for easy LSP server management
- **Completion**: nvim-cmp with LSP, buffer, path, and snippet sources
- **Syntax Highlighting**: Treesitter for better syntax highlighting and code understanding
- **File Navigation**: Telescope for fuzzy finding, Neo-tree for file exploration
- **Git Integration**: Fugitive, Gitsigns for Git operations and indicators
- **Testing**: Neotest for running and viewing test results
- **Modern UI**: Lualine statusline, Bufferline for buffer management
- **Python Development**: Pyright LSP, Ruff for linting/formatting, pytest support

## Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- A C compiler (for Treesitter)
- ripgrep (for Telescope live grep)
- Python 3 (for Python development)
- Node.js (for some LSP servers)

### Setup

1. **Backup your existing Neovim configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone or copy this configuration**:
   ```bash
   # If this is in a git repo
   git clone <repo-url> ~/.config/nvim

   # Or copy the nvim directory
   cp -r /path/to/nvim ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```

4. **Wait for plugins to install**: On first launch, lazy.nvim will automatically install all plugins. This may take a few minutes.

5. **Install LSP servers**: After plugins are installed, run:
   ```vim
   :Mason
   ```
   The configuration will automatically install common LSP servers, but you can install additional ones through the Mason UI.

6. **Install external tools** (optional but recommended):
   ```bash
   # For Python development
   pip install black isort ruff pytest

   # For Lua formatting
   brew install stylua  # macOS
   # or
   cargo install stylua  # with Rust

   # For JavaScript/TypeScript formatting
   npm install -g prettier
   ```

## Key Mappings

### Leader Key
- Leader key is `,` (comma)

### File Navigation
- `<leader>f` - Find files (Telescope)
- `<leader>a` - Live grep (search in files)
- `<leader>fb` - Show buffers
- `<leader>fr` - Recent files
- `<leader>n` - Toggle file explorer (Neo-tree)

### Buffer Management
- `<C-tab>` - Next buffer
- `<C-S-tab>` - Previous buffer
- `<leader>1-9` - Jump to buffer 1-9
- `<leader>-` - Previous buffer
- `<leader>+` - Next buffer

### Window Navigation
- `<C-h>` - Move to left window
- `<C-j>` - Move to down window
- `<C-k>` - Move to up window
- `<C-l>` - Move to right window

### LSP
- `gd` or `<leader>j` - Go to definition
- `gD` - Go to declaration
- `gr` - Find references
- `gi` - Go to implementation
- `K` - Hover documentation
- `<leader>r` - Rename symbol
- `<leader>ca` - Code actions
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>e` - Show diagnostic float

### Testing
- `<leader>tt` - Run nearest test
- `<leader>tf` - Run all tests in file
- `<leader>tc` - Run test class
- `<leader>ts` - Toggle test summary
- `<leader>to` - Open test output

### Git
- `<leader>gs` - Git status (Fugitive)
- `<leader>gc` - Git commit
- `<leader>gp` - Git push
- `<leader>gl` - Git pull

### Editing
- `<leader><space>` - Clear search highlight
- `<leader>S` - Remove trailing whitespace
- `<leader>q` - Quit window
- `<leader>p` - Paste from system clipboard

### Folding
- `<leader>z<Up>` - Increase fold level
- `<leader>z<Down>` - Decrease fold level
- `<leader>z1` - Set fold level to 1
- `<leader>zz` - Unfold all

### Other
- `<leader>td` - Show TODO comments
- `<leader>V` - Reload configuration
- `<leader>cm` - Open Mason (LSP installer)

## Configuration Structure

```
nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua     # Vim options/settings
│   │   ├── keymaps.lua     # Key mappings
│   │   └── autocmds.lua    # Autocommands
│   └── plugins/
│       ├── colorscheme.lua # Color scheme configuration
│       ├── ui.lua          # UI plugins (neo-tree, lualine, bufferline)
│       ├── editor.lua      # Editor plugins (telescope, treesitter, etc.)
│       ├── lsp.lua         # LSP and completion configuration
│       └── testing.lua     # Testing plugins (neotest)
└── README.md               # This file
```

## Customization

### Changing Colorscheme

Edit `lua/plugins/colorscheme.lua` to use a different colorscheme. Some alternatives are commented out in the file.

### Adding Plugins

Create a new file in `lua/plugins/` or add to an existing one:

```lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",  -- or other lazy-loading event
    config = function()
      -- Plugin configuration
    end,
  },
}
```

### Modifying Settings

- **Vim options**: Edit `lua/config/options.lua`
- **Key mappings**: Edit `lua/config/keymaps.lua`
- **Autocommands**: Edit `lua/config/autocmds.lua`

### Adding LSP Servers

1. Open Mason: `:Mason`
2. Find the server you want (use `/` to search)
3. Press `i` to install

Or add it to the `ensure_installed` list in `lua/plugins/lsp.lua`.

## Migrated from VitaVim

This configuration is a modern rewrite of the original VitaVim configuration with the following changes:

### Replaced Plugins
- **Vundle** → lazy.nvim (modern plugin manager)
- **NERDTree** → Neo-tree (Lua-based file explorer)
- **CtrlP/Command-T** → Telescope (Lua-based fuzzy finder)
- **YouCompleteMe** → nvim-cmp with LSP (native completion)
- **Syntastic** → Native LSP diagnostics
- **vim-airline** → Lualine (Lua-based statusline)
- **Rope/Ropevim** → Native LSP with Pyright (Python)
- **UltiSnips** → LuaSnip (Lua-based snippets)
- **nerdcommenter** → Comment.nvim (Lua-based commenting)
- **pytest.vim** → Neotest (modern testing framework)

### New Features
- Native LSP support with multiple language servers
- Treesitter for better syntax highlighting
- Modern Lua-based configuration
- Better performance with lazy-loading
- Integrated Git signs in the gutter
- TODO comment highlighting
- Which-key for keybinding discovery

## Troubleshooting

### Plugins not loading
```vim
:Lazy sync
```

### LSP not working
1. Check if LSP server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Reinstall server through Mason if needed

### Treesitter errors
```vim
:TSUpdate
```

### Performance issues
- Check startup time: `nvim --startuptime startup.log`
- Disable unused plugins by commenting them out in the plugin files

## Requirements for Full Functionality

### Python Development
```bash
pip install python-lsp-server black isort ruff pytest
```

### Node.js Development
```bash
npm install -g typescript typescript-language-server prettier
```

### Lua Development
```bash
brew install stylua  # macOS
```

## Credits

- Original VitaVim by Mohammad Rafi
- Migrated to modern Neovim with Lua and lazy.nvim

## License

Same as the original VitaVim configuration.
