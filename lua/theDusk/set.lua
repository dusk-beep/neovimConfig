vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8   

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Function to paste from the Termux clipboar
-- Function to handle yanking to the Termux clipboard
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        local clipboard_content = vim.fn.getreg('"')  -- Get the currently yanked content
        vim.fn.system('termux-clipboard-set "' .. clipboard_content .. '"')  -- Set it to the Termux clipboard
    end,
})

-- Function to paste from the Termux clipboard
function _G.paste(p)  -- Use _G to make the function global
    local sysclip = vim.fn.system('termux-clipboard-get')  -- Get the content from the Termux clipboard
    if sysclip ~= "" then
        vim.fn.setreg('"', sysclip)  -- Set the clipboard content to the default register
    end
    return p  -- Return the paste action
end

-- Key mappings for pasting
vim.api.nvim_set_keymap('n', 'p', 'v:lua.paste("p")', { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', 'P', 'v:lua.paste("P")', { expr = true, noremap = true })

