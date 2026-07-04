return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", ".git" },
    settings = {
        ["rust-analyzer"] = {
            check = { command = "clippy" },
            completion = { callable = { snippets = "add_parentheses" } },
        },
    },
}
