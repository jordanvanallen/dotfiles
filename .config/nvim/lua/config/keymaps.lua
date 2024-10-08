-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Better window movement to integrate with TMUX windows
map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>", { desc = "Navigate window left (Nvim/Tmux)" })
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", { desc = "Navigate window right (Nvim/Tmux)" })
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>", { desc = "Navigate window down (Nvim/Tmux)" })
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>", { desc = "Navigate window up (Nvim/Tmux)" })

-- Delete Macro/Multi cursor
map("n", "cN", "*``cgN", { desc = "Delete Macro Next Backward" })
map("n", "cn", "*``cgn", { desc = "Delete Macro Next Forward" })

-- Better telescope Find
-- map("n", ",f", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", ",f", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })
-- ["<leader><Tab>"] = { ":b#<CR>", "Last Buffer" },
--
-- -- Buffers
map("n", "<Leader>;", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
