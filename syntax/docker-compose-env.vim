" Vim syntax file
" Language:	    Syntax highlighting for .settings/.env files in docker-compose projects
" Maintainer:	    Marco Herrn <marco@mherrn.de>

if !exists("main_syntax")
  if version < 600
     syntax clear
  elseif exists("b:current_syntax")
     finish
  endif
  let main_syntax = 'docker-compose-env'
endif

syn case ignore

syn match envComment "^\s*#.*$"
syn match envInlineComment "\s\+#.*$"
syn match envKey "^\s*[^:=[:space:]#]\+\ze\s*[:=]"
syn match envSeparator "[:=]" nextgroup=envValuePart skipwhite
syn match envValuePart ".\{-}\ze\(\s\+#\|$\)" contained contains=envDoubleQuoted,envSingleQuoted,envVarInterp
syn region envDoubleQuoted matchgroup=envValueQuotes start='"' end='"' oneline contained contains=envVarInterp
syn region envSingleQuoted matchgroup=envValueQuotes start="'" end="'" oneline contained
syn region envVarInterp matchgroup=envVarDelim start="\${" end="}" oneline contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_srt_syn_inits")
  if version < 508
     let did_srt_syn_inits = 1
     command -nargs=+ HiLink hi link <args>
  else
     command -nargs=+ HiLink hi def link <args>
  endif

  HiLink envComment Comment
  HiLink envInlineComment Comment
  HiLink envKey Identifier
  HiLink envSeparator Operator
  HiLink envValuePart String
  HiLink envDoubleQuoted String
  HiLink envSingleQuoted String
  HiLink envValueQuotes Special
  HiLink envVarDelim Special
  HiLink envVarInterp PreProc
  delcommand HiLink

endif

let b:current_syntax = "docker-compose-env"

if main_syntax == 'docker-compose-env'
   unlet main_syntax
endif

" vim: ts=8
