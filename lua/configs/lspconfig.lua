-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "rust_analyzer", "qmlls", "bufls", "kotlin_language_server" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = "/tmp/ccls",
    },
    clang = {
      extraArgs = {
        "--sysroot=/Applications/ArmGNUToolchain/13.2.Rel1/arm-none-eabi/arm-none-eabi/include",
      },
    },
  },
}
