return {
	"kosayoda/nvim-lightbulb",
	config = function()
		require("nvim-lightbulb").setup({
			sign = {
				enabled = true,
			},
			autocmd = { enabled = true },
		})
	end,
}
