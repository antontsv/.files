" Add <tt></tt> around something, assuming we're at the latter corner of
" the visual selection.
"
" Is there a way to definitely go to the end, not the "other" end?
" That would allow this to work if you invoke on the front end of a
" selection.

"vmap <buffer> tt <Esc>a</tt><Esc>gvo<Esc>i<tt><Esc>gvo<Esc>9l
vmap <buffer> tt <Esc>a</tt><Esc>gvo<Esc>i<tt><Esc>3h
vmap <buffer> lt <Esc>a&gt;<Esc>gvo<Esc>i&lt;<Esc>gvo<Esc>8l
