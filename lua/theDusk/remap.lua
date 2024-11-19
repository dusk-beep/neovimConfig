vim.g.mapleader = " "
vim.keymap.set("n", "<leader>l", ":Neotree toggle<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n","<leader>m","k$o",{silent = true})

vim.keymap.set("n","<leader>fc",":!astyle --indent=tab=2 --style=java --pad-oper %<CR>")

vim.keymap.set("n","<leader>cc",":!g++ %<CR>")
vim.keymap.set("n","<leader>cj",":!javac %<CR>")
vim.keymap.set("n","<leader>cm",":!make<CR>");
vim.keymap.set("n","<leader>h","q:");
vim.keymap.set("n","<leader>he",":@:-<CR>");

vim.keymap.set("n", "<leader>s", ":w<CR>", {silent = true})
vim.keymap.set("n","<C-k>","<C-w>k",{silent = true})
vim.keymap.set("n","<C-j>","<C-w>j",{silent = true})

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set({"n", "i"}, "~", "<S-Tab>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.java",  -- Apply to Java files
    callback = function()
        -- Save the file first to avoid overwriting changes
        vim.cmd(":w")

        -- Run astyle to format the file silently
        vim.cmd(":silent !astyle --indent=tab=2 --style=java --pad-oper --break-blocks %")

        -- Reload the file to reflect changes made by astyle
        vim.cmd(":edit!")  -- This reloads the file after it has been formatted by astyle
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.c",  -- Apply to Java files
    callback = function()
        -- Save the file first to avoid overwriting changes
        vim.cmd(":w")

        -- Run astyle to format the file silently
      vim.cmd(":silent !astyle --indent=tab=2 --style=linux --pad-oper --unpad-paren --align-pointer=type --keep-one-line-blocks --max-code-length=80 --convert-tabs --lineend=linux --break-blocks %")
        -- Reload the file to reflect changes made by astyle
        vim.cmd(":edit!")  -- This reloads the file after it has been formatted by astyle
    end,
})

