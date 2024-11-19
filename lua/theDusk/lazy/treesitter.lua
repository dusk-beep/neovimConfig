return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                "jsdoc", "bash", "java", "cpp", "python","css","html",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            indent = {
                enable = true
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },

          incremental_selection = {
            enable = true,
            keymaps = {
                 init_selection = "<leader>ss",
                  node_incremental = "<leader>nn",
                  node_decremental = "<leader>np",
                 scope_incremental = "<leader>sn",
               },
             }, 

            -- Textobjects configuration
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer", -- Around function
                        ["if"] = "@function.inner", -- Inner function
                        ["ac"] = "@class.outer",    -- Around class
                        ["ic"] = "@class.inner",    -- Inner class
                        ["ab"] = "@block.outer",    -- Around block
                        ["ib"] = "@block.inner",    -- Inner block
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
        })
    end
}
