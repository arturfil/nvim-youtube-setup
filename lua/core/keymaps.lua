vim.g.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- This keybinding uses jk as the escape key to exit a mode
vim.api.nvim_set_keymap("i", "jk", "<ESC>", {noremap = true})

-- This keymap clears search
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

