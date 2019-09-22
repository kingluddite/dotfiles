" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.0+ and expects you to have Plug installed.
" -----------------------------------------------------------------------------

set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

"filetype off                  " required

" if syntax highlighting is breaking, this fixes it but it will lead to slowness
autocmd BufEnter * :syntax sync fromstart

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" Specify a directory for plugins.
call plug#begin('~/.vim/bundle')

" Keep Plugin commands between plug#begin/end.

" Zenburn theme.
Plug 'jnurmine/zenburn'

" Navigate and manipulate files in a tree view.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

Plug 'mitermayer/vim-prettier'

" Surround text with quotes, parenthesis, brackets, and more.
Plug 'tpope/vim-surround'

Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'tomtom/tcomment_vim'
Plug 'chun-yang/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'gioele/vim-autoswap'
" React code snippets
Plug 'mxw/vim-jsx'

" Plugin Graveyard
" Plug 'prettier/prettier'
" Plug 'tyru/open-browser.vim'
" Plug 'ervandew/supertab' " Must load before youcompleteme
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter' (super slow!)
" Plug 'chemzqm/vim-jsx-improve' " jsx support
" Plug 'marijnh/tern_for_vim'
" Plug 'valloric/youcompleteme'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'dsimidzija/vim-nerdtree-ignore'
" Plug 'ryanoasis/vim-devicons'
" Plug 'vimwiki/vimwiki'
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ap/vim-css-color'
" Plug 'chip/vim-fat-finger'
" Plug 'zirrostig/vim-schlepp'
" React code snippets
" ES2015 code snippets 
" Plug 'epilande/vim-es2015-snippets'
" Plug 'kewah/vim-stylefmt'    
" Plug 'sirver/ultisnips'
" Plug 'epilande/vim-react-snippets'

" Languages and file types.
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
Plug 'jparise/vim-graphql'

" All of your Plugins must be added before the following line
call plug#end()            " required

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

let mapleader = "\<Space>" " yep - the space bar is my leader key

set autoindent             " auto-indent
set bg=dark
set backspace=indent,eol,start
set backup                 " create backups
set backupdir=/tmp         " tell vim where to put its backup files
set clipboard=unnamed " set clipboard to easily copy from vim and paste into OSx
set dir=/tmp               " tell vim where to put swap files
set foldcolumn=1           " Add a bit extra margin to the left
set foldmethod=indent      " Code fold bliss
set formatoptions=tcqrn1
set encoding=utf-8         " Encoding
set expandtab              " use spaces instead of tabs
set hidden                 " Allow hidden buffers
set history=1000           " Keep 1000 items in the history
set hlsearch
let html_no_rendering=1 
set ignorecase  " Make searches case-insensitive
set incsearch   " But do highlight as you type your search
set laststatus=2    " last window always has a status line
set lbr                    " makes for an easier to read line wrap
let loaded_matchparen=1 
set matchpairs+=<:> " use % to jump between pairs
set modelines=0
set nohlsearch             " Don't continue to highlight seached phrases
set noshowmatch            " Don't match parentheses/brackets
set nocursorline           " Don't paint cursor line
set nocursorcolumn         " Don't paint cursor column
set noshiftround           " always indent/outdent to the nearest tabstop
set nowrap                 " Don't wrap text
set number relativenumber
set ruler                  " Always show info along bottom
set scrolljump=8           " Scroll 8 lines at a time at bottom/top
set showmatch
set si                     " Smart indent
set shiftwidth=2   " indent/outdent by 2 columns
set showcmd
set showmode
set softtabstop=2  " unify
set smartcase
set smarttab               " use tabs at the start of a line, spaces elsewhere
set scrolloff=5
set shiftwidth=2           " 1 tab == 2 spaces
set t_Co=256               " enable 256-color mode
set t_vb=
set tabstop=2              " tab spacing
set term=xterm-256color
set termencoding=utf-8"
set textwidth=79
set timeoutlen=1000        " speed vim up
set ttimeoutlen=0          " https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334
set ttyfast                " Rendering
set tw=500
set visualbell             " Blink cursor on error instead of beeping (grr)
set wildmenu               " shows a menu when using tab completion
set wildmode=full
set wildignore+=*/tmp/*,/dist/* " wildignore limits searches
set wildignore+=/node_modules/*,*.so,*.swp,*.zip
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.swo,*.tmp
set wrap                   
set runtimepath^=~/.vim/bundle.ctrlp.vim " fuzzy search

runtime! macros/matchit.vim

filetype plugin indent on    " (required) activates indenting for files

let g:Powerline_symbols = 'fancy'

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

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

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

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

" easy nav through screens with hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easy navigation in split windows
nnoremap <C-L> <C-W><C-L> " focus on left
nnoremap <C-H> <C-W><C-H> " focus on right


" Searching
nnoremap / /\v
vnoremap / /\v


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

" arrow keys are bad in Vim!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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
