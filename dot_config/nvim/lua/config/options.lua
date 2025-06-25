-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.root_spec = { { ".git", "lua", ".jj" }, "lsp", "cwd" }
vim.opt.relativenumber = false
-- for persisted.nvim
vim.o.sessionoptions = "buffers,curdir,folds,tabpages,winpos,winsize"

-- vim.g.editorconfig = false

vim.opt.title = true
vim.opt.titlestring = [[%{fnamemodify(getcwd(), ':t')} - nvim]]
-- vim.opt.shiftwidth = 2
