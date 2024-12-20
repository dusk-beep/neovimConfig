vim.g.mapleader = " "
vim.keymap.set("n", "<leader>l", ":Neotree toggle<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

vim.keymap.set("n", "<c-s>", ":w<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })

vim.keymap.set("n", "<leader>cc", ":!make<CR>", { silent = true, desc = "make" })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
--move visual selected up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<c-q>", function()
	-- Check if the file has been modified
	if vim.bo.modified then
		local choice = vim.fn.input("File modified. Save changes? and quit  (y/n): ")
		if choice == "y" then
			vim.cmd("w")
			vim.cmd("q")
		elseif choice == "n" then
			vim.cmd("q!")
		else
			print("Aborted")
		end
	else
		-- File has not been modified, just quit
		vim.cmd("q")
	end
end)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to +" })
vim.keymap.set("n", "<leader>p", [["+p]], { desc = "pasete from + " })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete blackhole" })
vim.keymap.set({ "n", "v" }, "<leader>v", [["_dP]], { desc = "paste blackhole" })
