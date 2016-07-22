augroup xterm_title
    au!
    au BufEnter ?*  silent !set_label %:t > /dev/null 2>&1
    " Doesn't quite work; vim seems to interpret and display the
    " control characters specially.
    "au BufEnter *  echo "\033]0;hi\007"
augroup END 
