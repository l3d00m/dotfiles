return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "tinymist",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = { markdown = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = {
          root_dir = require("lspconfig.util").root_pattern(".git"),
        },
        vtsls = {
          settings = {
            typescript = {
              tsdk = "./.yarn/sdks/typescript/lib",
            },
          },
        },
        tinymist = {
          settings = {
            exportPdf = "onType",
          },
        },
      },
    },
  },
}
