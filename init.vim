" Enviroment Variables
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" PLUGINS ------------------------------------------------------------------ {{{
call plug#begin('~/.config/nvim/plugged')

" Plug: General
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'benekastah/neomake'
Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py' }
" Plug 'Shougo/deoplete.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'rking/ag.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'kassio/neoterm'

" Plug: Syntax
" HTML
Plug 'evidens/vim-twig'

" Javascript
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }

" Coffee-script
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" Python
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }

" Plug: Themes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jdkanani/vim-material-theme'
Plug 'jscappini/material.vim'
Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'romainl/flattened'
Plug 'jonathanfilip/vim-lucius'
Plug 'w0ng/vim-hybrid'
Plug 'zeis/vim-kolor'
Plug 'notpratheek/vim-luna'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'reedes/vim-colors-pencil'
Plug 'noahfrederick/vim-hemisu'
Plug 'kevlun/vim-lucid'
Plug 'jordwalke/flatlandia'
Plug 'john2x/flatui.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'geoffharcourt/one-dark.vim'
Plug 'zefei/cake16'
Plug 'mhartington/oceanic-next'

call plug#end()
" }}}
" GENERAL ------------------------------------------------------------------ {{{
" set nocompatible

syntax on

set background=dark
color flatlandia

" Syntastic / NeoMake sign colors
" hi NeoMakeErrorSign guibg=#263238 guifg=#dc322f
" hi NeoMakeWarningSign guibg=#263238 guifg=#df5f00
hi NeoMakeErrorSign guifg=#dc322f
hi NeoMakeWarningSign guifg=#df5f00

" Enable bold font in hybrid-* themes
let g:enable_bold_font = 1
let g:hybrid_use_iTerm_colors = 1

let g:neomake_error_sign = { 'texthl': 'NeoMakeErrorSign' }
let g:neomake_warning_sign = { 'texthl': 'NeoMakeWarningSign' }

set relativenumber
set number

" Disable Backup
set nobackup
set noswapfile
set nowritebackup

" Fix backspace
set backspace=indent,eol,start
set showmatch
set ruler
set hlsearch
set incsearch
set smartcase
set smarttab
set noerrorbells
set visualbell
set tabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smartindent
set expandtab
set cursorline
set linespace=6
set noequalalways
set wildmenu

" Autoload file on external changes
set autoread

" Hide abandoned buffers
set hidden

if has("linebreak")
  set linebreak                 " Wrap lines at word boundaries
  set showbreak=...
  if exists("+breakindent")
    set breakindent             " Indent soft-wrapped lines
  endif
endif
set nowrap

set fillchars+=vert:\ ,diff:\    " Use space for vertical split, diff fill char

" Set Invisble characters
set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
if &termencoding ==# "utf-8" || &encoding ==# "utf-8"
  " let &fillchars = "vert:\u2502,diff: "
  let &fillchars = "vert: ,diff: "
  let &listchars = "tab:\u25b8 ,extends:\u276f,precedes:\u276e,nbsp:\u2334"
  if has("linebreak")
    let &showbreak = "\u21aa"
  endif
endif

" Global ignore pattern
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,__pycache__

filetype plugin on
filetype plugin indent on
" }}}
" KEYMAPS ------------------------------------------------------------------ {{{
nnoremap <F1> :set hlsearch!<CR>
map <F2> :set list!<cr>
map <F3> :NERDTreeToggle %:p:h<CR>
map <F4> <Esc>:Ag

" Use Esc Esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l


" CTRL-P
map <silent> <C-a> :CtrlPBuffer<CR>
map <silent> <C-s> :CtrlPMRUFiles<CR>

" use jj to return to normal mode
imap jj <Esc>

" Use Shift Tab to unindent
nmap <Tab> a<C-t><Esc>
nmap <S-Tab> a<C-d><Esc>
" nmap <Tab> >>
" nmap <S-Tab> <<
" imap <Tab> <C-t>
" imap <S-Tab> <C-d>
vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv

" Pane resize
map <silent> <S-Right> <C-w><
map <silent> <S-Down> <C-W>-
map <silent> <S-Up> <C-W>+
map <silent> <S-Left> <C-w>>

" Enable . command in visual mode
vnoremap . :normal .<cr>

" switch between current and last buffer
" nmap <c-Tab> <c-^>

map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" map <silent> <C-h> :call WinMove('h')<cr>
" map <silent> <C-j> :call WinMove('j')<cr>
" map <silent> <C-k> :call WinMove('k')<cr>
" map <silent> <C-l> :call WinMove('l')<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" }}}
" LEADER ------------------------------------------------------------------- {{{
" map leader to ,
let mapleader = ","

",w to save
nmap <leader>w :w!<cr>

",t to create a new tab
nmap <leader>t :tabnew<cr>

" ,. to select next/previous buffer
"nmap <leader>- :bn<cr>
"nmap <leader>. :bp<cr>

" Search with Ack
" nmap <leader>s <Esc>:Ack!

" Strip whitespace
nnoremap <leader>l :Strip<cr>

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>

if isdirectory(expand("~/.config/nvim/plugged/tabular"))
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif
" }}}
" FUNCTIONS ---------------------------------------------------------------- {{{
" Strip whitespace --------------------------------------------------------- {{{
function! StripWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
command! Strip call StripWhitespace()<cr>
" }}}

" Window Movement ---------------------------------------------------------- {{{
" move to the window in the direction shown, or create a new window
"
" https://github.com/nicknisi/dotfiles/blob/master/vim/vimrc.symlink
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
" }}}

" Clipboard ---------------------------------------------------------------- {{{
" Copy from and to Mac Clipboard
function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
" }}}

