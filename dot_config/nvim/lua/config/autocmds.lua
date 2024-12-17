-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--  command = "silent !pandoc % --template eisvogel.latex --listings -o %:r.pdf",
--  pattern = "*.md",
--})
vim.api.nvim_create_autocmd({ "BufEnter", "BufFilePost" }, {
  pattern = { "*.component.html", "*.component.ts" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- https://github.com/Myriad-Dreamin/tinymist/blob/main/editors/neovim/config/autocmds.lua
vim.api.nvim_create_autocmd({
  "BufNewFile",
  "BufRead",
}, {
  pattern = "*.typ",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "typst")
  end,
})
