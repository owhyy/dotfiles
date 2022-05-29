-- vim.g.solarized_italic_comments = true
-- require('solarized').set('dark')

-- vim.cmd("colorscheme candle-grey")
-- vim.cmd("colorscheme starrynight")

-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd("colorscheme codeschool")

-- require("zenburn").setup()
vim.opt.termguicolors = true
require('lighthaus').setup({
  bg_dark = true,
  italic_comments = true,
})
