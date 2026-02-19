-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- These are my personalised keymaps

-- use jj or jk to exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit Insert Mode" })

-- maps 'leader t' as floating terminal
vim.keymap.set("n", "<leader>t", "<cmd>FloatermToggle<CR>", { desc = "Toggle Floaterm" })
vim.keymap.set("n", "<leader>gg", "<cmd>FloatermNew lazygit<CR>", { desc = "Lazygit Floaterm" })

-- maps 'leader th' as horizontal split + terminal (adds a window with terminal at the bottom)
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("split | terminal")
end, { desc = "Terminal (Horizontal)" })

-- maps 'leader tv' as vertical split + terminal (adds a window with terminal on right)
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal")
end, { desc = "Terminal (Vertical)" })

-- use jj or jk to exit insert inside terminal
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })
vim.keymap.set("t", "jj", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- keybind to compile and run java file = ' leader ->r'
vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%")
  local class = vim.fn.expand("%:t:r")
  vim.cmd("split | terminal javac " .. file .. " && java " .. class)
end, { desc = "Run Java File" })

-- since lazyvim has leader -> s for search , i  am using 'as'
vim.keymap.set("n", "<leader>as", "<cmd>w<CR>", { desc = "Save File" })

-- i have hardcoded path for mingw , change this or remove if this causes error
vim.env.PATH = "C:\\msys64\\mingw64\\bin;" .. vim.env.PATH
