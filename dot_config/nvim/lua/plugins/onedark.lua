return {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = "darker",
            transparent = true,
            term_colors = false,
            ending_tildes = true,
            cmp_itemkind_reverse = true,
            code_style = {
                comments = "italic",
                keywords = "bold",
                functions = "bold",
                strings = "italic",
                variables = "none",
            },
            lualine = {
                transparent = true,
            },
            diagnostics = {
                darker = true,
                undercurl = true,
                background = true,
            },
        })

        vim.cmd.colorscheme("onedark")
    end,
}
