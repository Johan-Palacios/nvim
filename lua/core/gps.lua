local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
  return
end

local icons = require "core.icons"

gps.setup {

  disable_icons = false,

  icons = {
    ["class-name"] = "%#CmpItemKindClass#" .. icons.kind.Class .. "%*" .. "",
    ["function-name"] = "%#CmpItemKindFunction#" .. icons.kind.Function .. "%*" .. "",
    ["method-name"] = "%#CmpItemKindMethod#" .. icons.kind.Method .. "%*" .. "",
    ["container-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. "",
    ["tag-name"] = "%#CmpItemKindKeyword#" .. icons.misc.Tag .. "%*" .. " ",
    ["mapping-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. "",
    ["sequence-name"] = "%CmpItemKindProperty#" .. icons.type.Array .. "%*" .. "",
    ["null-name"] = "%CmpItemKindField#" .. icons.kind.Field .. "%*" .. "",
    ["boolean-name"] = "%CmpItemKindValue#" .. icons.type.Boolean .. "%*" .. "",
    ["integer-name"] = "%CmpItemKindValue#" .. icons.type.Number .. "%*" .. "",
    ["float-name"] = "%CmpItemKindValue#" .. icons.type.Number .. "%*" .. "",
    ["string-name"] = "%CmpItemKindValue#" .. icons.type.String .. "%*" .. "",
    ["array-name"] = "%CmpItemKindProperty#" .. icons.type.Array .. "%*" .. "",
    ["object-name"] = "%CmpItemKindProperty#" .. icons.type.Object .. "%*" .. "",
    ["number-name"] = "%CmpItemKindValue#" .. icons.type.Number .. "%*" .. "",
    ["table-name"] = "%CmpItemKindProperty#" .. icons.ui.Table .. "%*" .. "",
    ["date-name"] = "%CmpItemKindValue#" .. icons.ui.Calendar .. "%*" .. "",
    ["date-time-name"] = "%CmpItemKindValue#" .. icons.ui.Table .. "%*" .. "",
    ["inline-table-name"] = "%CmpItemKindProperty#" .. icons.ui.Calendar .. "%*" .. "",
    ["time-name"] = "%CmpItemKindValue#" .. icons.misc.Watch .. "%*" .. "",
    ["module-name"] = "%CmpItemKindModule#" .. icons.kind.Module .. "%*" .. "",
  },

  separator = " " .. icons.ui.ChevronRight .. " ",
  depth = 0,
  depth_limit_indicator = "..",
  text_hl = "9095a2"
}
