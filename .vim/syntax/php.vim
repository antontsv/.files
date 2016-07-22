
" For some reason, this line of vim.php doesn't seem to be running...
" running it fixes files that start with <? and no "php".
syn region   phpRegion  matchgroup=Delimiter start="<?\(php\)\=" end="?>" contains=@phpClTop keepend
