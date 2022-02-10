local M = {}
M.icons = {

	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Folder = "",
	Operator = "",
	Field = "",
	Buffer = "",
	EnumMember = "",
	Constant = "",
	Spell = "",
	Reference = "",
	TypeParameter = "",
	Struct = "",
}
function M.setup()
	local kinds = vim.lsp.protocol.CompletionItemKind
	for i, kind in ipairs(kinds) do
		kinds[i] = M.icons[kind] or kind
	end
end
return M
