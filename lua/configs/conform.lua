local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    -- python = { "isort", "black", "ruff" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascript = { "prettier" },
    cpp = { "clang-format" },
    proto = { "buf" },
    kotlin = { "ktlint" },
    markdown = { "prettier" },
    json = { "prettier" },
    toml = { "taplo" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 10000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
