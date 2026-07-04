return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
        -- commentStyle = { italic = false },
        keywordStyle = { italic = false },
        transparent = true,
        colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        overrides = function(colors)
            local theme = colors.theme
            local palette = colors.palette
            local makeDiagnosticColor = function(color)
                local c = require("kanagawa.lib.color")
                return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
            end

            return {
                TelescopeTitle = { fg = theme.ui.special, bold = true },
                TelescopePromptNormal = { bg = palette.winterBlue },
                TelescopePromptBorder = { bg = palette.winterBlue, fg = palette.winterBlue },
                TelescopeResultsNormal = { bg = theme.ui.bg_m2 },
                TelescopeResultsBorder = { bg = theme.ui.bg_m2, fg = theme.ui.bg_m2 },
                TelescopePreviewNormal = { bg = theme.ui.bg_m3 },
                TelescopePreviewBorder = { bg = theme.ui.bg_m3, fg = theme.ui.bg_m3 },
                Pmenu = { bg = theme.ui.bg_p1, fg = theme.ui.shade0 },
                PmenuSel = { bg = theme.ui.bg_p2, fg = "none" },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },
                DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
                DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
                DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
                DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
                WinSeparator = { fg = theme.ui.float.fg_border },
                IblIndent = { fg = theme.ui.bg_p1 },
                ["@string.special.url"] = { underline = true, undercurl = false },
                ["@variable.builtin"] = { italic = false },
                DiagnosticUnnecessary = {},
            }
        end,
    },
    config = function(_, opts)
        require("kanagawa").setup(opts)
        vim.cmd.colorscheme("kanagawa-wave")
    end,
}
