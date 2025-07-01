-- Fidget.nvim configuration

return {
	"j-hui/fidget.nvim",
	tag = "legacy",
	config = function()
		require("fidget").setup({
			text = {
				spinner = "dots",
				done = "✔",
			},
			window = {
				blend = 0,
			},
			fmt = {
				leftpad = true,
			},
		})
	end,
}
