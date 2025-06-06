-- Lazy.nvim entrypoint

vim.opt.laststatus = 3

vim.opt.fillchars:append({ eob = " " })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true

require("config.settings")
require("config.keymaps")
require("config.lazy")
