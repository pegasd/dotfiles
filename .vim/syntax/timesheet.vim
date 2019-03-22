" Vim syntax file
if exists("b:current_syntax")
  finish
endif
syn keyword confTodo    contained TODO FIXME XXX
syn match   confComment "^#.*" contains=confTodo
syn match   confComment "\s#.*"ms=s+1 contains=confTodo
syn match   timesheetDate   /^\d\d\d\d-\d\d-\d\d\ze,/   nextgroup=timesheetComma1
syn match   timesheetComma1 /,/ contained   nextgroup=timesheetStartTime
syn match   timesheetStartTime  /\d\d:\d\d/ contained   nextgroup=timesheetComma2
syn match   timesheetComma2 /,/ contained   nextgroup=timesheetEndTime
syn match   timesheetEndTime    /\d\d:\d\d/ contained   nextgroup=timesheetComma3
syn match   timesheetComma3 /,/ contained   nextgroup=timesheetJiraIssueKey
syn match   timesheetJiraIssueKey   /\w\+-\d\+/ contained   nextgroup=timesheetComma4
syn match   timesheetComma4 /,/ contained   nextgroup=timesheetDescription
syn match   timesheetDescription    /.\+/   contained
" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link confComment Comment
hi def link timesheetDate   SpecialKey
hi def link timesheetStartTime  Question
hi def link timesheetEndTime    Identifier
hi def link timesheetJiraIssueKey   Statement
hi def link timesheetDescription    String
hi def link confTodo    Todo
let b:current_syntax = "timesheet"
" vim: ts=8 sw=2
