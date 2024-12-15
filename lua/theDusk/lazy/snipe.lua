return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"£",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
	},

	opts = {
		hints = {
			dictionary = "1234567890",
		},
	},
}
