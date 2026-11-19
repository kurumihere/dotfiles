return {
    "saghen/blink.cmp",
    dependencies = {
        -- "saghen/blink.lib",
        "rafamadriz/friendly-snippets",
    },
    version = "1.*",
    event = "VeryLazy",

    -- build = function()
    --     require("blink.cmp").build():pwait()
    -- end,

    opts = {
        keymap = {
            preset = "default",
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

        sources = { default = { "lsp", "path", "snippets", "buffer" } },

        fuzzy = { implementation = "rust" },
    },
    opts_extend = { "sources.default" },
}
