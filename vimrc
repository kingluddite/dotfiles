set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'Powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/prettier'
Plugin 'jnurmine/zenburn'
Plugin 'mitermayer/vim-prettier'
Plugin 'sirver/ultisnips'
Plugin 'ervandew/supertab' " Must load before youcompleteme
Plugin 'pangloss/vim-javascript'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'chun-yang/auto-pairs'
" Plugin 'yuroyoro/vim-autoclose'
Plugin 'kien/ctrlp.vim' "Fuzzy searching if dmenu isn't available
Plugin 'w0rp/ale'
Plugin 'dsimidzija/vim-nerdtree-ignore'
Plugin 'rking/ag.vim' " Needs the_silver_searcher (install with brew)
Plugin 'vimwiki/vimwiki'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " (required) activates indenting for files

" manually enable syntax highlighting
syntax enable

" add Powerline font
" set guifont=Inconsolata\ for\Powerline:h15
set guifont=Fira\ Code:h12
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256            " enable 256-color mode
set term=xterm-256color
set termencoding=utf-8"

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

" TODO: Pick a leader key
let mapleader = "\<Space>" " yep - the space bar is my leader key

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>md :InstantMarkdownPreview<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" inoremap <Tab> <c-r>=UltiSnips#ExpandSnippet()<cr>

" Using tab as abbreviation for emmet
" This also allows you to <tab> for indentation
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ESLint through Vim
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \}

" shortcut to run :ALEFix (<space>d)
nmap <leader>d <Plug>(ale_fix)

" makes prettier work with ale
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1 " run prettier on save
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5' " configure prettier

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

set wildignore+=*/tmp/*,/dist/*,/node_modules/*,*.so,*.swp,*.zip " to limit ctrlp search

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
set lbr
set tw=500

set ai            " Auto indent
set si            " Smart indent
set wrap          " Wrap lines
set nowrap        " Don't wrap text

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
set scrolloff=3
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
nmap <c-k> ddkP
nmap <c-j> ddp

" Bubble multiple lines
vmap <c-k> xkP`[V`]
vmap <c-j> xp`[V`]

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2    " last window always has a status line

" Last line
set showmode
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
vnoremap < <gv
vnoremap > >gv

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

" easy navigation in split windows
nnoremap <C-L> <C-W><C-L> " focus on left
nnoremap <C-H> <C-W><C-H> " focus on right

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

" Disable arrow keys to get better at vim
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" disable autocomments after first // and then hitting return
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Color scheme (terminal)
set t_Co=256
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1

" Make sure ctrlp ignores this stuff
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
" my theme
syntax on
colors zenburn

" iterm cursor changes depending on mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
