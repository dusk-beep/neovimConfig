return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    {'kkharji/sqlite.lua', module = 'sqlite'},  -- SQLite dependency for persistent storage
    -- Optionally uncomment one of the following to enable integration with a fuzzy finder:
    -- {'nvim-telescope/telescope.nvim'},  -- For Telescope support
    -- {'ibhagwan/fzf-lua'},  -- For fzf-lua support
  },
  config = function()
    -- Setup Neoclip configuration
    require('neoclip').setup({
      history = 25,
      enable_persistent_history = true,
      length_limit = 1048576,
      continuous_sync = true,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      filter = nil,
      preview = true,
      prompt = nil,
      default_register = '"',
      default_register_macros = 'q',
      enable_macro_history = true,
      content_spec_column = false,
      disable_keycodes_parsing = false,
      on_select = {
        move_to_front = false,
        close_telescope = true,
      },
      on_paste = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
      },
      on_replay = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
      },
      on_custom_action = {
        close_telescope = true,
      },
      -- Key mappings for interacting with Neoclip
      keys = {
        telescope = {
          i = {  -- Insert mode mappings
            select = '<cr>',  -- Select an entry
            paste = '<c-p>',  -- Paste selected entry
            paste_behind = '<c-k>',  -- Paste behind the cursor
            replay = '<c-q>',  -- Replay a macro
            delete = '<c-d>',  -- Delete an entry
            edit = '<c-e>',  -- Edit an entry
            custom = {},  -- Define custom actions here if needed
          },
          n = {  -- Normal mode mappings
            select = '<cr>',  -- Select an entry
            paste = 'p',  -- Paste selected entry
            paste_behind = 'P',  -- Paste behind the cursor
            replay = 'q',  -- Replay a macro
            delete = 'd',  -- Delete an entry
            edit = 'e',  -- Edit an entry
            custom = {},  -- Define custom actions here if needed
          },
        },
      },
    })

    -- Optionally, you can also add a keymap to open the Neoclip history via Telescope
    vim.keymap.set('n', '<leader>nh', function()
      require("telescope").extensions.neoclip.neoclip()  -- Open Neoclip history with Telescope
    end, { desc = "Open Neoclip History" })
  end,
}

