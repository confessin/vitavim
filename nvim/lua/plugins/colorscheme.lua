-- lua/plugins/colorscheme.lua
-- Colorscheme configuration

return {
  -- Gruvbox colorscheme (excellent readability and contrast)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,
      contrast = "hard",
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
