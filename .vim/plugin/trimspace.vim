" Remove trailing white space when I hit Enter (aka <CR>)
"
" Git likes to avoid trailing white space, and it sounds like a good
" idea to me too.  I've noticed most of what I introduce comes from
" manually breaking a line of code by hitting Enter in the middle.
" And I often do it right after a comma followed by a space.
"
" This function and mapping will remove the trailing space on the
" soon to be previous line for you.  And it will preserve any other
" special behavior you have associated with starting a newline, like
" auto-indentations.
"
" To get around this behavior and insert a newline without trimming
" spaces, use <End><CR>.  Shift+Enter didn't seem to register as
" different from <CR> for me; I'd prefer <S-CR> if I could make it
" work.
"
" Here are some other strategies I rejected:
"
" Remove trailing white space on write:
"
"     autocmd BufWritePre * :%s/\s\+$//ce
"
" This is too broad sweeping.  What if I really want trailing space?
" And it doesn't remind me that space is getting stripped when it
" happens.
"
" Highlight trailing white space as you type:
"
"     match Todo /\s\+$/
"
" This can be annoying, especially when I'm in code with lots of
" tailing space already.  I want clean diffs above all, and stripping
" trailing spaces all at once doesn't exactly contribute to that in the
" short-term.
"
" Various other key bindings:
"
" Some broke auto indentation.  Others moved up the final cursor
" position.  Others didn't work both from the end *and* the middle
" of a line.  Some attempts removed space before the <CR>, which
" was prone to breakage on the first or last character of the line
" because insert mode involves an extra column that normal mode
" doesn't seem to be able to know about.
"
" Maybe you like some of those better.  If so, have at it.
inoremap <CR> <CR><Space><C-O>:call MyRemoveSpace()<CR><Backspace>
" For some reason <S-CR> doesn't work as a literal <CR>
inoremap <End><CR> <CR>
function! MyRemoveSpace()
    let [bufnum, lnum, col, off] = getpos('.')
    let line = getline(lnum - 1)
    let trimmed_line = substitute(line, '\s*$', "", "")
    call setline(lnum - 1, trimmed_line)
    if strlen(line) > strlen(trimmed_line)
        " Multiple echo(m) mess up the mapping after the function call
        echom "Trimmed trailing white space characters..."
        sleep 500m
    endif
endfunction

