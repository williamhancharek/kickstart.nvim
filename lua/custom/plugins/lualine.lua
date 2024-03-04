return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = 'onedark',
      globalstatus = true,
      component_separators = '|',
      section_separators = '',
      path = 1,
    },
    sections = {
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = {},
    },
    tabline = {
      lualine_a = { 'filename' },
    },
  },
}
