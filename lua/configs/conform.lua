local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    python = { "isort", "black" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascript = { "prettier" },
    cpp = { "clang-format" },
    proto = { "buf" },
    kotlin = { "ktlint" },
    json = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
