return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- defaults
      "vim",
      "bash",
      "comment",

      -- programming languages
      "elixir",
      "erlang",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "html",
      "css",
      "graphql",
      "javascript",
      "json",
      "json5",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "ruby",
      "rust",
      "typescript",
      "yaml",
      "svelte",

      -- operations
      "dockerfile",
      "rego",
      "sql",
      "terraform",

      -- git related
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
    },
  },
}
