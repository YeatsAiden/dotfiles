vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>", { desc = "Open File Explorer" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Tabs
vim.keymap.set("n", "<S-h>", "<cmd>tabn<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<S-l>", "<cmd>tabp<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<C-S-l>", "<cmd>tabm+<CR>", { desc = "Move Tab Right" })
vim.keymap.set("n", "<C-S-h>", "<cmd>tabm-<CR>", { desc = "Move Tab Left" })
vim.keymap.set("n", "<C-w>t", "<cmd>$tabnew<CR>", { desc = "New Tab" })

-- Saving and quiting
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })

vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { desc = "" })
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- favorite remaps :DDDD
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
