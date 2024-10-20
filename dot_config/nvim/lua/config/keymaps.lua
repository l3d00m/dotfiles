-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- FROM:https://lazyvim-ambitious-devs.phillips.codes/course/chapter-7/
local map = vim.keymap.set
map("n", "<leader>ft", "<cmd>e %:p:r.ts <cr>", { desc = "Open ts file" })
map("n", "<leader>fh", "<cmd>e %:p:r.html <cr>", { desc = "Open html file" })
map("n", "<leader>fx", "<cmd>e %:p:r.css<cr>", { desc = "Open css file" })

return {
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = ";;",
        delete = ";d",
        find = ";f",
        find_left = ";F",
        highlight = ";h",
        replace = ";r",
        update_n_lines = ";n",
      },
    },
  },

  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          keys = { "f", "F", "t", "T" },
        },
      },
    },
  },
}
