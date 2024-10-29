return {
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            -- Configure Gruvbox Material
            vim.opt.background = 'dark'
            vim.g.gruvbox_material_background = 'hard'
	          vim.g.gruvbox_material_foreground = 'material'
            vim.gruvbox_material_ui_contrast = 'high'
            vim.g.gruvbox_material_better_performance = 1

            -- Load the colorscheme
            vim.cmd.colorscheme('gruvbox-material')
        end,
    }
}

