return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha",
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
            enabled = false,
        },
        integrations = {
            blink_cmp = true,
            fidget = true,
            flash = true,
            gitsigns = true,
            indent_blankline = {
                enabled = true,
            },
            native_lsp = {
                enabled = true,
            },
            telescope = {
                enabled = true,
            },
            treesitter = true,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
