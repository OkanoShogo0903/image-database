let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/go/src/github.com/OkanoShogo0903/image-database
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +121 controller/controller.go
badd +2 controller/controller_test.go
badd +90 term://.//5100:/bin/bash
badd +1 registory/image.go
badd +10 registory/images.go
badd +0 repogitory/images.go
badd +42 repository/images.go
badd +42 Makefile
badd +1 repository/images_test.go
badd +0 term://.//8284:/bin/bash
badd +0 repository/images_hogetes.go
badd +55 server.go
badd +3 server_test.go
badd +1 term://.//18364:/bin/bash
badd +0 term://.//18429:/bin/bash
badd +19 db/db.go
badd +1 db/migrations/1_init.sql
badd +2 db/migrations/1_characters.sql
badd +2 db/migrations/2_categories.sql
badd +25 db/migrations/3_images.sql
badd +1 db/migrations/4_image_categories.sql
badd +0 term://.//20688:/bin/bash
badd +0 db/migrations/5_insurt_data.sql
badd +4 model/model.go
argglobal
%argdel
edit controller/controller.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 103) / 206)
exe '2resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 174 + 103) / 206)
exe '3resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 87 + 103) / 206)
exe '4resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 86 + 103) / 206)
argglobal
enew
file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
if bufexists("term://.//8284:/bin/bash") | buffer term://.//8284:/bin/bash | else | edit term://.//8284:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 170 - ((21 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
170
normal! 0
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 25 - ((12 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
25
normal! 028|
wincmd w
argglobal
if bufexists("Makefile") | buffer Makefile | else | edit Makefile | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 36 - ((12 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
36
normal! 022|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 103) / 206)
exe '2resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 174 + 103) / 206)
exe '3resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 87 + 103) / 206)
exe '4resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 86 + 103) / 206)
tabedit server.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
3wincmd k
wincmd w
wincmd w
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 12 + 27) / 55)
exe 'vert 1resize ' . ((&columns * 78 + 103) / 206)
exe '2resize ' . ((&lines * 4 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 78 + 103) / 206)
exe '3resize ' . ((&lines * 1 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 78 + 103) / 206)
exe '4resize ' . ((&lines * 32 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 78 + 103) / 206)
exe '5resize ' . ((&lines * 19 + 27) / 55)
exe 'vert 5resize ' . ((&columns * 127 + 103) / 206)
exe '6resize ' . ((&lines * 32 + 27) / 55)
exe 'vert 6resize ' . ((&columns * 127 + 103) / 206)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 59 - ((4 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
59
normal! 018|
wincmd w
argglobal
if bufexists("term://.//18429:/bin/bash") | buffer term://.//18429:/bin/bash | else | edit term://.//18429:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1118 - ((2 * winheight(0) + 2) / 4)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1118
normal! 039|
wincmd w
argglobal
if bufexists("Makefile") | buffer Makefile | else | edit Makefile | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 58 - ((0 * winheight(0) + 0) / 1)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
58
normal! 070|
wincmd w
argglobal
if bufexists("term://.//18364:/bin/bash") | buffer term://.//18364:/bin/bash | else | edit term://.//18364:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 941 - ((31 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
941
normal! 062|
wincmd w
argglobal
if bufexists("controller/controller.go") | buffer controller/controller.go | else | edit controller/controller.go | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 94 - ((13 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
94
normal! 05|
wincmd w
argglobal
if bufexists("repository/images.go") | buffer repository/images.go | else | edit repository/images.go | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 51 - ((0 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
51
normal! 0
wincmd w
exe '1resize ' . ((&lines * 12 + 27) / 55)
exe 'vert 1resize ' . ((&columns * 78 + 103) / 206)
exe '2resize ' . ((&lines * 4 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 78 + 103) / 206)
exe '3resize ' . ((&lines * 1 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 78 + 103) / 206)
exe '4resize ' . ((&lines * 32 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 78 + 103) / 206)
exe '5resize ' . ((&lines * 19 + 27) / 55)
exe 'vert 5resize ' . ((&columns * 127 + 103) / 206)
exe '6resize ' . ((&lines * 32 + 27) / 55)
exe 'vert 6resize ' . ((&columns * 127 + 103) / 206)
tabedit db/migrations/2_categories.sql
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 103) / 206)
exe '2resize ' . ((&lines * 19 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 87 + 103) / 206)
exe '3resize ' . ((&lines * 19 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 87 + 103) / 206)
exe '4resize ' . ((&lines * 13 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 86 + 103) / 206)
exe '5resize ' . ((&lines * 12 + 27) / 55)
exe 'vert 5resize ' . ((&columns * 86 + 103) / 206)
exe '6resize ' . ((&lines * 12 + 27) / 55)
exe 'vert 6resize ' . ((&columns * 86 + 103) / 206)
exe '7resize ' . ((&lines * 12 + 27) / 55)
exe 'vert 7resize ' . ((&columns * 174 + 103) / 206)
argglobal
enew
file NERD_tree_2
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 16 - ((15 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 0
wincmd w
argglobal
if bufexists("db/migrations/1_characters.sql") | buffer db/migrations/1_characters.sql | else | edit db/migrations/1_characters.sql | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 10 - ((9 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 0
wincmd w
argglobal
if bufexists("db/migrations/5_insurt_data.sql") | buffer db/migrations/5_insurt_data.sql | else | edit db/migrations/5_insurt_data.sql | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 2 - ((1 * winheight(0) + 6) / 13)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
wincmd w
argglobal
if bufexists("db/migrations/3_images.sql") | buffer db/migrations/3_images.sql | else | edit db/migrations/3_images.sql | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 4 - ((3 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
wincmd w
argglobal
if bufexists("db/migrations/4_image_categories.sql") | buffer db/migrations/4_image_categories.sql | else | edit db/migrations/4_image_categories.sql | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 11 - ((10 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 014|
wincmd w
argglobal
if bufexists("term://.//20688:/bin/bash") | buffer term://.//20688:/bin/bash | else | edit term://.//20688:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 593 - ((11 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
593
normal! 08|
wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 103) / 206)
exe '2resize ' . ((&lines * 19 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 87 + 103) / 206)
exe '3resize ' . ((&lines * 19 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 87 + 103) / 206)
exe '4resize ' . ((&lines * 13 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 86 + 103) / 206)
exe '5resize ' . ((&lines * 12 + 27) / 55)
exe 'vert 5resize ' . ((&columns * 86 + 103) / 206)
exe '6resize ' . ((&lines * 12 + 27) / 55)
exe 'vert 6resize ' . ((&columns * 86 + 103) / 206)
exe '7resize ' . ((&lines * 12 + 27) / 55)
exe 'vert 7resize ' . ((&columns * 174 + 103) / 206)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
