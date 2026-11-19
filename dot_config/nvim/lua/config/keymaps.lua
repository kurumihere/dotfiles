vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "system yank" })
vim.keymap.set({ "n", "x" }, "<leader>Y", '"+Y', { desc = "system capital yank" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "system paste" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "system capital paste" })

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })
vim.keymap.set("n", "<esc>", vim.cmd.noh, { desc = "clear search highlight" })
vim.keymap.set("n", "<leader><space>", "<c-^>", { desc = "switch to last buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "quit with confirm" })

vim.keymap.set("n", "<leader>u", "<cmd>Undotree<cr>", { desc = "unodtree toggle" })
