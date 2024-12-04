return {
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
        typst_lsp = {
          offset_encoding = "utf-8",
          settings = {
            exportPdf = "onType", -- Choose onType, onSave or never.
            -- serverPath = "" -- Normally, there is no need to uncomment it.
          },
        },
      },
    },
  },
}
