require('nvim-autopairs').setup()
require('which-key').setup({})

require('conform').setup({
  formatters_by_ft = {
    c = { 'clang_format' },
    cpp = { 'clang_format' },
    go = { 'gofmt' },
    python = { 'isort', 'black' },
    lua = { 'stylua' },
  },
  default_format_opts = { lsp_format = 'fallback' },
})

require('mini.align').setup()
require('mini.basics').setup({ options = { extra_ui = true } })
vim.diagnostic.config({ virtual_text = true })
require('mini.clue').setup()
require('mini.cursorword').setup()
require('mini.doc').setup()
require('mini.extra').setup()
require('mini.indentscope').setup({
  symbol = '│',
  options = { try_as_border = true },
})
require('mini.trailspace').setup()
require('mini.misc').setup()
require('mini.surround').setup()

require('oil').setup({
  default_file_explorer = true,
  view_options = { show_hidden = true },
})

require('telescope').setup({})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>f.', builtin.resume, {})
