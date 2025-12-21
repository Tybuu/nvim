-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.scrolloff = 999
vim.opt.shell = "fish"

if vim.g.neovide then
  -- vim.g.neovide_fullscren = false
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_scroll_animation_far_lines = 9999
  vim.g.neovide_refresh_rate = 180
end
