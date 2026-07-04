return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        jump = { autojump = true },
        label = { uppercase = false },
        highlight = { backdrop = false },
        modes = {
            char = {
                autohide = true,
                highlight = {
                    backdrop = false,
                    groups = { match = "", label = "" },
                },
            },
        },
        prompt = {
            prefix = { { " ", "FlashPromptIcon" } },
        },
    },
    -- stylua: ignore
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
