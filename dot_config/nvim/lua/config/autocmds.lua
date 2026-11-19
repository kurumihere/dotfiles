vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "highlight when yanking (copying) text",
    callback = function()
        if vim.version().minor >= 13 then
            vim.hl.hl_op({ higroup = "Visual", timeout = 150 })
        else
            vim.hl.on_yank({ higroup = "Visual", timeout = 150 })
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "quick close window",
    pattern = { "help", "qf", "nvim-undotree" },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>bd<cr>", { buffer = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "hide quickfix in the buffer list",
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "change comment symbol",
    pattern = { "dosini", "gitconfig" },
    callback = function()
        vim.opt_local.commentstring = "# %s"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "no comment on new line",
    callback = function()
        vim.opt_local.formatoptions:remove({ "o" })
    end,
})
