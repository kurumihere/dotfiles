return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name)
                return name == ".."
            end,
        },
        cleanup_delay_ms = 0,
        preview_win = {
            win_options = { wrap = false },
        },
        keymaps = {
            ["<C-h>"] = "actions.parent",
            ["<C-l>"] = "actions.select",
        },
    },
    keys = {
        { "<leader>o", "<cmd>Oil<cr>", desc = "Oil" },
    },
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
}
