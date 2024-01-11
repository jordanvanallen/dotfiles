return {
  -- Syntax Highlighting
  require "custom.configs.nvim-treesitter",
  -- LSP
  require "custom.configs.lspconfig",
  require "custom.configs.mason",
  -- Formatter
  require "custom.configs.conform",
  -- TMUX
  -- require "custom.configs.vim-tmux-navigator",
  require "custom.configs.nvim-tmux-navigation",

  -- Rust
  require "custom.configs.rust-tools",
  require "custom.configs.rust",
}
