-------------------
-- global config --
-------------------

local tab_number = 4
vim.g.mapleader = " "
vim.g.cursorhold_updatetime = 100
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.tabstop = tab_number
vim.opt.shiftwidth = tab_number
vim.opt.softtabstop = tab_number
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

vim.g.tokyonight_italic_keywords = false
vim.cmd[[colorscheme tokyonight]]

vim.api.nvim_create_user_command("Diff", function()
    vim.cmd('w !git diff --no-index % -')
end, {})

