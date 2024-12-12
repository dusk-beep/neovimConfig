vim.g.mapleader = " "
vim.keymap.set("n", "<leader>l", ":Neotree toggle<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>m", "k$o", { silent = true })

vim.keymap.set("n", "<leader>fc", ":!astyle --indent=tab=2 --style=java --pad-oper %<CR>")

vim.keymap.set("n", "<leader>cc", ":!g++ %<CR>")
vim.keymap.set("n", "<leader>cj", ":!javac %<CR>")
vim.keymap.set("n", "<leader>cm", ":!make<CR>")

vim.keymap.set("n", "<c-s>", ":w<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>np", "f,;t,;", { noremap = true, silent = true })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "B", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "W", ":bnext<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>Q", ":bd<CR>", { noremap = true, silent = true })
--refer snacks
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

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
