nmap <Leader>gs :!git status<CR>
nmap <Leader>gc :!git commit %<CR>
nmap <Leader>gC :!git commit -a<CR>
nmap <Leader>ga :!git add % && echo Added.<CR>
nmap <Leader>gl :!git log %<CR>
nmap <Leader>gL :!git log<CR>
nmap <Leader>gv :!git log --oneline --abbrev-commit origin/master..<CR>
nmap <Leader>gV :!git log -p origin/master..<CR>
nmap <Leader>gf :!git diff --name-status $(git merge-base origin/master HEAD)..HEAD<CR>
nmap <Leader>gb :!git blame %<CR>
