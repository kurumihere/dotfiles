return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod" },
    root_markers = { "go.mod", "go.work", ".git" },
    settings = {
        gopls = {
            completeFunctionCalls = false,
            semanticTokens = true,
            staticcheck = true,
            analyses = {
                appendclipped = true,
                fieldalignment = true,
                shadow = true,
                slicesdelete = true,
            },
            hints = {
                assignVariableTypes = true,
                -- compositeLiteralFields = true,
                -- compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                ignoredError = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
}
