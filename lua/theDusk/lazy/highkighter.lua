return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",                              -- Load the plugin before reading a buffer
  opts = {                                           -- Configuration options for the plugin
    filetypes = { "css", "javascript", "html" },     -- Enable for specific filetypes
    user_default_options = {
      RGB = true,                                    -- #RGB hex codes
      RRGGBB = true,                                 -- #RRGGBB hex codes
      names = false,                                 -- Disable color names like "Red"
      RRGGBBAA = true,                               -- #RRGGBBAA hex codes
      rgb_fn = true,                                 -- CSS rgb() and rgba() functions
      hsl_fn = true,                                 -- CSS hsl() and hsla() functions
      css = true,                                    -- Enable all CSS features
      css_fn = true,                                 -- Enable all CSS *functions*
      mode = "background",                           -- Set the display mode
    },
  },
}

