---@type NvPluginSpec
local spec = {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      suggestion = {
        auto_trigger = true,
      },
    },
  },
}

return spec
