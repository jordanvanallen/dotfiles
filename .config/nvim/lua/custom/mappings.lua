--@type MappingsTable
local M = {}

-- TODO: Break this up into more appropriate modules/tables as needed
M.general = {
	n = {
		-- ******************
		-- GENERAL
		-- ******************

		-- Navigation
		["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<CR>", "Navigate left (Nvim/Tmux)" },
		["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<CR>", "Navigate right (Nvim/Tmux)" },
		["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<CR>", "Navigate down (Nvim/Tmux)" },
		["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<CR>", "Navigate up (Nvim/Tmux)" },

		-- Window management
		["<leader>wv"] = { ":vsplit<CR>", "Split Window Vertically" },
		["<leader>ws"] = { ":split<CR>", "Split Window Horizontally" },

		["<leader><Tab>"] = { ":b#<CR>", "Last Buffer" },

		-- Buffers
		[";"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },

		-- File Management
		["<Space>fs"] = { ":w<CR>", "Save File" },
		[",f"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<Space>/"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },

		-- Multi-Cursor
		["cn"] = { "*``cgn", "Delete Macro Next Forward" },
		["cN"] = { "*``cgN", "Delete Macro Next Backward" },
	},
	i = {},
	c = {
		["<C-j>"] = { "<C-n>", "Move down in command mode" },
		["<C-k>"] = { "<C-p>", "Move up in command mode" },
	},

	v = {},
}

return M