" }}}
" PLUGIN SETTINGS ---------------------------------------------------------- {{{
" Lightline ---------------------------------------------------------------- {{{
" let g:lightline = {
"   \ 'colorscheme': 'Tomorrow_Night',
"   \ 'active': {
"   \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
"   \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
"   \ },
"   \ 'component': {
"   \   'lineinfo': ' %3l:%-2v',
"   \ },
"   \ 'component_function': {
"   \   'fugitive': 'LightLineFugitive',
"   \   'filename': 'LightLineFilename',
"   \   'fileformat': 'LightLineFileformat',
"   \   'filetype': 'LightLineFiletype',
"   \   'fileencoding': 'LightLineFileencoding',
"   \   'mode': 'LightLineMode',
"   \   'ctrlpmark': 'CtrlPMark',
"   \ },
"   \ 'component_expand': {
"   \   'syntastic': 'SyntasticStatuslineFlag',
"   \ },
"   \ 'component_type': {
"   \   'syntastic': 'error',
"   \ },
"   \ 'subseparator': { 'left': '', 'right': '' }
"   \ }

" function! LightLineModified()
"   return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" endfunction

" function! LightLineReadonly()
"   return &ft !~? 'help' && &readonly ? '' : ''
" endfunction

" function! LightLineFilename()
"   let fname = expand('%:t')
"   return fname == 'ControlP' ? g:lightline.ctrlp_item :
"         \ fname == '__Tagbar__' ? g:lightline.fname :
"         \ fname =~ '__Gundo\|NERD_tree' ? '' :
"         \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
"         \ &ft == 'unite' ? unite#get_status_string() :
"         \ &ft == 'vimshell' ? vimshell#get_status_string() :
"         \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
"         \ ('' != fname ? fname : '[No Name]') .
"         \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
" endfunction

" function! LightLineFugitive()
"   try
"     if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
"       let mark = ''
"       let _ = fugitive#head()
"       return strlen(_) ? mark._ : ''
"     endif
"   catch
"   endtry
"   return ''
" endfunction

" function! LightLineFileformat()
"   return winwidth(0) > 70 ? &fileformat : ''
" endfunction

" function! LightLineFiletype()
"   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
" endfunction

" function! LightLineFileencoding()
"   return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
" endfunction

" function! LightLineMode()
"   let fname = expand('%:t')
"   return fname == '__Tagbar__' ? 'Tagbar' :
"         \ fname == 'ControlP' ? 'CtrlP' :
"         \ fname == '__Gundo__' ? 'Gundo' :
"         \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
"         \ fname =~ 'NERD_tree' ? 'NERDTree' :
"         \ &ft == 'unite' ? 'Unite' :
"         \ &ft == 'vimfiler' ? 'VimFiler' :
"         \ &ft == 'vimshell' ? 'VimShell' :
"         \ winwidth(0) > 60 ? lightline#mode() : ''
" endfunction

" function! CtrlPMark()
"   if expand('%:t') =~ 'ControlP'
"     call lightline#link('iR'[g:lightline.ctrlp_regex])
"     return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
"           \ , g:lightline.ctrlp_next], 0)
"   else
"     return ''
"   endif
" endfunction

" let g:ctrlp_status_func = {
"   \ 'main': 'CtrlPStatusFunc_1',
"   \ 'prog': 'CtrlPStatusFunc_2',
"   \ }

" function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
"   let g:lightline.ctrlp_regex = a:regex
"   let g:lightline.ctrlp_prev = a:prev
"   let g:lightline.ctrlp_item = a:item
"   let g:lightline.ctrlp_next = a:next
"   return lightline#statusline(0)
" endfunction

" function! CtrlPStatusFunc_2(str)
"   return lightline#statusline(0)
" endfunction

" let g:unite_force_overwrite_statusline = 0
" let g:vimfiler_force_overwrite_statusline = 0
" let g:vimshell_force_overwrite_statusline = 0
" " }}}
" NERDTree ----------------------------------------------------------------- {{{
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" }}}
" THE SILVER SEARCHER (ag) ------------------------------------------------- {{{
let g:ag_working_path_mode="r"
" }}}
" CTRL-P ------------------------------------------------------------------- {{{
" Make Ctrl+P indexing faster by using ag silver searcher
let g:ctrlp_lazy_update = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
if executable("ag")
   set grepprg=ag\ --nogroup\ --nocolor
   let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" Make Ctrl+P matching faster by using pymatcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" }}}
" AIRLINE ------------------------------------------------------------------ {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'flatlandia'
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
" }}}
" JEDI --------------------------------------------------------------------- {{{
" Do not show docstring on completion
autocmd FileType python setlocal completeopt-=preview
" }}}

" DEOPLETE ----------------------------------------------------------------- {{{
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" }}}
" }}}
" MISC SETTINGS ------------------------------------------------------------ {{{
" Trim Whitespace on save
"autocmd FileType php,ruby,python,coffee,js,java,css
autocmd BufWritePre * :call StripWhitespace()
" -------------------------------------------------------------------------------------------------

aug run_neomake
  au!
  au BufEnter *
        \ if empty(getloclist(0)) |
        \   Neomake |
        \ end
  au BufWritePost,BufReadPost * Neomake
aug END

" Remember last location in file
" -------------------------------------------------------------------------------------------------
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
    au ColorScheme * highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
endif
" -------------------------------------------------------------------------------------------------

" FileType Specific settings
" -------------------------------------------------------------------------------------------------
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 expandtab
au BufNewFile,BufReadPost *.yaml setl shiftwidth=2 tabstop=2 expandtab
au BufNewFile,BufReadPost *.yml setl shiftwidth=2 tabstop=2 expandtab
" -------------------------------------------------------------------------------------------------
" }}}
" vim: fdm=marker:sw=2:sts=2:et
