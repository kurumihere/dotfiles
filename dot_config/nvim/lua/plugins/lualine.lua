return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = false,
            section_separators = "",
            component_separators = "|",
            refresh = { statusline = 200 },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                "b:gitsigns_head",
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
                    "filename",
                    path = 0,
                },
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    cond = vim.diagnostic.is_enabled,
                },
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
}
