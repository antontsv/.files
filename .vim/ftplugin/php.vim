"
" Settings for PHP filetype
"

" Load PHP Documentor for VIM
" Let's just name it to get auto-loaded
"source ~/.vim/php-doc.vim


" Highlight chars that go over the 80-column limit
":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
":match OverLength '\%81v.*'


"
" Syntax options
"
" Enable folding of class/function blocks
let php_folding = 1
" See more on folding in .vimrc

" Do not use short tags to find PHP blocks. 
" See also ~/.vim/syntax/php.vim
let php_noShortTags = 0

" Highlight SQL inside PHP strings
let php_sql_query=1

" Highlight HTML in strings
let php_htmlInStrings = 1


"
" Linting
"
" Use PHP syntax check when doing :make
setlocal makeprg=php\ -l\ %
" Run SimpleTest tests saved in this script, plus syntax check args
setlocal makeprg=~/bin/vim_test\ %\ #

" Parse PHP error output
setlocal errorformat=%m\ in\ %f\ on\ line\ %l
" SimpleTest style errors
setlocal errorformat+=%E%m\ at\ [%f\ line\ %l],
\%Z\ \ \ \ \ \ \ \ in\ /%.%#,
\%C\ \ \ \ \ \ \ \ \ in\ %.%#

" Function to locate endpoints of a PHP block {{{
function! PhpBlockSelect(mode)
    let motion = "v"
    let line = getline(".")
    let pos = col(".")-1
    let end = col("$")-1

    if a:mode == 1
        if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'
            let motion .= "l"
        elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'
            " do nothing
        else
            let motion .= "/?>/e\<CR>"
        endif
        let motion .= "o"
        if end > 0
            let motion .= "l"
        endif
        let motion .= "?<\\?php\\>\<CR>"
    else
        if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'
            " do nothing
        elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'
            let motion .= "h?\\S\<CR>""
        else
            let motion .= "/?>/;?\\S\<CR>"
        endif
        let motion .= "o?<\\?php\\>\<CR>4l/\\S\<CR>"
    endif

    return motion
endfunction
" }}}

" Mappings to select full/inner PHP block
nmap <silent> <expr> vaP PhpBlockSelect(1)
nmap <silent> <expr> viP PhpBlockSelect(0)
" Mappings for operator mode to work on full/inner PHP block
omap <silent> aP :silent normal vaP<CR>
omap <silent> iP :silent normal viP<CR>

" Mappings for PHP Documentor for VIM
inoremap <buffer> <Leader><C-P> <Esc>:call PhpDocSingle()<CR>i
nnoremap <buffer> <Leader><C-P> :call PhpDocSingle()<CR>
vnoremap <buffer> <Leader><C-P> :call PhpDocRange()<CR>
" Generate @uses tag based on inheritance info
"let g:pdv_cfg_Uses = 1
" Set default Copyright
"let g:pdv_cfg_Copyright = "Copyright (C) 2006 Andrei Zmievski"

" Exuberant Ctags
"
" Map <F4> to re-build global tags file (which is in vim's cwd)
" Make sure it's "exhuberant" cause the emacs-provided one won't work
" Remove certain js files that provoke ctags bug 484797 (container-min.js)
nmap <silent> <F4>
        \ :!cd . &&
        \ time find_code \| sed "s,$HOME/care2/,,; s,./,," \|
        \ egrep -v 'js/subscription_center/container-min' \| 
        \ egrep -v 'js/yahoolibs/autocomplete-min' \| 
        \ egrep -v 'js/yui/build/(calendar\|profilervi\|container\|tabview)' \|
        \ egrep -v '^shared/' \|
        \ ctags -f ./global.tags 
        \ --langmap="php:+.inc.class"
        \ -h ".php.inc" -R --totals=yes
        \ --tag-relative=yes --PHP-kinds=+cf-v -L - &&
        \ echo -e '\nDeleting dir.tags files...\n' &&
        \ time find . -name dir.tags \| xargs --no-run-if-empty rm <CR>
" Map <F5> to re-build this directory's tags file,
" which will be searched first if present
nmap <silent> <F3>
        \ :!cd %:p:h &&
        \ ctags -f ./dir.tags 
        \ --langmap="php:+.inc.class"
        \ -h ".php.inc" -R --totals=yes
        \ --tag-relative=yes --PHP-kinds=+cf-v *.*<CR>

" Set tag filename(s)
setlocal tags=./dir.tags,global.tags

" vim: set fdm=marker:

