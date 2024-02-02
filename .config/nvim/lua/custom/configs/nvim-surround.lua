local config = function()
	require("nvim-surround").setup({
    -- Configuration goes here
    -- Currently just defaulting
  })
end

return {
	"kylechui/nvim-surround",
	version = "*",
  event = "VeryLazy",
	config = config,
}
