return {
    "monkoose/matchparen.nvim",
    event = "VeryLazy",
    version = "2.0.0",
    opts = {},
    init = function()
        vim.g.loaded_matchparen = 1
    end,
}
