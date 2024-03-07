vim.keymap.set('n', '<leader>1', ':MaximizerToggle!<CR>', { desc = 'Show [1] window' })
vim.keymap.set('n', '<leader>cp', function()
  local file_path = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
  local line_number = vim.fn.line '.'
  local path_with_line = file_path .. ':' .. line_number
  vim.fn.setreg('*', path_with_line)
  print('Copied to clipboard: ' .. path_with_line)
end, { desc = 'Copy file path and line number to clipboard' })
vim.keymap.set('n', 'f', '<Plug>Sneak_s', { desc = 'search forward' })
vim.keymap.set('n', 'F', '<Plug>Sneak_S', { desc = 'search backward' })
vim.opt.clipboard = 'unnamedplus'
