return {
  "github/copilot.vim",
  -- add symbols-outline
  {
    "conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        markdown = { "prettierd" },
        python = { "autopep8" },
        typescript = { "eslint_d" },
        javascript = { "eslint_d" },
        vue = { "eslint_d" },
      },
    },
  },
}
