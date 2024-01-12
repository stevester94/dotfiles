" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish|  endif

syntax match error "\v\cerror[s]?"
syntax match starting "\v\cstarting"
syntax match unknown "\v\cunknown"
syntax match not "\v\cnot"
syntax match true "\v\ctrue"
syntax match false "\v\cfalse"
syntax match info "\v\cinfo"
syntax match debug "\v\cdebug"

highlight error ctermfg=Red ctermbg=NONE guifg=#FF0000 guibg=NONE
highlight starting ctermfg=Blue ctermbg=NONE guifg=#FF0000 guibg=NONE
highlight unknown ctermfg=yellow ctermbg=NONE guifg=#FF0000 guibg=NONE
highlight not ctermfg=yellow ctermbg=NONE guifg=#FF0000 guibg=NONE
highlight true ctermfg=Green ctermbg=NONE guifg=#FF0000 guibg=NONE
highlight false ctermfg=Red ctermbg=NONE guifg=#FF0000 guibg=NONE
highlight info ctermfg=blue ctermbg=NONE guifg=#FF0000 guibg=NONE
highlight debug ctermfg=yellow ctermbg=NONE guifg=#FF0000 guibg=NONE

let b:current_syntax = 'slog'
