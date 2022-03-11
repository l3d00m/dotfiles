-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvchad",
}

local userPlugins = require "custom.plugins" -- path to table
M.plugins = {
  install = userPlugins
}

return M
