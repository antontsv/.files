" File type for list of CVS statuses
nnoremap <buffer> D :w<CR>^t<Space>llv$hy:<C-f>iecho "Diffing..."\|call system("{ cd /mnt/filer/web/httpd && cvs diff -u " . shellescape("<Esc>pa") . "; } > tmp.patch 2>&1")<CR>:e +so\ ~/.vim/ftplugin/listpatch.vim tmp.patch<CR>
nnoremap <buffer> S ^t<Space>llv$hy:<C-f>iexe ":!cd /mnt/filer/web/httpd && cvs status  " . shellescape("<Esc>pa")<CR>

nnoremap <buffer> U ^cwunversion<Esc>
nnoremap <buffer> C ^cwcommit<Esc>
nnoremap <buffer> K ^cwadmin-ko<Esc>
nnoremap <buffer> B ^cwadmin-ko,commit<Esc>

vnoremap <buffer> U :s/^./unversion/<CR>
vnoremap <buffer> C :s/^./commit/<CR>
vnoremap <buffer> K :s/^./admin-ko/<CR>
vnoremap <buffer> B :s/^./admin-ko,commit/<CR>
" includes/lib_fdb.inc
