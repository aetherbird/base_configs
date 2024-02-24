vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.g.mapleader = " "
vim.keymap.set("i", "<C-c>", "<Esc>")

-- use move command to move highlighted text with auto indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- remap for alt-paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- share with system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- set executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
