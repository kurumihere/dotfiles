return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "VeryLazy",
    version = "1.*",
    -- build = "cargo build --release",

    opts = {
        appearance = { nerd_font_variant = "normal" },
        -- signature = { enabled = true },

        keymap = {
            preset = "default",
            ["<CR>"] = { "accept", "fallback" },
            ["<c-j>"] = { "select_next", "fallback" },
            ["<c-k>"] = { "select_prev", "fallback" },
        },

        completion = {
            menu = {
                -- auto_show = false,
                border = "none",
                winblend = vim.o.pumblend,
            },
            documentation = { window = { winblend = vim.o.winblend } },
        },

        cmdline = {
            keymap = {
                ["<c-j>"] = { "select_next", "fallback" },
                ["<c-k>"] = { "select_prev", "fallback" },
            },
            -- completion = { menu = { auto_show = true } },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
