let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/dev/2u/schools/utah
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +6 file:///Users/philiphowley/Documents/dev/2u/schools/utah/class-files/14-MVC/01-Activities/04-Read-Books/Unsolved/server.js
badd +1 file:///Users/philiphowley/Documents/dev/2u/schools/utah/class-files/17-CS/01-Activities/03-Factory-Function/README.md
badd +1 file:///Users/philiphowley/Documents/dev/2u/schools/utah/class-files/17-CS/01-Activities/04-Fibonacci/README.md
badd +1 file:///Users/philiphowley/Documents/dev/2u/schools/utah/class-files/17-CS/01-Activities/04-Fibonacci/Unsolved/fibonacci.js
badd +1 file:///Users/philiphowley/Documents/dev/2u/schools/utah/class-files/17-CS/01-Activities/04-Fibonacci/Solved/fibonacci.js
badd +1 file:///Users/philiphowley/Documents/dev/2u/schools/utah/class-files/17-CS/01-Activities/04-Fibonacci/Solved/index.js
badd +1 file:///Users/philiphowley/Documents/dev/2u/schools/utah/class-files/17-CS/01-Activities/05-Regex/Solved/regex.md
argglobal
%argdel
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
2wincmd w
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFI
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
