" Avoid excessive line length in commit comments
setlocal textwidth=70
" Highlight these lines
exec '2match Todo /\%>' .  &textwidth . 'v.\+/'
" Undo the match when leaving, and remove the hook then too.
augroup gitcommit
  au!
  au BufLeave * execute "2match none | augroup gitcommit | au!" | execute "augroup END"
augroup END
" Do a spell check
set spell
