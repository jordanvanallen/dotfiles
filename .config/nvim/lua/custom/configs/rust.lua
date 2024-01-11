local init = function()
  vim.g.rustfmt_autosave = 1
end

return {
  "rust-lang/rust.vim",
  ft = "rust",
  init = init,
}
