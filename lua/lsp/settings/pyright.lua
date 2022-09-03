return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "workspace",
        inlayHints = {
          enable = true,
          variableTypes = true,
          functionReturnTypes = true,
        },
      },
    },
  },
}
