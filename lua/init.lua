require "configs.options"

-- Ensure packer compiled
local is_compiled = pcall(require, "packer_compiled")
if is_compiled then
  require "packer_compiled"
end

require "plugins"

require "lsp.init"

require "core.init"

require "core.line.lualine"

require "core.tools.init"

require "configs.keymaps"

require "configs.autocmd"
