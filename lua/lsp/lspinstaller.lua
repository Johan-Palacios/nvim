local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("lsp.handler").on_attach,
		capabilities = require("lsp.handler").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("lsp.settings.sumneko")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "arduino_language_server" then
		opts.on_new_config = function(config, root_dir)
			local partial_cmd = server:get_default_options().cmd
			local MY_FQBN = "arduino:avr:nano"
			config.cmd = vim.list_extend(partial_cmd, { "-fqbn", MY_FQBN })
		end
	end
	server:setup(opts)
end)
