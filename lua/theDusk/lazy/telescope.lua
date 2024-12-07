return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "jvgrootveld/telescope-zoxide" -- Add the zoxide plugin
  },

  config = function()
    local t = require("telescope")
    local z_utils = require("telescope._extensions.zoxide.utils")
    local builtin = require('telescope.builtin')

    t.setup({
      pickers = {
        find_files = {
          find_command = {"rg", "--files", "--glob", "!.git", "--glob", "!node_modules/*", "--sortr", "modified"}

        }
      },
      defaults = {
        mappings = {
          n = {
            ["j"] = "move_selection_next",
            ["k"] = "move_selection_previous",
          },
          i = {
            ["<Tab>"] = "move_selection_next",
            ["~"] = "move_selection_previous",
          },
        },
      },
      extensions = {
        zoxide = {
          prompt_title = "[ Walking on the shoulders of TJ ]",
          mappings = {
            default = {
              after_action = function(selection)
                print("Update to (" .. selection.z_score .. ") " .. selection.path)
              end,
            },
            ["<C-s>"] = {
              before_action = function(selection) print("before C-s") end,
              action = function(selection)
                vim.cmd.edit(selection.path)
              end,
            },
            ["<C-q>"] = { action = z_utils.create_basic_command("split") },
          },
        },
      },
    })

    -- Load the zoxide extension
    t.load_extension("zoxide")

    -- Key mappings for Telescope
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>fw', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>td', function()
      builtin.diagnostics({ bufnr = 0 })
    end, { noremap = true, silent = true })

    -- Key mapping for zoxide
    vim.keymap.set('n', '<leader>cd', t.extensions.zoxide.list, { desc = "Zoxide List" })
  end,
}
