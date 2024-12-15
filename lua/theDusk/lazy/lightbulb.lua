return {
	"kosayoda/nvim-lightbulb",
	config = function()
		require("nvim-lightbulb").setup({
			sign = {
				enabled = false,
			},
			virtual_text = {
				-- enabled = true,
			},
			float = {
				-- enabled = true,
			},
			line = {
				enabled = true,
			},
			autocmd = { enabled = true },
		})
	end,
}
