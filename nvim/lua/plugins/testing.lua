-- lua/plugins/testing.lua
-- Testing plugins (modern alternative to pytest.vim, makegreen)

return {
  -- Neotest (modern testing framework)
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
    keys = {
      { "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "Test nearest" },
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Test file" },
      { "<leader>tc", "<cmd>lua require('neotest').run.run({suite = false})<cr>", desc = "Test class" },
      { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Test summary" },
      { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Test output" },
      { "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Test output panel" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            args = { "--log-level", "DEBUG" },
            runner = "pytest",
          }),
        },
        status = {
          virtual_text = true,
        },
        output = {
          open_on_run = true,
        },
        quickfix = {
          open = function()
            vim.cmd("copen")
          end,
        },
      })
    end,
  },
}
