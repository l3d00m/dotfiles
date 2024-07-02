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
  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        FIXME = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "fixme" }, -- a set of other keywords that all map to this FIX keywords
        },
        TODO = { icon = " ", color = "info", alt = { "todo" } },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      },
      search = {
        pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
      highlight = {
        pattern = [[^[^a-zA-Z0-9\s]*<(KEYWORDS)\s]], -- match without the extra colon. You'll likely get false positives
      },
    },
  },
}
