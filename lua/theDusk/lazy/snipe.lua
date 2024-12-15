return {
	"leath-dub/snipe.nvim",
	dependencies = {
		"nicholasxjy/snipe-marks.nvim",
		"kungfusheep/snipe-lsp.nvim",
	},
	event = "VeryLazy",
	keys = {
		{
			"£",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
		{
			"<leader>ml",
			function()
				require("snipe-marks").open_marks_menu()
			end,
			desc = "Find local marks",
		},
		{
			"<leader>ma",
			function()
				require("snipe-marks").open_marks_menu("all")
			end,
			desc = "Find all marks",
		},
	},
	config = function()
		require("snipe-lsp").setup({
			open_symbols_menu = "<leader>ds",
			open_symbols_menu_for_split = "<leader>sds",
			open_symbols_menu_for_vsplit = "<leader>vds",
		})
	end,

	opts = {
		hints = {
			dictionary = "qwertyuiop",
		},
	},
}
