require("config.lazy")
--relative numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

--Setting tabs and spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=0")
vim.cmd("set softtabstop=-1")
vim.cmd("set shiftround")
--vim.cmd("")

--Setting colorscheme
--vim.cmd("colorscheme evergarden")

--gruvbox
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
