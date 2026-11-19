return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- stylua: ignore
    config = function()
        local parsers = {
            "c", "lua", "markdown", "query", "vim", "vimdoc",
            "go", "python", "rust", "cpp", "typescript", "javascript",
            "html", "css", "json", "toml", "yaml", "ini", "kdl", "sql",
            "bash", "fish", "git_config",
        }

        local ts = require("nvim-treesitter")
        local installed = ts.get_installed()
        local is_missing = function(p) return not vim.list_contains(installed, p) end

        if vim.iter(parsers):any(is_missing) then
            if vim.fn.executable("tree-sitter") == 1 then
                ts.install(vim.iter(parsers):filter(is_missing):totable())
            else
                vim.notify(
                    "[nvim-treesitter]: `tree-sitter` cli not found, missing parsers cannot be installed",
                    vim.log.levels.WARN
                )
            end
        end

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local ft = args.match
                local bufnr = args.buf

                local lang = vim.treesitter.language.get_lang(ft) or ft
                if not vim.treesitter.language.add(lang) then return end

                vim.treesitter.start(bufnr, lang)
            end,
        })
    end,
}
