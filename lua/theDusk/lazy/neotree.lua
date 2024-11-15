return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- optional, for image preview support
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = false,
         filesystem = {
            filtered_items = {  -- Corrected typo here
                visible = false,
                hide_by_name = { ".class" },
                hide_by_pattern = { "*.class","*.orig" },
            },
          },
          window = {
                position = "bottom"
            }
        })
    end,
}
