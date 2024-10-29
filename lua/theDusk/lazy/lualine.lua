return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },  -- Ensure the icon dependency is loaded

    config = function()  -- Ensure the setup is in the config function
        require('lualine').setup {
            options = {
                icons_enabled = true,  -- Enable icons
                theme = 'gruvbox-material',  -- Set the theme to gruvbox-material
                component_separators = { left = '', right = '' },  -- Define component separators
                section_separators = { left = '', right = '' },  -- Define section separators
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},  -- Ignored focused file types
                always_divide_middle = true,  -- Always divide the middle
                globalstatus = false,  -- Set to true for a global statusline
                refresh = {
                    statusline = 1000,  -- Refresh intervals for the statusline
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},  -- Show mode (e.g., normal, insert)
                lualine_b = {'branch', 'diff', 'diagnostics'},  -- Branch, diff, and diagnostics info
                lualine_c = {'filename'},  -- Display the filename
                lualine_x = {'encoding', 'fileformat', 'filetype'},  -- Show encoding, file format, and type
                lualine_y = {'progress'},  -- Show progress in the buffer
                lualine_z = {'location'}  -- Show cursor location (line/column)
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},  -- Show filename in inactive sections
                lualine_x = {'location'},  -- Show location in inactive sections
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},  -- Configure tabline (if needed)
            winbar = {},  -- Configure winbar (if needed)
            inactive_winbar = {},  -- Configure inactive winbar (if needed)
            extensions = {}  -- Add extensions if needed
        }
    end
}

