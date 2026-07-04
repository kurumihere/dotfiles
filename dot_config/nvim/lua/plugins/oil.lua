return {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name)
                return name == ".."
            end,
        },

        float = {
            max_width = 0.8,
            max_height = 0.8,
        },

        preview_win = {
            win_options = { wrap = false },
        },

        keymaps = {
            ["q"] = "actions.close",
            ["<C-h>"] = "actions.parent",
            ["<C-l>"] = "actions.select",
        },
    },
    keys = {
        { "<leader>o", "<cmd>Oil --preview<cr>", desc = "Oil" },
    },
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
}
