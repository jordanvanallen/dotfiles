return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"rust-analyzer",
			"ansible-language-server",
			"dockerfile-language-server",
		},
	},
}
