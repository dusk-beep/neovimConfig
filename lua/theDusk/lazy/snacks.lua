return {
	"folke/snacks.nvim",
	prilrity = 1000,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
		},
		statuscolumn = {},
		zen = {},
		scope = {},
		toggle = {},
		indent = {
			only_scope = true,
			only_current = true,
			hl = {
				"SnacksIndent1",
				"SnacksIndent2",
				"SnacksIndent3",
				"SnacksIndent4",
				"SnacksIndent5",
				"SnacksIndent6",
				"SnacksIndent7",
				"SnacksIndent8",
			},
			scope = {
				enabled = false,
			},
			blank = {
				char = ".",
			},
		},
	},
	keys = {
		-- Delete Buffer
		{
			"<leader>H",
			function()
				require("snacks").dashboard()
			end,
			desc = "open dashboard",
		},
		{
			"<leader>bd",
			function()
				require("snacks").bufdelete()
			end,
			desc = "Delete Buffer",
		},
		-- Rename File
		{
			"<leader>cR",
			function()
				require("snacks.rename").rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
	},
}
