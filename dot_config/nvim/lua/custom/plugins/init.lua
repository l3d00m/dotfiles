return {
  ["lervag/vimtex"] = {},
  ["rhysd/vim-grammarous"] = {},
  ["ntpeters/vim-better-whitespace"] = {},
  ["vim-pandoc/vim-pandoc-syntax"] = {},
  ["vim-pandoc/vim-pandoc"] = {},
  ["tpope/vim-obsession"] = {},
  ["tpope/vim-fugitive"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
  },
  ["xiyaowong/nvim-transparent"] = {},
}
