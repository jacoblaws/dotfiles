local plugin = {
	"stevearc/conform.nvim",
	lazy = true,
	cmd = "ConformInfo",
	event = "BufWritePre",
}

plugin.keys = {
	{
		"<leader>cf",
		function()
			require("conform").format()
		end,
		mode = { "n", "v" },
		desc = "Format",
	},
	{
		"<leader>cF",
		function()
			require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
		end,
		mode = { "n", "v" },
		desc = "Format injected langs",
	},
}

plugin.opts = {
	default_format_opts = {
		timeout_ms = 3000,
		async = false,
		quiet = false,
		lsp_format = "fallback",
	},

	formatters_by_ft = {
		nix = { "nixfmt" },
		lua = { "stylua" },
		rust = { "rustfmt" },
		toml = { "taplo" },
		python = { "ruff_format" },
	},

	formatters = {
		injected = { options = { ignore_errors = true } },
	},
}

plugin.config = function(_, opts)
	require("conform").setup(opts)
end

return plugin
