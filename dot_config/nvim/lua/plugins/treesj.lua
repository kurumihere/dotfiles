return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
        { "<leader>m", "<cmd>TSJToggle<cr>", desc = "toggle split/join" },
        { "<leader>j", "<cmd>TSJJoin<cr>", desc = "join syntax node" },
        { "<leader>s", "<cmd>TSJSplit<cr>", desc = "split syntax node" },
    },
    opts = { use_default_keymaps = false },
}
