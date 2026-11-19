return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            -- section_separators = "",
            -- component_separators = "|",
            refresh = { statusline = 200 },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                { "b:gitsigns_head", icon = "" },
                {
                    "diff",
                    source = function()
                        local gitsigns = vim.b.gitsigns_status_dict
                        if gitsigns then
                            return {
                                added = gitsigns.added,
                                modified = gitsigns.changed,
                                removed = gitsigns.removed,
                            }
                        end
                    end,
                },
            },
            lualine_c = {
                {
                    "filetype",
                    icon_only = true,
                    separator = "",
                    padding = { left = 1, right = 0 },
                    fmt = function(str)
                        return (str == nil or str == "") and " " or str
                    end,
                },
                {
                    "filename",
                    path = 1,
                    padding = { left = 0, right = 1 },
                },
            },

            lualine_x = {
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    cond = vim.diagnostic.is_enabled,
                    symbols = { error = " ", warn = " ", info = " ", hint = " " },
                },
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
}
