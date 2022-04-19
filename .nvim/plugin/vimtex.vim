let g:tex_flavor = 'latex'

let g:vimtex_view_method = "zathura"
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_fold_enables = 1
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_open_on_warning = 0

let g:vimtex_compiler_progname = 'nvr'

let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \ ]
      \}
