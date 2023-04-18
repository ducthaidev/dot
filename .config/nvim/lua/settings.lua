-------------------
-- global config --
-------------------

vim.cmd([[colorscheme tokyonight-moon]])

local tab_number = 4
vim.g.cursorhold_updatetime = 100

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.tabstop = tab_number
vim.opt.shiftwidth = tab_number
vim.opt.softtabstop = tab_number
vim.opt.expandtab = true
--vim.opt.mouse = ""
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

vim.api.nvim_create_user_command("Diff", function()
    vim.cmd("w !git diff --no-index % -")
end, {})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require("go.format").goimport()
    end,
    group = format_sync_grp,
})

-- improves Go syntax highlighting
--vim.g.go_highlight_operators = 1
--vim.g.go_highlight_functions = 1
--vim.g.go_highlight_function_parameters = 1
--vim.g.go_highlight_function_calls = 1
--vim.g.go_highlight_types = 1
--vim.g.go_highlight_fields = 1
