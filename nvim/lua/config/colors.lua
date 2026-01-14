-- lua/config/colors.lua
-- Custom color overrides to fix unreadable cyan strings

-- Function to fix string highlighting
local function fix_colors()
  -- Set better colors for strings (not harsh cyan)
  vim.api.nvim_set_hl(0, "String", { fg = "#b8bb26", italic = false }) -- Gr een for strings
  vim.api.nvim_set_hl(0, "@string", { link = "String" })

  -- Fix other potentially harsh highlighting
  vim.api.nvim_set_hl(0, "Constant", { fg = "#d3869b" }) -- Purple for constants
  vim.api.nvim_set_hl(0, "@constant", { link = "Constant" })

  -- Make sure visual selection is visible but not too bright
  vim.api.nvim_set_hl(0, "Visual", { bg = "#3c3836" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#fabd2f", fg = "#282828" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#fe8019", fg = "#282828" })
end

-- Apply colors immediately
fix_colors()

-- Reapply after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = fix_colors,
})
