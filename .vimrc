call plug#begin('~/.vim/plugged/')

Plug 'voldikss/vim-floaterm'
Plug 'arcticicestudio/nord-vim'
Plug 'pocari/vim-denite-emoji'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'zchee/deoplete-jedi'
Plug 'bignimbus/you-are-here.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'BrandonRoehl/auto-omni'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'aborres/vim-everything'
Plug 'lambdalisue/battery.vim'
Plug 'severin-lemaignan/vim-minimap'
call plug#end()
nnoremap <C-p> :call VE()<CR>

autocmd FileType python setlocal completeopt-=preview
set number
set encoding=UTF-8
autocmd vimenter * "highlight Pmenu ctermbg=31 guibg=#22f0d3"
autocmd vimenter * Minimap
colorscheme nord
let v:colornames['alt_turquoise'] = '#22f0d3'
hi Pmenu            ctermfg=4    ctermbg=0    cterm=bold      guifg=#2A1815          guibg=#2A1815      gui=bold
hi PmenuSel         ctermfg=0    ctermbg=31      cterm=bold     guifg=NONE          guibg=NONE   gui=bold
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
let g:minimap_highlight='Visual'

:highlight Comment guifg=#11f0c3 guibg=#ff00ff

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '›'

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=1

" Vim
let g:indentLine_color_term = 254

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let g:indentLine_char = 'c'
let g:indentLine_char_list = ['┊']

let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'rust', 'haskell', 'c', 'cpp']
set completeopt+=menuone,noselect,noinsert " don't insert text automatically
set pumheight=20 " keep the autocomplete suggestion menu small
set shortmess+=c " don't give ins-completion-menu messages

let g:python_host_prog = '/full/path/to/neovim2/bin/python'
let g:python3_host_prog = '/full/path/to/neovim3/bin/python'
" if completion menu closed, and two non-spaces typed, call autocomplete
let s:insert_count = 0
function! OpenCompletion()
    if string(v:char) =~ ' '
        let s:insert_count = 0
    else                    
        let s:insert_count += 1
    endif
    if !pumvisible() && s:insert_count >= 2
        silent! call feedkeys("\<C-n>", "n")
    endif
endfunction

function! TurnOnAutoComplete()
    augroup autocomplete
        autocmd!
        autocmd InsertLeave let s:insert_count = 0
        autocmd InsertCharPre * silent! call OpenCompletion()
    augroup END
endfunction

function! TurnOffAutoComplete()
    augroup autocomplete
        autocmd!
    augroup END
endfunction

function! ReplayMacroWithoutAutoComplete()
    call TurnOffAutoComplete()
    let reg = getcharstr()
    execute "normal! @".reg
    call TurnOnAutoComplete()
endfunction

call TurnOnAutoComplete()

" don't let the above mess with replaying macros
nnoremap <silent> @ :call ReplayMacroWithoutAutoComplete()<CR>

" use tab for navigating the autocomplete menu
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

let g:ve_list_size = 20 "Changes the minimum number of elements to show in searches
let g:ve_resize = 1 "Toggles if the popup window should be resizeable with the mouse
let g:ve_keep_prev_search = 1 "Forces VE to keep the input text in between searchs
let g:ve_use_python3 = 1 "set g:ve_use_python3 = 0 to use python27

" VE(keep_prev_search = 1) "Searchs previous search if g:ve_keep_prev_search == 1
" VE_Path()                "Searchs input text but keeps the input path if g:ve_keep_prev_search == 1
" VE_SearchInPath(path)    "Opens VE in the specified path
" VE_Search(txt)           "Searches specified text

" use PopupNotification to change BG color
" use PopupSelected to change cursor color
hi PopupSelected guifg=#000000 guibg=#ffa500

let g:ve_clear_c  = '~' "Key used to clear input search
let g:ve_clear_name = '!'
let g:ve_clear_path = '@'
let g:ve_fixed_w  = 128 "if set to any value, the window will have that size
let g:ve_explore  = 'Explore '  "Default action when pressing Enter on a folder
let g:ve_vexplore = 'Vexplore ' "Default action when pressing V on a folder
let g:ve_hexplore = 'Hexplore ' "Default action when pressing S on a folder
let g:ve_texplore = 'Texplore ' "Default action when pressing T on a folder

let g:ve_edit  = 'edit '   "Default action when pressing Enter on a file
let g:ve_vedit = 'vsplit ' "Default action when pressing V on a file
let g:ve_hedit = 'split '  "Default action when pressing S on a file
let g:ve_tedit = 'tabe '   "Default action when pressing T on a file

set runtimepath^=~/repos/github.com/vim-denops/denops.vim
set runtimepath^=~/repos/github.com/Shougo/pum.vim
set runtimepath^=~/repos/github.com/Shougo/ddc.vim
set runtimepath^=~/repos/github.com/Shougo/neco-vim
set runtimepath^=~/repos/github.com/Shougo/ddc-matcher_head
set runtimepath^=~/repos/github.com/Shougo/ddc-sorter_rank

set pumheight=10

if !has('nvim')
  set nocompatible
endif

function! CommandlinePre() abort
  let s:prev_buffer_config = ddc#custom#get_buffer()
  call ddc#custom#patch_buffer('sources', ['necovim'])
  call ddc#custom#patch_buffer('sourceOptions', {
        \ 'necovim': {'mark': 'V', 'minAutoCompleteLength': 3},
        \ })
  autocmd CmdlineLeave * call CommandlinePost()
  call ddc#enable_cmdline_completion()
endfunction

function! CommandlinePost() abort
  call ddc#custom#set_buffer(s:prev_buffer_config)
endfunction

function! s:ddcinit() abort
  cmap <silent><expr> <C-n> pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : '<C-n>'
  cmap <silent><expr> <C-p> pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<C-p>'
  cmap <silent><expr> <CR> pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : '<CR>'
  cmap <silent><expr> <Esc> pum#visible() ? '<Cmd>call pum#map#cancel()<CR>' : '<C-c>'

  call ddc#custom#patch_global('completionMenu', 'pum.vim')
  call ddc#custom#patch_global('backspaceCompletion', v:true)
  call ddc#custom#patch_global('autoCompleteEvents',
        \ ['CmdlineChanged'])
  call ddc#enable()
  nnoremap : <Cmd>call CommandlinePre()<CR>:
endfunction

autocmd User DenopsReady call s:ddcinit()

let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}

endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '  '
let g:airline_symbols.linenr = '  '
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = '  '

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '   IOS-Moded  '
