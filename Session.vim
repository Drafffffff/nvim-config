let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +248 lua/uConfig.lua
badd +325 lua/plugins.lua
badd +22 lua/plugin-config/tokyonight.lua
badd +99 lua/basic.lua
badd +37 lua/plugin-config/transparent.lua
badd +4 lua/plugin-config/nvim-treesitter.lua
badd +94 lua/keybindings.lua
badd +1 lua/plugin-config/leap.lua
badd +7 lua/plugin-config/flit.lua
badd +1 lua/format/null-ls.lua
badd +27 lua/plugin-config/modes.lua
argglobal
%argdel
edit lua/plugin-config/modes.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 90 + 91) / 182)
exe '2resize ' . ((&lines * 23 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 90 + 91) / 182)
exe 'vert 3resize ' . ((&columns * 91 + 91) / 182)
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
11
normal! zo
let s:l = 27 - ((16 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 27
normal! 021|
wincmd w
argglobal
if bufexists(fnamemodify("lua/plugin-config/leap.lua", ":p")) | buffer lua/plugin-config/leap.lua | else | edit lua/plugin-config/leap.lua | endif
if &buftype ==# 'terminal'
  silent file lua/plugin-config/leap.lua
endif
balt lua/plugin-config/flit.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
let s:c = 43 - ((25 * winwidth(0) + 45) / 90)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 43 . '|'
else
  normal! 043|
endif
wincmd w
argglobal
if bufexists(fnamemodify("lua/uConfig.lua", ":p")) | buffer lua/uConfig.lua | else | edit lua/uConfig.lua | endif
if &buftype ==# 'terminal'
  silent file lua/uConfig.lua
endif
balt lua/plugins.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
let s:l = 246 - ((21 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 246
normal! 0
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 90 + 91) / 182)
exe '2resize ' . ((&lines * 23 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 90 + 91) / 182)
exe 'vert 3resize ' . ((&columns * 91 + 91) / 182)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
