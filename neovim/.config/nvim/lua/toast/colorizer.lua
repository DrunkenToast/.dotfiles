require 'colorizer'.setup({
  '*'; -- Highlight all files, but customize some others.
  css = { css = true; }; -- Enable parsing rgb(...) functions in css.
  --html = { names = false; } -- Disable parsing "names" like Blue or Gray
}, { RRGGBBAA = true })
