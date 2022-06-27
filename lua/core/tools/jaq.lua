require('jaq-nvim').setup{
	cmds = {
		default = "float",

		external = {
			typescript = "deno run %",
			javascript = "node %",
			markdown = "glow %",
			python = "python3 %",
			rust = "rustc % && ./$fileBase && rm $fileBase",
			cpp = "g++ % -o $fileBase && ./$fileBase",
			go = "go run %",
			sh = "sh %",
		},
		internal = {
			lua = "luafile %",
			vim = "source %"
		}
	},
	ui = {
		startinsert = false,
		wincmd      = false,
		float = {
			border    = "none",
			height    = 0.8,
			width     = 0.8,
			x         = 0.5,
			y         = 0.5,
			border_hl = "FloatBorder",
			float_hl  = "Normal",
			blend     = 0
		},
		terminal = {
			position = "bot",
			line_no = false,
			size     = 10
		},
		toggleterm = {
			position = "horizontal",
			size     = 10
		},
		quickfix = {
			position = "bot",
			size     = 10
		}
	}
}
