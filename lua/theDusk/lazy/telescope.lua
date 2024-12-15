return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"jvgrootveld/telescope-zoxide", -- Add the zoxide plugin
	},

	config = function()
		local t = require("telescope")
		local z_utils = require("telescope._extensions.zoxide.utils")
		local builtin = require("telescope.builtin")

		t.setup({
			pickers = {
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--glob",
						"!.git",
						"--glob",
						"!node_modules/*",
						"--sortr",
						"modified",
					},
				},
			},
			defaults = {
				mappings = {
					n = {
						["j"] = "move_selection_next",
						["k"] = "move_selection_previous",
					},
					i = {
						["<Tab>"] = "move_selection_next",
						["~"] = "move_selection_previous",
						["<C-u>"] = false,
						["<C-h>"] = "which_key",
					},
				},
			},
			extensions = {
				zoxide = {
					prompt_title = "[ Walking on the shoulders of TJ ]",
					mappings = {
						default = {
							after_action = function(selection)
								print("Update to (" .. selection.z_score .. ") " .. selection.path)
							end,
						},
						["<C-s>"] = {
							before_action = function(selection)
								print("before C-s")
							end,
							action = function(selection)
								vim.cmd.edit(selection.path)
							end,
						},
						["<C-q>"] = { action = z_utils.create_basic_command("split") },
					},
				},
			},
		})

		-- Load the zoxide extension
		t.load_extension("zoxide")

		-- Key mappings for Telescope
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "find_files" })

		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "find git" })

		vim.keymap.set("n", "<leader>tp", function()
			require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))
		end, { desc = "picker dropdown" })

		vim.keymap.set("n", "<leader>tuc", function()
			local word = vim.fn.expand("<cword>") -- Get the word under the cursor
			require("telescope.builtin").grep_string({ search = word }) -- Search for the word using Telescope
		end, { desc = "word under cursor" })

		vim.keymap.set("n", "<leader>tg", function()
			require("telescope.builtin").live_grep() -- Let you enter a search term interactively
		end, { desc = "Live grep for a word" })

		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)

		vim.keymap.set("n", "<leader>fw", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)

		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

		vim.keymap.set("n", "<leader>td", function()
			builtin.diagnostics({ bufnr = 0 })
		end, { noremap = true, silent = true, desc = "find diagnostics" })

		vim.keymap.set("n", "<leader>tv", function()
			builtin.lsp_document_symbols({ bufnr = 0 })
		end, { noremap = true, silent = true, desc = "find documents" })

		vim.keymap.set("n", "<leader>tf", function()
			require("telescope.builtin").lsp_document_symbols({
				symbols = { "class", "function" }, -- Filter for class and function symbols
			})
		end, { desc = "Search for classes and functions in the document" })

		vim.keymap.set("n", "<leader>ti", function()
			builtin.lsp_implementations({ bufnr = 0 })
		end, { noremap = true, silent = true, desc = "find lsp_implementations under cursor" })

		vim.keymap.set("n", "<leader>tt", builtin.builtin, { desc = "search builtins" })

		vim.keymap.set("n", "<leader>tc", builtin.command_history, { desc = "search commands" })

		vim.keymap.set("n", "<leader>tm", builtin.marks, { desc = "search marks" })

		vim.keymap.set("n", "<leader>tn", builtin.treesitter, { desc = "search treesitter" })

		-- Key mapping for zoxide
		vim.keymap.set("n", "<leader>cd", t.extensions.zoxide.list, { desc = "Zoxide List" })
	end,
}
