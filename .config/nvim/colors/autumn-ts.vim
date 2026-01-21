if exists("g:colors_name")
  finish
endif

colorscheme autumn
let g:colors_name = "autumn-ts"



" ---------- Treesitter core ----------
hi! link @comment Comment
hi! link @string String
hi! link @number Number
hi! link @boolean Boolean
hi! link @constant Constant
hi! link @type Type
hi! link @variable Identifier
hi! link @variable.builtin Special
hi! link @function Function
hi! link @function.builtin Special
hi! link @keyword Keyword
hi! link @operator Operator
hi! link @punctuation Delimiter

" ---------- HTML ----------
hi! link @tag Tag
hi! link @tag.builtin Tag
hi! link @tag.delimiter Delimiter
hi! link @attribute Identifier

" ---------- JS / TS ----------
hi! link @property Identifier
hi! link @method Function
hi! link @constructor Type

" ---------- UI ----------
hi! link @text.title Title
hi! link @text.literal String

" ---------- LSP semantic tokens ----------
hi! link @lsp.type.function Function
hi! link @lsp.type.method Function
hi! link @lsp.type.variable Identifier
hi! link @lsp.type.parameter Identifier
hi! link @lsp.type.property Identifier
hi! link @lsp.type.keyword Keyword
hi! link @lsp.type.type Type
hi! link @lsp.type.class Type
hi! link @lsp.type.interface Type

