set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

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
colors zenburn
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
" iterm cursor changes depending on mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
