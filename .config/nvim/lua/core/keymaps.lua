-- NVIM Global Options

-- Set leader mapping
vim.g.mapleader = " "

-- Set additional keymaps
local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- use jk to exit insert mode
--keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>hlc", ":nohl<CR>", { desc = "[H]igh[L]ight Search Clear" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Buffer Management
keymap.set("n", "<leader>bl", "<cmd>buffers<CR>", { desc = "[B]uffer [L]ist" }) -- list buffers
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "[B]uffer [N]ext" }) -- move next buffer
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "[B]uffer [P]revious" }) -- move previous buffer
keymap.set("n", "<leader>ba", "<cmd>ball<CR>", { desc = "[B]uffer [A]ll to Windows" }) -- open all buffers as windows

-- Tab Management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[T]ab [O]pen New" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[T]ab E[X]it" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[T]ab [N]ext Goto" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[T]ab [P]revius Goto" }) --  go to previous tab
keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "[T]ab [Buffer] Open current buffer" }) --  move current buffer to new tab

-- Window Management
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window Focus Left" }) -- move window focus / selection to left
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window Focus Down" }) -- move window focus / selection to down
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window Focus Up" }) -- move window focus / selection to up
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window Focus Right" }) -- move window focus / selection to right

keymap.set("n", "<M-h>", "<cmd>vertical resize -2<CR>", { desc = "Window Resize +2xWidth" }) -- resize window (-2W)
keymap.set("n", "<M-j>", "<cmd>resize -2<CR>", { desc = "Window Resize -2xHeight" }) -- resize window (-2H)
keymap.set("n", "<M-k>", "<cmd>resize +2<CR>", { desc = "Window Resize +2xHeight" }) -- resize window (+2H)
keymap.set("n", "<M-l>", "<cmd>vertical resize +2<CR>", { desc = "Window Resize +2xWidth" }) -- resize window (+2W)
keymap.set("n", "<M-=>", "<cmd>resize =<CR>", { desc = "Window Resize Equal" }) -- resize window equally
keymap.set("n", "<M-->", "<cmd>horizontal wincmd =<CR>", { desc = "Window Resize Horizontal Equal" }) -- resize window equally
keymap.set("n", "<M-|>", "<cmd>vertical wincmd =<CR>", { desc = "Window Resize Vertical Equal" }) -- resize window equally

keymap.set("n", "<leader>wv", "<C-w>v", { desc = "[W]indows [V]ertical Split" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "[W]indows [H]orizontal Split" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "[W]indows [E]qual Size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "[W]indow C[X]ose Current Split" }) -- close current split window
