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
	},
	keys = {
		-- Delete Buffer
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
