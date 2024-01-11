--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level      = "warn"
lvim.format_on_save = true
lvim.colorscheme    = "onedarker"

-- VIM settings
vim.opt.relativenumber = true
vim.wo.wrap = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- General Mappings
lvim.keys.normal_mode["<Leader><Tab>"] = ":b#<cr>"

-- Find files
lvim.keys.normal_mode[",f"] = "<Cmd>lua require(\"which-key\").execute(1)<CR>"

-- Unhighlight on enter
lvim.keys.normal_mode["<cr>"] = ":noh<cr><cr>"

-- Text Edit Mappings
lvim.keys.normal_mode["cn"] = "*``cgn"
lvim.keys.normal_mode["cN"] = "#``cgN"

-- Plugin Mappings

-- Tabularize
lvim.keys.visual_mode["tt"] = ":Tabularize<Space>/"
lvim.keys.visual_mode["t="] = ":Tabularize<Space>/=<CR>"
lvim.keys.visual_mode["t-"] = ":Tabularize<Space>/-<CR>"
lvim.keys.visual_mode["t:"] = ":Tabularize<Space>/:<CR>"
lvim.keys.visual_mode["t@"] = ":Tabularize<Space>/@<CR>"
lvim.keys.visual_mode["t>"] = ":Tabularize<Space>/=><CR>"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["t"] = {
  name = "+TMUX",

  -- Test Runner
  f = { ":TestFile<cr>", "Test Current File" },
  n = { ":TestNearest<cr>", "Test Nearest File" },
  s = { ":TestSuite<cr>", "Run Test Suite" },
  l = { ":TestLast<cr>", "Rerun Last Test" },
  v = { ":TestVisit<cr>", "Test Visit" },

  -- Tmux runner
  A = { ":VtrAttachToPane<cr>", "Attach runner to TMUX" },
}

lvim.builtin.which_key.mappings["w"] = {
  name = "+Window",
  v = { ":vsplit<cr>", "Split window vertically" },
  s = { ":split<cr>", "Split window horizontally" },
}

lvim.builtin.which_key.mappings["F"] = {
  name = "+Files",
  s = { ":w<cr>", "Save" },
  R = { ":Rename ", "Rename" },
  M = { ":Move ", "Move" },
  D = { ":Delete<cr>", "Delete" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "go",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "ruby",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "black", -- Python
    ---@usage arguments to pass to the formatter
    args = { "--line-length=119" },
  },
  {
    command = "rubocop",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "ruby" },
  },
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "rubocop", filetypes = { "ruby" } },
  { command = "eslint_d", filetypes = { "javascript", "javascriptreact" } },
}
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  -- TMUX
  {"christoomey/vim-tmux-navigator"},
  {"christoomey/vim-tmux-runner"},
  -- Tests in TMUX panes
  {"vim-test/vim-test"},

  -- Code formatting
  {"godlygeek/tabular"},
  {"tpope/vim-surround"},

  -- Files
  {"tpope/vim-eunuch"},

  -- Ruby
  {"tpope/vim-endwise"},
  {"tpope/vim-rails"},

  -- Rust
  {"timonv/vim-cargo"},

  -- Pretty
  -- Colorscheme
  {"sainnhe/gruvbox-material"},
}
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Plugin settings

-- vim-tmux-runner/vim-test
vim.cmd([[
let test#strategy = "vtr"
let test#ruby#rspec#options = '--format documentation'
]])
