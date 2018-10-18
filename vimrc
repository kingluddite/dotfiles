set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

filetype off                  " required

call plug#begin('~/.vim/bundle')

" Keep Plugin commands between plug#begin/end.
" Plug 'Powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'prettier/prettier'
    Plug 'tyru/open-browser.vim'
    Plug 'jnurmine/zenburn'
    Plug 'stanangeloff/php.vim'
    "Plug 'tpope/vim-markdown'
    Plug 'mitermayer/vim-prettier'
"    Plug 'ervandew/supertab' " Must load before youcompleteme
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'pangloss/vim-javascript'
"    Plug 'chemzqm/vim-jsx-improve' " jsx support
    Plug 'marijnh/tern_for_vim'
"    Plug 'valloric/youcompleteme'
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
    Plug 'mattn/emmet-vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'chun-yang/auto-pairs'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    Plug 'w0rp/ale'
    Plug 'dsimidzija/vim-nerdtree-ignore'
    "Plug 'rking/ag.vim' " Needs the_silver_searcher (install with brew)
    Plug 'ryanoasis/vim-devicons'
    Plug 'vimwiki/vimwiki'
    "Plug 'bling/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'easymotion/vim-easymotion'
    Plug 'ap/vim-css-color'
    Plug 'leshill/vim-json'
    Plug 'chip/vim-fat-finger'
    Plug 'zirrostig/vim-schlepp'
    Plug 'gioele/vim-autoswap'
    Plug 'kewah/vim-stylefmt'    
    " React code snippets
    " ES2015 code snippets 
"    Plug 'epilande/vim-es2015-snippets'
    " React code snippets
    Plug 'mxw/vim-jsx'
"    Plug 'sirver/ultisnips'
"    Plug 'epilande/vim-react-snippets'
" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()            " required

filetype plugin indent on    " (required) activates indenting for files

" add Powerline font
" set guifont=Inconsolata\ for\Powerline:h15
set guifont=Fira\ Code:h12
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256            " enable 256-color mode
set term=xterm-256color
set termencoding=utf-8"

" Keep 1000 items in the history
set history=1000

" shows a menu when using tab completion
set wildmenu

" deal with swps and backups here
" create backups
set backup
" tell vim where to put its backup files
set backupdir=/tmp
" tell vim where to put swap files
set dir=/tmp

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

" TODO: Pick a leader key
let mapleader = "\<Space>" " yep - the space bar is my leader key

" vimwiki with markdown support
" let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
" let g:instant_markdown_autostart = 0	" disable autostart
" map <leader>md :InstantMarkdownPreview<CR>

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

"inoremap <Tab> <c-r>=UltiSnips#ExpandSnippet()<cr>

" Trigger react snippets
"let g:UltiSnipsExpandTrigger="<C-L>"

" lets emmet use jsx shortcuts
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

let g:jsx_ext_required = 0


autocmd FileType html,css,javascript.jsx EmmetInstall

" Using tab as abbreviation for emmet
" This also allows you to <tab> for indentation
" let g:user_emmet_expandabbr_key='<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

nnoremap <silent> <leader>cs :Stylefmt<CR>
vnoremap <silent> <leader>cs :StylefmtVisual<CR>

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" ESLint through Vim
" Fix eslint on save
let g:ale_lint_on_text_changed = 'never'
" disable the Ale HTML linters
let g:ale_linters = {
\   'html': [],
\}
let g:ale_set_highlights = 0

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
\ 'prettier', 'eslint'
\]
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

let g:ale_linters = {
  \ 'javascript': ['stylelint', 'eslint'],
  \}

" shortcut to run :ALEFix (<space>d)
nmap <leader>d <Plug>(ale_fix)

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" wildignore yo! --->  limit searches
set wildignore+=*/tmp/*,/dist/*
set wildignore+=/node_modules/*,*.so,*.swp,*.zip
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.swo,*.tmp
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab      " use tabs at the start of a line, spaces elsewhere

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2     " tab spacing

" Linebreak on 500 characters
set lbr " makes for an easier to read line wrap
set tw=500

set ai            " Auto indent
set si            " Smart indent
set wrap          " Wrap lines
set nowrap        " Don't wrap text

set bg=dark
" Security
set modelines=0

" Show line numbers
" Both absolute and relative line numbers are enabled by default, which produces “hybrid” line numbers. When entering insert mode, relative line numbers are turned off, leaving absolute line numbers turned on. This also happens when the buffer loses focus, so you can glance back at it to see which absolute line you were working on
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Show file stats
set ruler " Always show info along bottom
set nohlsearch       " Don't continue to highlight seached phrases
" Add a bit extra margin to the left
set foldcolumn=1

" Code fold bliss
set foldmethod=indent

" Blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=

" Encoding
set encoding=utf-8

" fuzzy search
set runtimepath^=~/.vim/bundle.ctrlp.vim
" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2   " indent/outdent by 2 columns
set softtabstop=2  " unify
set expandtab      " use spaces instead of tabs
set noshiftround   " always indent/outdent to the nearest tabstop

" Cursor motion
set scrolloff=5
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim


" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Toggle fold at current position
nnoremap <s-tab> za

" save with zz
nnoremap zz :update<cr>

" Bubble single lines
"nmap <c-k> ddkP
"nmap <c-j> ddp

" alt splits on Mac
" nmap ˙ <C-w><Left>
" nmap ∆  <C-w><Down>
" nmap ˚ <C-w><Up>
" nmap ¬ <C-w><Right>

" Bubble multiple lines
"vmap <c-k> xkP`[V`]
"vmap <c-j> xp`[V`]

" easy nav through screens with hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easy navigation in split windows
nnoremap <C-L> <C-W><C-L> " focus on left
nnoremap <C-H> <C-W><C-H> " focus on right

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2    " last window always has a status line

" Last line
set showmode

" show incomplete commands
set showcmd

" set clipboard to easily copy from vim and paste into OSx
set clipboard=unnamed

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch   " But do highlight as you type your search
set ignorecase  " Make searches case-insensitive

set autoindent  " auto-indent
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

"make < > shifts keep selection
"vnoremap < <gv
"vnoremap > >gv

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" add closing brace
inoremap {;<CR> {<CR>};<ESC>0
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>0

" Textmate holdouts

" Formatting
map <leader>q gqip

" map jk to esc
:imap jk <Esc>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" NERDTree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>ne :NERDTree<CR>

" Disable arrow keys to get better at vim
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" prettier
" disable autocomments after first // and then hitting return
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Color scheme (terminal)
set t_Co=256
set background=dark

" Ctrl-P Yo!
" Make sure ctrlp ignores this stuff
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" do not auto-hide quotes
let g:vim_json_syntax_conceal = 0

" Ctrl-P Funky
nnoremap <Leader>fu :CtrlPFunky<Cr>

" Damian Conway causes swap files to be rotated every 10
" strokes (instead of default 200)
set updatecount=10

" Damian Conway tip always use visual block mode
nnoremap    v    <C-V>
nnoremap  <C-V>    v


" colorscheme solarized
" my theme
syntax on
colors zenburn

" adds blue highlight to vim in visual mode selections
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
" iterm cursor changes depending on mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set title titlestring=
