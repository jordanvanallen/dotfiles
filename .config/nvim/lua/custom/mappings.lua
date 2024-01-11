--@type MappingsTable
local M = {}

-- TODO: Break this up into more appropriate modules/tables as needed
M.general = {
  n = {
    -- ******************
    -- GENERAL
    -- ******************

    -- Navigation
    ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<CR>", "Window up" },

    -- TODO: Tabularize this file to clean it up

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

  i = {
    -- Navigation
    ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<CR>", "Window up" },
  },

  v = {},
}

return M
