-- Dashboard configuration

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "󰑓  Restore session", ":lua require('persistence').load()<CR>"),
			dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = { " Loading plugins..." }

		alpha.setup(dashboard.opts)

		-- Autocmd: update footer after Lazy is done
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local plugins = stats.count
				local startup_time = math.floor(stats.startuptime * 100 + 0.5) / 100

				dashboard.section.footer.val = {
					"󱐋 Neovim loaded " .. plugins .. " plugins in " .. startup_time .. "ms",
				}

				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		dashboard.config.layout = {
			{ type = "padding", val = 18 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 2 },
			dashboard.section.footer,
		}

		alpha.setup(dashboard.opts)
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
					vim.schedule(function()
						require("alpha").start()
					end)
				end
			end,
		})
	end,
}
