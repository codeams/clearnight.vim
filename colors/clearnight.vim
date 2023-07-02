" vim:fdm=marker
" Vim Color File
" Name: clearnight.vim
" Maintainer: https://github.com/codeams/clearnight.vim
" License: The MIT License (MIT)
" Forked From: https://github.com/drewtempelmeyer/palenight.vim
" Which Is Based On: https://github.com/joshdick/onedark.vim

" Initialization {{{

highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256

let g:colors_name="clearnight"

" Set to "256" for 256-color terminals, or
" set to "16" to use your terminal emulator's native colors
" (a 16-color palette for this color scheme is available; see
" < https://github.com/joshdick/onedark.vim/blob/master/README.md >
" for more information.)
if !exists("g:clearnight_termcolors")
  let g:clearnight_termcolors = 256
endif

if !exists("g:clearnight_terminal_italics")
  let g:clearnight_terminal_italics = 1
endif

" This function is based on one from FlatColor: https://github.com/MaxSt/FlatColor/
" Which in turn was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:clearnight_terminal_italics == 0
    if has_key(a:style, "cterm") && a:style["cterm"] == "italic"
      unlet a:style.cterm
    endif
    if has_key(a:style, "gui") && a:style["gui"] == "italic"
      unlet a:style.gui
    endif
  endif
  if g:clearnight_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  endif
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" public {{{

function! clearnight#set_highlight(group, style)
  call s:h(a:group, a:style)
endfunction

" }}}

" }}}

" Color Variables {{{

let s:colors = clearnight#GetColors()

let s:red = s:colors.red
let s:light_red = s:colors.light_red
let s:dark_red = s:colors.dark_red
let s:green = s:colors.green
let s:yellow = s:colors.yellow
let s:dark_yellow = s:colors.dark_yellow
let s:blue = s:colors.blue
let s:purple = s:colors.purple
let s:blue_purple = s:colors.blue_purple
let s:cyan = s:colors.cyan
let s:white = s:colors.white
let s:black = s:colors.black
let s:visual_black = s:colors.visual_black " Black out selected text in 16-color visual mode
let s:comment_grey = s:colors.comment_grey
let s:gutter_fg_grey = s:colors.gutter_fg_grey
let s:cursor_grey = s:colors.cursor_grey
let s:visual_grey = s:colors.visual_grey
let s:menu_grey = s:colors.menu_grey
let s:special_grey = s:colors.special_grey
let s:vertsplit = s:colors.vertsplit
let s:white_mask_3 = s:colors.white_mask_3

" }}}

" Syntax Groups (descriptions and ordering from `:h w18`) {{{

call s:h("Comment", { "fg": s:comment_grey, "gui": "italic", "cterm": "italic" }) " any comment
call s:h("Constant", { "fg": s:cyan }) " any constant
call s:h("String", { "fg": s:green }) " a string constant: "this is a string"
call s:h("Character", { "fg": s:green }) " a character constant: 'c', '\n'
call s:h("Number", { "fg": s:dark_yellow }) " a number constant: 234, 0xff
call s:h("Boolean", { "fg": s:red }) " a boolean constant: TRUE, false
call s:h("Float", { "fg": s:dark_yellow }) " a floating point constant: 2.3e10
call s:h("Identifier", { "fg": s:red, "gui": "italic" }) " any variable name
call s:h("Function", { "fg": s:blue }) " function name (also: methods for classes)
call s:h("Statement", { "fg": s:purple }) " any statement
call s:h("Conditional", { "fg": s:purple, "gui": "italic" }) " if, then, else, endif, switch, etc.
call s:h("Repeat", { "fg": s:purple }) " for, do, while, etc.
call s:h("Label", { "fg": s:purple }) " case, default, etc.
call s:h("Operator", { "fg": s:cyan }) " sizeof", "+", "*", etc.
call s:h("Keyword", { "fg": s:red, "gui": "italic" }) " any other keyword
call s:h("Exception", { "fg": s:purple }) " try, catch, throw
call s:h("PreProc", { "fg": s:yellow }) " generic Preprocessor
call s:h("Include", { "fg": s:blue }) " preprocessor #include
call s:h("Define", { "fg": s:purple }) " preprocessor #define
call s:h("Macro", { "fg": s:purple }) " same as Define
call s:h("PreCondit", { "fg": s:yellow }) " preprocessor #if, #else, #endif, etc.
call s:h("Type", { "fg": s:yellow, "gui": "italic" }) " int, long, char, etc.
call s:h("StorageClass", { "fg": s:yellow, "gui": "italic" }) " static, register, volatile, etc.
call s:h("Structure", { "fg": s:yellow }) " struct, union, enum, etc.
call s:h("Typedef", { "fg": s:yellow }) " A typedef
call s:h("Special", { "fg": s:blue }) " any special symbol
call s:h("SpecialChar", {}) " special character in a constant
call s:h("Tag", {}) " you can use CTRL-] on this
call s:h("Delimiter", {}) " character that needs attention
call s:h("SpecialComment", { "fg": s:comment_grey }) " special things inside a comment
call s:h("Debug", {}) " debugging statements
call s:h("Underlined", { "gui": "underline", "cterm": "underline" }) " text that stands out, HTML links
call s:h("Ignore", {}) " left blank, hidden
call s:h("Error", { "fg": s:red, "gui": "italic" }) " any erroneous construct
call s:h("Todo", { "fg": s:purple }) " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

