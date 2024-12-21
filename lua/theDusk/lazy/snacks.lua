return {
	"folke/snacks.nvim",
	prilrity = 1000,
	lazy = false,
	opts = {
		dashboard = {},
		statuscolumn = {},
		zen = {},
		scope = {},
		toggle = {},
		lazygit = {},
		notifier = {},
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
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
	},
}
