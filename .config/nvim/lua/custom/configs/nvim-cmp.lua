local M = {}

M.setup = function()
	local cmp = require("cmp")
	local cmp_config = require("plugins.configs.cmp")

	cmp_config.mapping["<C-j>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		else
			fallback()
		end
	end, { "i", "s" })

	cmp_config.mapping["<C-k>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
		else
			fallback()
		end
	end, { "i", "s" })

	cmp.setup(cmp_config)
end

return M
