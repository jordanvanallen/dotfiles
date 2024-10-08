local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local lspconfig = require("lspconfig")

local config = function()
	require("plugins.configs.lspconfig")

	-- Rust source support
	lspconfig.rust_analyzer.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "rust" },
		root_dir = lspconfig.util.root_pattern("Cargo.toml"),
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
			},
		},
	})

	-- Typescript source support
	-- lspconfig.tsserver.setup({
	-- 	root_dir = lspconfig.util.root_pattern("tsconfig.json"),
	-- 	on_attach = on_attach,
	-- 	capabilities = capabilities,
	-- 	filetypes = { "typescript" },
	-- 	settings = {
	-- 		completion = {
	-- 			completeFunctionCalls = true,
	-- 		},
	-- 	},
	-- })

	-- Ansible python/yaml support
	lspconfig.ansiblels.setup({
		filetypes = { "yaml.ansible" },
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {},
	})

	-- Dart source support
	lspconfig.dartls.setup({
		root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
		filetypes = { "dart" },
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			dart = {
				completeFunctionCalls = true,
				showTodos = true,
			},
		},
	})

	-- Docker and Dockerfile support
	lspconfig.dockerls.setup({
		root_dir = lspconfig.util.root_pattern("Dockerfile"),
		filetypes = { "dockerfile" },
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {},
	})

	-- Helm chart support
	lspconfig.helm_ls.setup({
		root_dir = lspconfig.util.root_pattern("Chart.yaml"),
		filetypes = { "helm" },
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {},
	})

	-- Ruby support
	lspconfig.rubocop.setup({
		root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
		filetypes = { "ruby" },
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {},
	})

	lspconfig.ruby_lsp.setup({
		root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
		filetypes = { "ruby" },
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {},
	})

	-- Svelte support
	lspconfig.svelte.setup({
		root_dir = lspconfig.util.root_pattern("package.json"),
		filetypes = { "svelte" },
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
}
