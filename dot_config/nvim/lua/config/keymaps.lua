vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>q!<CR>')
vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>')

vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
  require('conform').format({ async = true, lsp_fallback = true })
end, { desc = 'Format buffer' })
