; extends

;; Ya tienes estas reglas
((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#set! injection.language "typescript"))

((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#set! injection.language "typescript"))

((inline) @injection.content
  (#lua-match? @injection.content "^<")
  (#set! injection.language "typescriptreact"))

;; NUEVO: inyección para contenido entre llaves (JS en expresiones)
((inline) @injection.content
  (#lua-match? @injection.content "^{.*}$")
  (#set! injection.language "javascript"))
