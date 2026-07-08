vim.g.mapleader = "'"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" },
        fast_wrap = {},
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "rust", "python", "bash", "markdown", "markdown_inline" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    'Saghen/blink.cmp',
    lazy = true,
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'fallback' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { "sources.default" }
  },
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { 'Saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      vim.lsp.config('*', { capabilities = capabilities })
      vim.lsp.enable({ "lua_ls", "pyright", "rust_analyzer", "gopls", "clangd" })
    end
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}, {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.cinoptions = "l1"
vim.opt.modeline = true
vim.opt.iminsert = 0
vim.opt.imsearch = 0
vim.opt.autoindent = true
vim.opt.autochdir = true
vim.opt.showcmd = true
vim.opt.laststatus = 0 -- Hide statusline (0: never, 1: only with splits (Vim default), 2: always, 3: global statusline)
vim.opt.ruler = false -- Hide the cursor position in the bottom right corner (ruler)

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "",
  },
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.cmd("colorscheme habamax")

vim.keymap.set("n", "gf", ":e <cfile><CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":confirm q<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { silent = true })
