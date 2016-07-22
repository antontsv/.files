" Exuberant Ctags
"
" Map <F4> to re-build global tags file (which is in vim's cwd)
nmap <silent> <F4>
        \ :!time ctags -f ./global.tags 
        \ -R --totals=yes
        \ --tag-relative=yes . 
        \ <CR>

" Set tag filename(s)
setlocal tags=./dir.tags,global.tags

