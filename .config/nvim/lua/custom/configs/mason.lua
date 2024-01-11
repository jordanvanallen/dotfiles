
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "rust-analyzer",
      "typescript-language-server",
      "ansible-language-server",
      "dockerfile-language-server",
      "rubocop",
      "ruby-lsp",
    },
  },
}
