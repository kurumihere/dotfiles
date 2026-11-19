return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
        -- enabled = false,
        indent = {
            char = "│",
            tab_char = "│",
        },
        scope = { enabled = false },
    },
    keys = {
        { "<leader>i", mode = { "n", "x" }, "<cmd>IBLToggle<cr>", desc = "toggle indent-blankline" },
    },
}
