return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "v0.*",
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',
	event = "InsertEnter",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		keymap = {
			preset = "enter",
			["~"] = { "snippet_backward", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<A-1>"] = {
				function(cmp)
					cmp.accept({ index = 1 })
				end,
			},
			["<A-2>"] = {
				function(cmp)
					cmp.accept({ index = 2 })
				end,
			},
			["<A-3>"] = {
				function(cmp)
					cmp.accept({ index = 3 })
				end,
			},
			["<A-4>"] = {
				function(cmp)
					cmp.accept({ index = 4 })
				end,
			},
			["<A-5>"] = {
				function(cmp)
					cmp.accept({ index = 5 })
				end,
			},
			["<A-6>"] = {
				function(cmp)
					cmp.accept({ index = 6 })
				end,
			},
			["<A-7>"] = {
				function(cmp)
					cmp.accept({ index = 7 })
				end,
			},
			["<A-8>"] = {
				function(cmp)
					cmp.accept({ index = 8 })
				end,
			},
			["<A-9>"] = {
				function(cmp)
					cmp.accept({ index = 9 })
				end,
			},
		},
		completion = {
			accept = {
				-- experimental auto-brackets support
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				treesitter = true,
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
					columns = { { "item_idx" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },
					components = {
						item_idx = {
							text = function(ctx)
								return tostring(ctx.idx)
							end,
							highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
						},
						label = {
							width = { fill = true, max = 30 },
						},
					},
				},
			},

			documentation = {
				auto_show = false,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
				},
			},
			ghost_text = {
				enabled = false,
			},
		},
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release
			use_nvim_cmp_as_default = false,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},
		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, via `opts_extend`
		sources = {
			completion = {
				enabled_providers = { "lsp", "path", "snippets", "buffer" },
			},
			-- optionally disable cmdline completions
			cmdline = {},
		},

		-- experimental signature help support
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},

		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},
}