" }}}

" Highlighting Groups (descriptions and ordering from `:h hitest.vim`) {{{

call s:h("ColorColumn", { "bg": s:cursor_grey }) " used for the columns set with 'colorcolumn'
call s:h("Conceal", {}) " placeholder characters substituted for concealed text (see 'conceallevel')
call s:h("Cursor", { "fg": s:black, "bg": s:blue }) " the character under the cursor
call s:h("CursorIM", {}) " like Cursor, but used when in IME mode
call s:h("CursorColumn", { "bg": s:cursor_grey }) " the screen column that the cursor is in when 'cursorcolumn' is set
call s:h("CursorLine", { "bg": s:cursor_grey }) " the screen line that the cursor is in when 'cursorline' is set
call s:h("Directory", { "fg": s:blue }) " directory names (and other special names in listings)
call s:h("DiffAdd", { "bg": s:green, "fg": s:black }) " diff mode: Added line
call s:h("DiffChange", { "bg": s:yellow, "fg": s:black }) " diff mode: Changed line
call s:h("DiffDelete", { "bg": s:red, "fg": s:black }) " diff mode: Deleted line
call s:h("DiffText", { "bg": s:black, "fg": s:yellow }) " diff mode: Changed text within a changed line
call s:h("ErrorMsg", { "fg": s:red }) " error messages on the command line
call s:h("VertSplit", { "fg": s:vertsplit }) " the column separating vertically split windows
call s:h("Folded", { "bg": s:cursor_grey, "fg": s:comment_grey }) " line used for closed folds
call s:h("FoldColumn", {}) " 'foldcolumn'
call s:h("SignColumn", {}) " column where signs are displayed
call s:h("IncSearch", { "fg": s:yellow, "bg": s:comment_grey }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("LineNr", { "fg": s:gutter_fg_grey }) " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("CursorLineNr", {}) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h("MatchParen", { "fg": s:blue, "gui": "underline" }) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h("ModeMsg", {}) " 'showmode' message (e.g., "-- INSERT --")
call s:h("MoreMsg", {}) " more-prompt
call s:h("NonText", { "fg": s:special_grey }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Normal", { "fg": s:cyan }) " normal text
call s:h("Pmenu", { "fg": s:purple, "bg": s:menu_grey }) " Popup menu: normal item.
call s:h("PmenuSel", { "fg": s:black, "bg": s:blue }) " Popup menu: selected item.
call s:h("PmenuSbar", { "bg": s:special_grey }) " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:white }) " Popup menu: Thumb of the scrollbar.
call s:h("Question", { "fg": s:purple }) " hit-enter prompt and yes/no questions
call s:h("Search", { "fg": s:black, "bg": s:yellow }) " Last search pattern highlighting (see 'hlsearch'). Also used for highlighting the current line in the quickfix window and similar items that need to stand out.
call s:h("SpecialKey", { "fg": s:special_grey }) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad", { "fg": s:red, "gui": "underline", "cterm": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h("SpellCap", { "fg": s:dark_yellow }) " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:h("SpellLocal", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h("SpellRare", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("StatusLine", { "fg": s:white, "bg": s:cursor_grey }) " status line of current window
call s:h("StatusLineNC", { "fg": s:comment_grey }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("TabLine", { "fg": s:comment_grey }) " tab pages line, not active tab page label
call s:h("TabLineFill", {}) " tab pages line, where there are no labels
call s:h("TabLineSel", { "fg": s:purple }) " tab pages line, active tab page label
call s:h("Title", { "fg": s:green }) " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "fg": s:visual_black, "bg": s:visual_grey }) " Visual mode selection
call s:h("VisualNOS", { "bg": s:visual_grey }) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg", { "fg": s:yellow }) " warning messages
call s:h("WildMenu", { "fg": s:black, "bg": s:blue }) " current match in 'wildmenu' completion

" }}}

" Language-Specific Highlighting {{{

" Dockerfile
call s:h("dockerfileKeyword", { "fg": s:purple })

" Shell
call s:h("shSet", { "fg": s:cyan })
call s:h("shSetOption", { "fg": s:white })
call s:h("shStatement", { "fg": s:cyan })
call s:h("shFunctionKey", { "fg": s:purple })

" CSS
call s:h("cssAttrComma", { "fg": s:purple })
call s:h("cssAttributeSelector", { "fg": s:green })
call s:h("cssBraces", { "fg": s:white })
call s:h("cssClassName", { "fg": s:dark_yellow })
call s:h("cssClassNameDot", { "fg": s:dark_yellow })
call s:h("cssDefinition", { "fg": s:purple })
call s:h("cssFontAttr", { "fg": s:dark_yellow })
call s:h("cssFontDescriptor", { "fg": s:purple })
call s:h("cssFunctionName", { "fg": s:blue })
call s:h("cssIdentifier", { "fg": s:blue })
call s:h("cssImportant", { "fg": s:purple })
call s:h("cssInclude", { "fg": s:white })
call s:h("cssIncludeKeyword", { "fg": s:purple })
call s:h("cssMediaType", { "fg": s:dark_yellow })
call s:h("cssProp", { "fg": s:white })
call s:h("cssPseudoClassId", { "fg": s:dark_yellow })
call s:h("cssSelectorOp", { "fg": s:purple })
call s:h("cssSelectorOp2", { "fg": s:purple })
call s:h("cssTagName", { "fg": s:red })

" Go
call s:h("goDeclaration", { "fg": s:purple })

" HTML
call s:h("htmlTitle", { "fg": s:white })
call s:h("htmlArg", { "fg": s:yellow })
call s:h("htmlEndTag", { "fg": s:cyan })
call s:h("htmlH1", { "fg": s:white })
call s:h("htmlLink", { "fg": s:purple })
call s:h("htmlSpecialChar", { "fg": s:dark_yellow })
call s:h("htmlSpecialTagName", { "fg": s:red })
call s:h("htmlTagName", { "fg": s:red })

" Coffeescript
" call s:h("coffeeExtendedOp", { "fg": s:purple })

" TypeScript
" call s:h("typescriptCallImpl", { "fg": s:cyan })
" call s:h("typescriptReserved", { "fg": s:red })
" call s:h("typescriptEndColons", { "fg": s:red })
" call s:h("typescriptSymbols", { "fg": s:red })
" call s:h("typescriptBraces", { "fg": s:red })
" call s:h("typescriptParens", { "fg": s:red })
" call s:h("typescriptComment", { "fg": s:red })
" call s:h("typescriptLineComment", { "fg": s:red })
" call s:h("typescriptDocComment", { "fg": s:red })
" call s:h("typescriptCommentTodo", { "fg": s:red })
" call s:h("typescriptMagicComment", { "fg": s:red })
" call s:h("typescriptRef", { "fg": s:red })
" call s:h("typescriptDocNotation", { "fg": s:red })
" call s:h("typescriptDocTags", { "fg": s:red })
" call s:h("typescriptDocNGParam", { "fg": s:red })
" call s:h("typescriptDocParam", { "fg": s:red })
" call s:h("typescriptDocNumParam", { "fg": s:red })
" call s:h("typescriptDocEventRef", { "fg": s:red })
" call s:h("typescriptDocNamedParamType", { "fg": s:red })
" call s:h("typescriptDocParamName", { "fg": s:red })
" call s:h("typescriptDocParamType", { "fg": s:red })
" call s:h("typescriptString", { "fg": s:red })
" call s:h("typescriptSpecial", { "fg": s:red })
" call s:h("typescriptStringLiteralType", { "fg": s:red })
" call s:h("typescriptTemplateLiteralType", { "fg": s:red })
" call s:h("typescriptStringMember", { "fg": s:red })
" call s:h("typescriptTemplate", { "fg": s:red })
" call s:h("typescriptEventString", { "fg": s:red })
" call s:h("typescriptDestructureString", { "fg": s:red })
" call s:h("typescriptASCII", { "fg": s:red })
" call s:h("typescriptTemplateSB", { "fg": s:red })
" call s:h("typescriptRegexpString", { "fg": s:red })
" call s:h("typescriptGlobal", { "fg": s:red })
" call s:h("typescriptTestGlobal", { "fg": s:red })
" call s:h("typescriptPrototype", { "fg": s:red })
" call s:h("typescriptConditional", { "fg": s:red })
" call s:h("typescriptConditionalElse", { "fg": s:red })
" call s:h("typescriptCase", { "fg": s:red })
" call s:h("typescriptDefault", { "fg": s:red })
" call s:h("typescriptBranch", { "fg": s:red })
" call s:h("typescriptIdentifier", { "fg": s:red })
" call s:h("typescriptVariable", { "fg": s:red })
" call s:h("typescriptDestructureVariable", { "fg": s:red })
" call s:h("typescriptEnumKeyword", { "fg": s:red })
" call s:h("typescriptRepeat", { "fg": s:red })
" call s:h("typescriptForOperator", { "fg": s:red })
" call s:h("typescriptStatementKeyword", { "fg": s:red })
" call s:h("typescriptMessage", { "fg": s:red })
" call s:h("typescriptOperator", { "fg": s:red })
" call s:h("typescriptKeywordOp", { "fg": s:red })
" call s:h("typescriptCastKeyword", { "fg": s:red })
" call s:h("typescriptType", { "fg": s:red })
" call s:h("typescriptNull", { "fg": s:red })
" call s:h("typescriptNumber", { "fg": s:red })
" call s:h("typescriptBoolean", { "fg": s:red })
" call s:h("typescriptObjectLabel", { "fg": s:red })
" call s:h("typescriptDestructureLabel", { "fg": s:red })
" call s:h("typescriptLabel", { "fg": s:red })
" call s:h("typescriptTupleLable", { "fg": s:red })
" call s:h("typescriptStringProperty", { "fg": s:red })
" call s:h("typescriptImport", { "fg": s:red })
" call s:h("typescriptImportType", { "fg": s:red })
" call s:h("typescriptAmbientDeclaration", { "fg": s:red })
" call s:h("typescriptExport", { "fg": s:red })
" call s:h("typescriptExportType", { "fg": s:red })
" call s:h("typescriptModule", { "fg": s:red })
" call s:h("typescriptTry", { "fg": s:red })
" call s:h("typescriptExceptions", { "fg": s:red })
" call s:h("typescriptMember", { "fg": s:red })
" call s:h("typescriptMethodAccessor", { "fg": s:red })
" call s:h("typescriptAsyncFuncKeyword", { "fg": s:red })
" call s:h("typescriptObjectAsyncKeyword", { "fg": s:red })
" call s:h("typescriptAsyncFor", { "fg": s:red })
" call s:h("typescriptFuncKeyword", { "fg": s:red })
" call s:h("typescriptAsyncFunc", { "fg": s:red })
" call s:h("typescriptArrowFunc", { "fg": s:red })
" call s:h("typescriptFuncName", { "fg": s:red })
" call s:h("typescriptFuncArg", { "fg": s:red })
" call s:h("typescriptArrowFuncArg", { "fg": s:red })
" call s:h("typescriptFuncComma", { "fg": s:red })
" call s:h("typescriptClassKeyword", { "fg": s:red })
" call s:h("typescriptClassExtends", { "fg": s:red })
" call s:h("typescriptAbstract", { "fg": s:red })
" call s:h("typescriptClassStatic", { "fg": s:red })
" call s:h("typescriptReadonlyModifier", { "fg": s:red })
" call s:h("typescriptInterfaceKeyword", { "fg": s:red })
" call s:h("typescriptInterfaceExtends", { "fg": s:red })
" call s:h("typescriptInterfaceName", { "fg": s:red })
" call s:h("shellbang", { "fg": s:red })
" call s:h("typescriptTypeParameter", { "fg": s:red })
" call s:h("typescriptConstraint", { "fg": s:red })
" call s:h("typescriptPredefinedType", { "fg": s:red })
" call s:h("typescriptReadonlyArrayKeyword", { "fg": s:red })
" call s:h("typescriptUnion", { "fg": s:red })
" call s:h("typescriptFuncTypeArrow", { "fg": s:red })
" call s:h("typescriptConstructorType", { "fg": s:red })
" call s:h("typescriptTypeQuery", { "fg": s:red })
" call s:h("typescriptAccessibilityModifier", { "fg": s:red })
" call s:h("typescriptOptionalMark", { "fg": s:red })
" call s:h("typescriptFuncType", { "fg": s:red })
" call s:h("typescriptMappedIn", { "fg": s:red })
" call s:h("typescriptCall", { "fg": s:red })
" call s:h("typescriptParamImpl", { "fg": s:red })
" call s:h("typescriptConstructSignature", { "fg": s:red })
" call s:h("typescriptAliasDeclaration", { "fg": s:red })
" call s:h("typescriptAliasKeyword", { "fg": s:red })
" call s:h("typescriptUserDefinedType", { "fg": s:red })
" call s:h("typescriptTypeReference", { "fg": s:red })
" call s:h("typescriptConstructor", { "fg": s:red })
" call s:h("typescriptDecorator", { "fg": s:red })
" call s:h("typescriptAssertType", { "fg": s:red })

" JavaScript
" call s:h("javaScriptBraces", { "fg": s:white })
" call s:h("javaScriptFunction", { "fg": s:purple })
" call s:h("javaScriptIdentifier", { "fg": s:purple })
" call s:h("javaScriptNull", { "fg": s:dark_yellow })
" call s:h("javaScriptNumber", { "fg": s:dark_yellow })
" call s:h("javaScriptRequire", { "fg": s:cyan })
" call s:h("javaScriptReserved", { "fg": s:purple })
" " https://github.com/pangloss/vim-javascript
" call s:h("jsArrowFunction", { "fg": s:purple })
" call s:h("jsClassKeyword", { "fg": s:purple })
" call s:h("jsClassDefinition", { "fg": s:yellow })
" call s:h("jsClassMethodType", { "fg": s:purple })
" call s:h("jsClassFuncName", { "fg": s:blue })
" call s:h("jsDestructuringBlock", { "fg": s:blue })
" call s:h("jsDocParam", { "fg": s:blue })
" call s:h("jsDocTags", { "fg": s:purple })
" call s:h("jsExport", { "fg": s:purple })
" call s:h("jsExportDefault", { "fg": s:red })
" call s:h("jsExtendsKeyword", { "fg": s:purple })
" call s:h("jsConditional", { "fg": s:purple })
" call s:h("jsOperator", { "fg": s:purple })
" call s:h("jsFrom", { "fg": s:purple })
" call s:h("jsFuncArgs", { "fg": s:blue })
" call s:h("jsFuncCall", { "fg": s:blue })
" call s:h("jsFuncName", { "fg": s:blue })
" call s:h("jsObjectProp", { "fg": s:cyan })
" call s:h("jsFunction", { "fg": s:purple })
" call s:h("jsGenerator", { "fg": s:yellow })
" call s:h("jsGlobalObjects", { "fg": s:yellow })
" call s:h("jsImport", { "fg": s:purple })
" call s:h("jsModuleAs", { "fg": s:purple })
" call s:h("jsModuleWords", { "fg": s:purple })
" call s:h("jsModuleKeyword", { "fg": s:blue })
" call s:h("jsModules", { "fg": s:purple })
" call s:h("jsNull", { "fg": s:dark_yellow })
" call s:h("jsStorageClass", { "fg": s:purple })
" call s:h("jsSuper", { "fg": s:red })
" call s:h("jsTemplateBraces", { "fg": s:dark_red })
" call s:h("jsTemplateVar", { "fg": s:green })
" call s:h("jsThis", { "fg": s:red })
" call s:h("jsUndefined", { "fg": s:dark_yellow })
" " call s:h("jsVariableDef", { "fg": s:blue })
" " https://github.com/othree/yajs.vim
" call s:h("javascriptArrowFunc", { "fg": s:purple })
" call s:h("javascriptClassExtends", { "fg": s:purple })
" call s:h("javascriptClassKeyword", { "fg": s:purple })
" call s:h("javascriptDocNotation", { "fg": s:purple })
" call s:h("javascriptDocParamName", { "fg": s:blue })
" call s:h("javascriptDocTags", { "fg": s:purple })
" call s:h("javascriptEndColons", { "fg": s:white })
" call s:h("javascriptExport", { "fg": s:purple })
" call s:h("javascriptFuncArg", { "fg": s:white })
" call s:h("javascriptFuncKeyword", { "fg": s:purple })
" call s:h("javascriptIdentifier", { "fg": s:red })
" call s:h("javascriptImport", { "fg": s:purple })
" call s:h("javascriptMethodName", { "fg": s:white })
" call s:h("javascriptObjectLabel", { "fg": s:white })
" call s:h("javascriptOpSymbol", { "fg": s:cyan })
" call s:h("javascriptOpSymbols", { "fg": s:cyan })
" call s:h("javascriptPropertyName", { "fg": s:green })
" call s:h("javascriptTemplateSB", { "fg": s:dark_red })
" call s:h("javascriptVariable", { "fg": s:purple })

" JSON
call s:h("jsonCommentError", { "fg": s:white })
call s:h("jsonKeyword", { "fg": s:blue })
call s:h("jsonBoolean", { "fg": s:red })
call s:h("jsonNumber", { "fg": s:dark_yellow })
call s:h("jsonQuote", { "fg": s:white })
call s:h("jsonMissingCommaError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNoQuotesError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNumError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonString", { "fg": s:green })
call s:h("jsonStringSQError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonSemicolonError", { "fg": s:red, "gui": "reverse" })

" Markdown
call s:h("markdownCode", { "fg": s:green })
call s:h("markdownLinkReference", { "fg": s:comment_grey })
call s:h("markdownJekyllFrontMatter", { "fg": s:comment_grey })
call s:h("markdownCodeBlock", { "fg": s:green })
call s:h("markdownCodeDelimiter", { "fg": s:green })
call s:h("markdownHeadingDelimiter", { "fg": s:red })
call s:h("markdownRule", { "fg": s:comment_grey })
call s:h("markdownHeadingRule", { "fg": s:comment_grey })
call s:h("htmlH1", { "fg": s:blue })
call s:h("htmlH2", { "fg": s:blue })
call s:h("htmlH3", { "fg": s:blue })
call s:h("htmlH4", { "fg": s:blue })
call s:h("htmlH5", { "fg": s:blue })
call s:h("htmlH6", { "fg": s:blue })
call s:h("mkdDelimiter", { "fg": s:cyan })
call s:h("markdownId", { "fg": s:purple })
call s:h("markdownBlockquote", { "fg": s:comment_grey })
call s:h("markdownItalic", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
call s:h("mkdBold", { "fg": s:yellow, "gui": "bold", "cterm": "bold" })
call s:h("mkdInlineURL", { "fg": s:light_red })
call s:h("mkdListItem", { "fg": s:yellow })
call s:h("markdownOrderedListMarker", { "fg": s:red })
call s:h("markdownIdDeclaration", { "fg": s:blue })
call s:h("mkdLink", { "fg": s:white })
call s:h("markdownLinkDelimiter", { "fg": s:white })
call s:h("mkdURL", { "fg": s:light_red })

" Ruby
call s:h("rubyAccess", { "fg": s:cyan })
call s:h("rubyBlockParameter", { "fg": s:yellow})
call s:h("rubyBlockParameterList", { "fg": s:white })
call s:h("rubyBoolean", { "fg": s:red })
call s:h("rubyCapitalizedMethod", { "fg": s:blue})
call s:h("rubyClass", { "fg": s:purple})
call s:h("rubyClassName", { "fg": s:yellow })
call s:h("rubyConstant", { "fg": s:yellow })
call s:h("rubyControl", { "fg": s:purple })
call s:h("rubyEscape", { "fg": s:red})
call s:h("rubyFunction", { "fg": s:blue})
call s:h("rubyGlobalVariable", { "fg": s:red})
call s:h("rubyInclude", { "fg": s:cyan})
call s:h("rubyIncluderubyGlobalVariable", { "fg": s:red})
call s:h("rubyInstanceVariable", { "fg": s:red})
call s:h("rubyInterpolation", { "fg": s:cyan })
call s:h("rubyInterpolationDelimiter", { "fg": s:red })
call s:h("rubyModuleName", { "fg": s:white })
call s:h("rubyKeyword", { "fg": s:purple })
call s:h("rubyKeywordAsMethod", { "fg": s:cyan})
call s:h("rubyOperator", { "fg": s:purple })
call s:h("rubyPredefinedConstant", { "fg": s:yellow})
call s:h("rubyPseudoVariable", { "fg": s:blue })
call s:h("rubyRegexp", { "fg": s:white})
call s:h("rubyRegexpDelimiter", { "fg": s:cyan})
call s:h("rubySharpBang", { "fg": s:comment_grey})
call s:h("rubyStringDelimiter", { "fg": s:green})
call s:h("rubySymbol", { "fg": s:blue})

" ERb
call s:h("erubyDelimiter", { "fg": s:red })

" Rails
call s:h("railsAssetPreProc", { "fg": s:comment_grey })
call s:h("railsAssetInclude", { "fg": s:comment_grey })
call s:h("railsAssetIncluded", { "fg": s:comment_grey })
call s:h("rubyRailsMethod", { "fg": s:blue })
call s:h("rubyRailsFilterMethod", { "fg": s:cyan })
call s:h("rubyRailsRenderMethod", { "fg": s:cyan })
call s:h("rubyRailsARAssociationMethod", { "fg": s:cyan })
call s:h("rubyRailsHelperMethod", { "fg": s:cyan })

" RSpec
call s:h("rspecGroupMethods", { "fg": s:white })
call s:h("rspecBeforeAndAfter", { "fg": s:white })

" CSS
call s:h("cssColor", { "fg": s:dark_yellow })
call s:h("cssCommonAttr", { "fg": s:blue })
call s:h("cssProp", { "fg": s:cyan })
call s:h("cssSelectorOp", { "fg": s:white })
call s:h("cssUnitDecorators", { "fg": s:yellow })

" Sass
" https://github.com/tpope/vim-haml
call s:h("sassAmpersand", { "fg": s:red })
call s:h("sassClass", { "fg": s:dark_yellow })
call s:h("sassControl", { "fg": s:purple })
call s:h("sassExtend", { "fg": s:purple })
call s:h("sassFor", { "fg": s:white })
call s:h("sassFunction", { "fg": s:cyan })
call s:h("sassId", { "fg": s:blue })
call s:h("sassInclude", { "fg": s:purple })
call s:h("sassMedia", { "fg": s:purple })
call s:h("sassMediaOperators", { "fg": s:white })
call s:h("sassMixin", { "fg": s:purple })
call s:h("sassMixinName", { "fg": s:blue })
call s:h("sassMixing", { "fg": s:purple })
call s:h("sassVariable", { "fg": s:dark_yellow })
" https://github.com/cakebaker/scss-syntax.vim
call s:h("scssExtend", { "fg": s:purple })
call s:h("scssExtendedSelector", { "fg": s:dark_yellow })
call s:h("scssFunctionName", { "fg": s:cyan })
call s:h("scssImport", { "fg": s:purple })
call s:h("scssInclude", { "fg": s:purple })
call s:h("scssMixin", { "fg": s:purple })
call s:h("scssMixinName", { "fg": s:blue })
call s:h("scssSelectorName", { "fg": s:yellow })
call s:h("scssVariable", { "fg": s:dark_yellow })

" XML
call s:h("xmlAttrib", { "fg": s:yellow })
call s:h("xmlEndTag", { "fg": s:red })
call s:h("xmlTag", { "fg": s:red })
call s:h("xmlTagName", { "fg": s:red })

" PHP
call s:h("phpInclude", { "fg": s:purple })
call s:h("phpClass", { "fg": s:yellow })
call s:h("phpClasses", { "fg": s:yellow })
call s:h("phpFunction", { "fg": s:blue })
call s:h("phpType", { "fg": s:purple })
call s:h("phpKeyword", { "fg": s:purple })
call s:h("phpVarSelector", { "fg": s:white })
call s:h("phpIdentifier", { "fg": s:white })
call s:h("phpMethod", { "fg": s:blue })
call s:h("phpBoolean", { "fg": s:blue })
call s:h("phpParent", { "fg": s:white })
call s:h("phpOperator", { "fg": s:purple })
call s:h("phpRegion", { "fg": s:purple })
call s:h("phpUseNamespaceSeparator", { "fg": s:white })
call s:h("phpClassNamespaceSeparator", { "fg": s:white })
call s:h("phpDocTags", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
call s:h("phpDocParam", { "fg": s:purple, "gui": "italic", "cterm": "italic" })

" Dart
call s:h("dartLibrary", { "fg": s:purple})
call s:h("dartTypedef", { "fg": s:purple})
call s:h("dartClassDecl", { "fg": s:purple})
call s:h("dartCoreType", { "fg": s:purple})
call s:h("dartStorageClass", { "fg": s:purple})
call s:h("dartOperator", { "fg": s:purple})
call s:h("dartMetadata", { "fg": s:purple})
call s:h("dartKeyword", { "fg": s:purple})

" }}}

" Plugin Highlighting {{{

" airblade/vim-gitgutter
hi link GitGutterAdd    SignifySignAdd
hi link GitGutterChange SignifySignChange
hi link GitGutterDelete SignifySignDelete

" tpope/vim-fugitive
call s:h("diffAdded", { "fg": s:green })
call s:h("diffRemoved", { "fg": s:red })

" termdebug
call s:h("debugBreakpoint", { "fg": s:blue_purple })
call s:h("debugPC", { "bg": s:blue_purple, "fg": s:black })

" if has("nvim")
  " call s:h("@annotation", { "fg": s:yellow })
  " call s:h("@attribute", { "fg": s:light_red })
  " call s:h("@boolean", { "fg": s:red, "gui": "italic" })
  " call s:h("@character", { "fg": s:green })
  " call s:h("@character.special", { "fg": s:blue_purple })
  " call s:h("@comment", { "fg": s:comment_grey, "gui": "italic" })
  " call s:h("@conditional", { "fg": s:purple, "gui": "italic" })
  " call s:h("@constant", { "fg": s:cyan })
  " call s:h("@constant.builtin", { "fg": s:yellow })
  " call s:h("@constant.macro", { "fg": s:dark_yellow })
  " call s:h("@constructor", { "fg": s:white, "gui": "italic" })
  " call s:h("@define", { "fg": s:purple })
  " call s:h("@exception", { "fg": s:purple })
  " call s:h("@field", { "fg": s:cyan })
  " call s:h("@float", { "fg": s:dark_yellow })
  " call s:h("@function", { "fg": s:blue, "gui": "italic" })
  " call s:h("@function.builtin", { "fg": s:cyan })
  " call s:h("@function.call", { "fg": s:blue })
  " call s:h("@function.macro", { "fg": s:purple, "gui": "italic" })
  " call s:h("@include", { "fg": s:blue })
  " call s:h("@keyword", { "fg": s:red, "gui": "italic" })
  " call s:h("@keyword.function", { "fg": s:blue_purple, "gui": "italic" })
  " call s:h("@keyword.operator", { "fg": s:white })
  " call s:h("@keyword.return", { "fg": s:red, "gui": "italic" })
  " call s:h("@label", { "fg": s:purple })
  " call s:h("@method", { "fg": s:blue })
  " call s:h("@method.call", { "fg": s:blue })
  " call s:h("@namespace", { "fg": s:blue_purple })
  " call s:h("@number", { "fg": s:dark_yellow })
  " call s:h("@operator", { "fg": s:white })
  " call s:h("@parameter", { "fg": s:white, "gui": "italic" })
  " call s:h("@parameter.reference", { "fg": s:menu_grey })
  " call s:h("@property", { "fg": s:cyan })
  " call s:h("@punctuation.bracket", { "fg": s:white })
  " call s:h("@punctuation.delimiter", { "fg": s:white })
  " call s:h("@punctuation.special", { "fg": s:white })
  " call s:h("@repeat", { "fg": s:purple })
  " call s:h("@storageclass", { "fg": s:yellow, "gui": "italic" })
  " call s:h("@string", { "fg": s:green })
  " call s:h("@string.escape", { "fg": s:visual_grey })
  " call s:h("@string.regex", { "fg": s:white })
  " call s:h("@string.special", { "fg": s:menu_grey })
  " call s:h("@symbol", { "fg": s:red, "gui": "italic" })
  " call s:h("@tag", { "fg": s:light_red })
  " call s:h("@tag.attribute", { "fg": s:green })
  " call s:h("@tag.delimiter", { "fg": s:white })
  " call s:h("@text.danger", { "fg": s:dark_yellow })
  " call s:h("@text.emphasis", { "gui": "italic" })
  " call s:h("@text.environment", { "fg": s:light_red })
  " call s:h("@text.environment.name", { "fg": s:cyan })
  " call s:h("@text.literal", { "fg": s:yellow })
  " call s:h("@text.reference", { "fg": s:cyan })
  " call s:h("@text.strike", { "gui": "strikethrough" })
  " call s:h("@text.strong", { "gui": "bold" })
  " call s:h("@text.title", { "fg": s:yellow, "gui": "bold" })
  " call s:h("@text.underline", { "gui": "underline" })
  " call s:h("@text.warning", { "fg": s:yellow })
  " call s:h("@text.todo", { "fg": s:purple })
  " call s:h("@type", { "fg": s:yellow, "gui": "italic" })
  " call s:h("@type.builtin", { "fg": s:dark_yellow })
  " call s:h("@type.qualifier", { "fg": s:yellow })
  " call s:h("@variable", { "fg": s:white, "gui": "italic" })
  " call s:h("@variable.builtin", { "fg": s:dark_yellow })
" endif

" }}}

" Git Highlighting {{{

call s:h("gitcommitComment", { "fg": s:comment_grey })
call s:h("gitcommitUnmerged", { "fg": s:green })
call s:h("gitcommitOnBranch", {})
call s:h("gitcommitBranch", { "fg": s:purple })
call s:h("gitcommitDiscardedType", { "fg": s:red })
call s:h("gitcommitSelectedType", { "fg": s:green })
call s:h("gitcommitHeader", {})
call s:h("gitcommitUntrackedFile", { "fg": s:cyan })
call s:h("gitcommitDiscardedFile", { "fg": s:red })
call s:h("gitcommitSelectedFile", { "fg": s:green })
call s:h("gitcommitUnmergedFile", { "fg": s:yellow })
call s:h("gitcommitFile", {})
call s:h("gitcommitSummary", { "fg": s:white })
call s:h("gitcommitOverflow", { "fg": s:red })
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" }}}

" Setup Terminal Colors {{{

if has("nvim")
  let g:terminal_color_0 =  s:black.gui
  let g:terminal_color_1 =  s:red.gui
  let g:terminal_color_2 =  s:green.gui
  let g:terminal_color_3 =  s:yellow.gui
  let g:terminal_color_4 =  s:blue.gui
  let g:terminal_color_5 =  s:purple.gui
  let g:terminal_color_6 =  s:cyan.gui
  let g:terminal_color_7 =  s:white.gui
  let g:terminal_color_8 =  s:visual_grey.gui
  let g:terminal_color_9 =  s:dark_red.gui
  let g:terminal_color_10 = s:green.gui " No dark version
  let g:terminal_color_11 = s:dark_yellow.gui
  let g:terminal_color_12 = s:blue.gui " No dark version
  let g:terminal_color_13 = s:purple.gui " No dark version
  let g:terminal_color_14 = s:cyan.gui " No dark version
  let g:terminal_color_15 = s:comment_grey.gui
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
elseif has('terminal')
  let g:terminal_ansi_colors = [
    \ s:black.gui,
    \ s:red.gui,
    \ s:green.gui,
    \ s:yellow.gui,
    \ s:blue.gui,
    \ s:purple.gui,
    \ s:cyan.gui,
    \ s:white.gui,
    \ s:visual_grey.gui,
    \ s:dark_red.gui,
    \ s:green.gui,
    \ s:dark_yellow.gui,
    \ s:blue.gui,
    \ s:purple.gui,
    \ s:cyan.gui,
    \ s:white.gui
    \ ]
endif

" }}}

" Must appear at the end of the file to work around this oddity:
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark

