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

-- Function to convert the edit command format
function ConvertEditCommand()
  local command = vim.fn.input 'Enter edit command: '
  command = command:gsub('^%.?/+', '') -- Strips out "./" or "/" if it's at the beginning
  command = command:gsub('%s*$', '') -- Strips out any trailing spaces
  local file_path, line_number = string.match(command, '^(.-):(%d+)$')
  if file_path and line_number then
    vim.cmd('e ' .. file_path)
    vim.fn.cursor(tonumber(line_number), 1)
  else
    print 'Invalid input format. Use "/path/to/file.txt:line_number"'
  end
end

-- Key mapping for ConvertEditCommand function
vim.api.nvim_set_keymap('n', '<Leader>gl', ':lua ConvertEditCommand()<CR>', { noremap = true })
