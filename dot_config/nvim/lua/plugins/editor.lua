return {
  {
    "chaoren/vim-wordmotion",
  },
  { "folke/persistence.nvim", enabled = false },
  -- { "nvimdev/dashboard-nvim", enabled = false },
  {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    opts = {
      use_git_branch = true,
      default_branch = "master",
      -- autoload = true,
      autosave = true,
    },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persisted").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persisted").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persisted").stop() end, desc = "Don't Save Current Session" },
      {
        "<leader>fs",
        "<cmd>Telescope persisted<cr>",
        desc = "Find Session",
      },
    },
  },
}
