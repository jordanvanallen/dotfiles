local config = function()
  local nvim_tmux_nav = require("nvim-tmux-navigation")

  nvim_tmux_nav.setup({
    disable_when_zoomed = true,
  })
end

return {
  "alexghergh/nvim-tmux-navigation",
  cmd = {
    "NvimTmuxNavigateLeft",
    "NvimTmuxNavigateDown",
    "NvimTmuxNavigateUp",
    "NvimTmuxNavigateRight",
    "NvimTmuxNavigateLastActive",
    "NvimTmuxNavigateNext",
  },
  config = config,
}
