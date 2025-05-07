return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tinymist",
      },
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
          -- offset_encoding = "utf-8",
          settings = {
            exportPdf = "onType",
          },
        },
      },
    },
  },
}
