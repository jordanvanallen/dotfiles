return {
	-- Syntax Highlighting
	require("custom.configs.nvim-treesitter"),
	-- LSP
	require("custom.configs.lspconfig"),
	require("custom.configs.mason"),
	-- Formatter
	require("custom.configs.conform"),
	-- TMUX
	require("custom.configs.nvim-tmux-navigation"),

	-- General
	require("custom.configs.nvim-surround"),

	-- Rust
	require("custom.configs.rust-tools"),
	require("custom.configs.rust"),
}
