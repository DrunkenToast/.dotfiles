-- require('lualine').setup {
--     options = { theme = 'gruvbox_dark' }
-- }

-- local colors = {
--   blue   = '#80a0ff',
--   cyan   = '#79dac8',
--   black  = '#080808',
--   white  = '#c6c6c6',
--   red    = '#ff5189',
--   violet = '#d183e8',
--   grey   = '#303030',
-- }
--
-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.black, bg = colors.violet },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.black, bg = colors.black },
--   },
--
--   insert = { a = { fg = colors.black, bg = colors.blue } },
--   visual = { a = { fg = colors.black, bg = colors.cyan } },
--   replace = { a = { fg = colors.black, bg = colors.red } },
--
--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.black, bg = colors.black },
--   },
-- }

require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = '|',
  },
}
