source /usr/share/vim/vim81/vimrc_example.vim

syntax enable 
set fileencodings=ucs-bom,utf8,cp936,gb18030,utf16
set t_Co=256 
set ts=4 sw=4
"set background=light 
set background=dark 
set mouse=
colorscheme pablo 

call plug#begin('~/.vim/plugged')
Plug 'Rip-Rip/clang_complete'
Plug 'SirVer/ultisnips'
Plug 'mbbill/undotree'
Plug 'scrooloose/syntastic'
Plug 'rhysd/vim-clang-format'
call plug#end()

"===============================================
"clang_complete
"let g:clang_library_path='/usr/local/lib/libclang.dylib'
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_use_library=1
let g:clang_user_options='-std=c++14'
let g:clang_auto_user_options='.clang_complete,path'
let g:clang_auto_select=1
let g:clang_complete_auto=1
"let g:clang_snippets=0
let g:clang_snippets=1
let g:clang_snippets_engine="ultisnips"
let g:clang_conceal_snippets=0
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
let g:clang_close_preview=0
"===============================================
"undotree
if has("persistent_undo")
    set undodir=~/.vim/undodir/
    set undofile
endif
"===============================================

function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 3])
    endif
endfunction
let   g:syntastic_error_symbol="**"
let   g:syntastic_style_error_symbol="$$"
let   g:syntastic_warning_symbol="##"
let   g:syntastic_style_warning_symbol="%%"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers= ["clang_check"]
let g:syntastic_cpp_checkers= ["clang_check"]
"let g:syntastic_c_cppcheck_args = ["-DMACOSX", "-DSAL_UNX", "-DBUILD_STR(s)=#s"]
"let g:syntastic_c_clang_check_post_args = ["-DMACOSX", "-DSAL_UNX"]
let g:syntastic_clang_check_config_file='~/tmp/.syntastic_c_config'
let g:syntastic_clang_tidy_config_file='~/tmp/.syntastic_c_config'
let g:syntastic_cppcheck_config_file='~/tmp/.syntastic_c_config'
let g:syntastic_enable_balloons = 1
"let g:syntastic_debug_file = "~/tmp/syntastic.log"
"let g:syntastic_debug=32
"
"===============================================


" Leader = \
" llvm, google, chromium, mozilla
"let g:clang_format#code_style="google"

"\ "AlignConsecutiveDeclarations": "true",
"\ "AlignConsecutiveAssignments": "true",
let g:clang_format#style_options = {
            \ "Standard" : "C++11",
			\ "UseTab": "Always",
			\ "TabWidth": 4,
			\ "SortIncludes": "false",
			\ "SpacesInAngles": "true",
			\ "AlignAfterOpenBracket": "Align",
			\ "AlignOperands": "true",
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
			\ "MaxEmptyLinesToKeep": 1,
			\ "PointerAlignment": "Right",
			\ "BreakBeforeBraces": "Custom",
			\ "BraceWrapping": "{ 'AfterClass':'true','AfterControlStatement':'true', 'AfterEnum':'true', 'AfterFunction':'true', 'AfterNamespace':'true', 'AfterObjCDeclaration':'false', 'AfterStruct':'true', 'AfterUnion':'true', 'BeforeCatch':'true', 'BeforeElse':'true', 'IndentBraces':'false' }" }
"let g:clang_format#extra_args = "BraceWrapping: AfterClass:true, AfterControlStatement: false, AfterEnum:false, AfterFunction:   false AfterNamespace: false, AfterObjCDeclaration: false,AfterStruct: false,AfterUnion: false, BeforeCatch: false, BeforeElse:false,IndentBraces: false"

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

autocmd FileType c,cpp ClangFormatAutoEnable
