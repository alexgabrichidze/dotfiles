-- Gitsigns.nvim configuration

-- plugins/gitsigns.lua
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			follow_files = true,
		},
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		signs_staged_enable = true,
		trouble = true, -- auto integrate with trouble.nvim if available
		on_attach = function(bufnr)
			local gs = require("gitsigns")

			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			-- Hunk Navigation
			map("n", "]g", gs.next_hunk, "Next Hunk")
			map("n", "[g", gs.prev_hunk, "Previous Hunk")

			-- Actions
			map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
			map("v", "<leader>gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage Hunk (Visual)")
			map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
			map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
			map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, "Blame Line")
			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, "Diff With ~")
			map("n", "<leader>gsd", gs.diffthis, "Git: Diff This")
			map("n", "<leader>gsr", gs.reset_hunk, "Git: Reset Hunk")

			-- Toggles
			map("n", "<leader>gtb", gs.toggle_current_line_blame, "Toggle Line Blame")
			map("n", "<leader>gtw", gs.toggle_word_diff, "Toggle Word Diff")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")
		end,
	},
}
