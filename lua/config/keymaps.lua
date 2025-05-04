-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

if vim.g.neovide then
  vim.keymap.set({ "n", "i", "v" }, "<C-S-n>", function()
    local cwd = vim.fn.getcwd()
    vim.fn.jobstart({ "foot", "-D", cwd }, { detach = true })
  end, { desc = "Launch foot with cwd" })
  vim.keymap.set({ "n", "i", "v" }, "<C-S-c>", '"+y')
  vim.keymap.set({ "n", "i", "v" }, "<C-S-v>", '"+p')
end
