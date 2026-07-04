-- globals
vim.g.mapleader = "'"
vim.g.localleader = "\\"
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- ui
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.winborder = "solid"
vim.opt.pumblend = 5
vim.opt.winblend = 5
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·" }
vim.opt.fillchars = { eob = " " }

-- tabs
local tab_size = 4
vim.opt.tabstop = tab_size
vim.opt.softtabstop = tab_size
vim.opt.shiftwidth = tab_size
vim.opt.expandtab = true
vim.opt.shiftround = true

-- wraps
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.smoothscroll = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"

-- others
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.timeout = false
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.confirm = true

-- built-in plugins
vim.cmd("packadd nohlsearch")
vim.schedule(function()
    vim.cmd("packadd nvim.undotree")
end)

-- new massage pager
require("vim._core.ui2").enable()

-- default theme (as fallback)
if not vim.g.colors_name then
    vim.cmd.colorscheme("retrobox")
end
