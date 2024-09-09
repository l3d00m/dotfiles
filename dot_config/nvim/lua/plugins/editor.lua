return {
  {
    "chaoren/vim-wordmotion",
  },
  { "folke/persistence.nvim", enabled = false },
  -- { "nvimdev/dashboard-nvim", enabled = false },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    opts = {
      use_git_branch = true,
      default_branch = "master",
      autoload = true,
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
        pattern = [[(KEYWORDS)]],
      },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    opts = {
      default_mappings = {
        ours = "<leader>gho",
        theirs = "<leader>ght",
        none = "<leader>gh0",
        both = "<leader>ghb",
        next = "]x",
        prev = "[x",
      },
    },
    keys = {
      {
        "<leader>gx",
        "<cmd>GitConflictListQf<cr>",
        desc = "List Conflicts",
      },
      {
        "<leader>gr",
        "<cmd>GitConflictRefresh<cr>",
        desc = "Refresh Conflicts",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = false,
          hide_gitignored = true,
          hide_dotfiles = false,
          hide_hidden = false,
          never_show = {
            "node_modules",
          },
        },
      },
    },
  },
}
