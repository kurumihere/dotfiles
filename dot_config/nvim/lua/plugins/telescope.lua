return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
        defaults = {
            winblend = 0,
            prompt_prefix = "  ",
            selection_caret = "  ",

            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.5,
                },
            },
            mappings = {
                i = {
                    ["<c-j>"] = "move_selection_next",
                    ["<c-k>"] = "move_selection_previous",
                },
                n = { ["<c-c>"] = "close" },
            },
        },
        pickers = {
            buffers = { sort_mru = true },
        },
    },
    config = function(_, opts)
        local function patch_previewer(previewer_type)
            local old_new = previewer_type.new
            previewer_type.new = function(op)
                op = op or {}
                op.preview_title = "Preview"
                return old_new(op)
            end
        end
        local previewers = require("telescope.previewers")
        patch_previewer(previewers.vim_buffer_cat)
        patch_previewer(previewers.vim_buffer_vimgrep)

        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
    end,
    keys = {
        { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
        { "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
        { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
        { "<leader>r", "<cmd>Telescope resume<cr>", desc = "Telescope resume" },
    },
}
