vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "system yank" })
vim.keymap.set({ "n", "x" }, "<leader>Y", '"+Y', { desc = "system capital yank" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "system paste" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "system capital paste" })

vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set({ "n", "x" }, "<down>", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({ "n", "x" }, "<up>", "v:count == 0 ? 'gk' : 'k'", { expr = true })

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })
vim.keymap.set("n", "<esc>", vim.cmd.noh, { desc = "clear search highlight" })
vim.keymap.set("n", "<leader><leader>", "<c-^>", { desc = "switch to last buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "save file" })
vim.keymap.set("n", "<leader>q!", "<cmd>quit!<cr>", { desc = "quit without saving" })

vim.keymap.set("n", "<leader>u", "<cmd>Undotree<cr>", { desc = "unodtree toggle" })
