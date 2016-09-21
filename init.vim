if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Change cursor in insert mode
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
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'tomasr/molokai'
Plug 'jacoborus/tender'
Plug 'roosta/srcery'
Plug 'rakr/vim-one'
Plug 'YorickPeterse/happy_hacking.vim'

call plug#end()
" }}}
" GENERAL ------------------------------------------------------------------ {{{
" set nocompatible

syntax on

set background=dark
color one

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
map <F1> :NERDTreeToggle %:p:h<CR>
map <F2> :noh<cr>
map <F3> <Esc>:Ag
map <F4> :set list!
map <F5> :terminal<cr>

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

" Esc-Esc to exit terminal mode
tnoremap <Esc><Esc> <C-\><C-n>

" Raise privileges
cmap w!! w !sudo tee >/dev/null %

" Toogle fold open/close in normal mode. Create fold in Visual mode
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <F8> zf

" deoplete tab-complete
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" }}}
" LEADER ------------------------------------------------------------------- {{{
" map leader to ,
let mapleader = " "

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
nnoremap <leader>gk :Gpush<CR>
nnoremap <leader>gj :Gpull<CR>

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
" Clipboard - -------------------------------------------------------------- {{{
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
" Theme switcher - --------------------------------------------------------- {{{
function! SwitchTheme()
    if &bg=="light"
        set background=dark
        color flatlandia
        let g:airline_theme = 'flatlandia'
    else
        set background=light
        color solarized
        let g:airline_theme = 'solarized'
    endif
    syntax on
endfunction
command! SwitchTheme call SwitchTheme()
" }}}
" Space2Tab/Tabs2Space ----------------------------------------------------- {{{
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction

command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
" }}}
" }}}
" PLUGIN SETTINGS ---------------------------------------------------------- {{{
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
" let g:tender_airline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'
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
" let g:deoplete#enable_at_startup = 1
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#disable_auto_complete = 1
" let g:deoplete#auto_completion_start_length = 1
" let g:deoplete#enable_debug=1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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
