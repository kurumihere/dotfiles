-- rust-analyzer is enabled by rustaceanvim
vim.lsp.enable({
    "lua_ls",
    "gopls",
    "ruff",
    "ty",
})

vim.diagnostic.config({
    severity_sort = true,
    float = { source = true, header = "" },
    signs = false,
    -- virtual_text = true,
})

-- enable inlay hints by default
vim.lsp.inlay_hint.enable(true)

vim.keymap.set({ "n", "x" }, "<leader>h", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "toggle LSP inlay hints" })

vim.keymap.set({ "n", "x" }, "<leader>d", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "toggle LSP diagnostics" })

-- ( K, [d, ]d, grr, gri, gra, grn, grt ) are built-in
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP goto definition" })
vim.keymap.set("n", "gq", vim.diagnostic.setqflist, { desc = "LSP diagnostics list" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "floating LSP diagnostic window" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            client.server_capabilities.semanticTokensProvider = nil
            client.server_capabilities.colorProvider = nil
        end
    end,
})
