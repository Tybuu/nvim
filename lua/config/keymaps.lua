-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Luasnip keymaps
vim.keymap.set({ 'i' }, '<C-K>', function()
  require('luasnip').expand()
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-L>', function()
  require('luasnip').jump(1)
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-J>', function()
  require('luasnip').jump(-1)
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-E>', function()
  if require('luasnip').choice_active() then
    require('luasnip').change_choice(1)
  end
end, { silent = true })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Toggles the checkbox in markdown boxes
vim.keymap.set('n', '<Leader>m', function()
  local current_line = vim.api.nvim_get_current_line()
  if string.find(current_line, '%[ %]') ~= nil then
    local text = string.gsub(current_line, '%[ %]', '[X]')
    vim.api.nvim_set_current_line(text)
  else
    local text = string.gsub(current_line, '%[X%]', '[ ]')
    vim.api.nvim_set_current_line(text)
  end
end)
