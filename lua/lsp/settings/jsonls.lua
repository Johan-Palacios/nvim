local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
  return
end

return {
  init_options = {
    provideFormatter = false,
  },
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
}
