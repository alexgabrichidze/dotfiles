-- Telescope configuration

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				path_display = { "smart", "truncate" },
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		-- Load fzf-native extension
		telescope.load_extension("fzf")

		-- Keybindings
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recently Opened Files" })
		vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Telescope: Go to Definition" })
		vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Telescope: Go to Implementation" })
		vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions, { desc = "Telescope: Go to Type Definition" })
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Telescope: Find References" })
		vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Telescope: Document Symbols" })
		vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, { desc = "Telescope: Workspace Symbols" })
		vim.keymap.set(
			"n",
			"<leader>wd",
			builtin.lsp_dynamic_workspace_symbols,
			{ desc = "Telescope: Dynamic Workspace Symbols" }
		)
		vim.keymap.set("n", "<leader>dl", function()
			builtin.diagnostics({ bufnr = 0 })
		end, { desc = "Telescope: Buffer Diagnostics" })
		vim.keymap.set("n", "<leader>dd", builtin.diagnostics, { desc = "Telescope: Workspace Diagnostics" })

		-- Open Neovim config folder keybinding
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({
				prompt_title = "Find Config Files",
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "Find Files in config/" })
	end,
}
