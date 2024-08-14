return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "rust-analyzer",
        "isort",
        "black",
        "pylint",
        "clang-format",
        "gofumpt",
        "gopls",
        "buf",
        "buf-language-server",
        "kotlin-language-server",
        "ktlint",
        "mdx-analyzer",
        "typescript-language-server",
        "pyright",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "kotlin",
        "yaml",
        "c",
        "cpp",
        "cmake",
        "css",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "javascript",
        "json",
        "make",
        "markdown",
        "mermaid",
        "proto",
        "python",
        "qmljs",
        "rust",
        "sql",
        "typescript",
        "terraform",
        "toml",
        "udev",
        "yaml",
      },
    },
  },
}
