local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local options = function()
  return {
    server = {
      on_attach = on_attach,
      capabilities = capabilities
    }
  }
end

local config = function(_, opts)
  require("rust-tools").setup(opts)
end

return {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  dependencies = "neovim/nvim-lspconfig",
  opts = options,
  config = config,
}
