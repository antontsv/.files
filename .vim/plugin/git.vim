" Add <unique> to make redefinition fail
" Add <Plug> to do some kind of namespacy thing?
nmap <Leader>gd :!git d %<CR>
nmap <Leader>gD :!git d<CR>
nmap <Leader>gs :!git status<CR>
nmap <Leader>gc :!git commit %<CR>
nmap <Leader>gC :!git commit -a<CR>
nmap <Leader>ga :!git add % && echo Added.<CR>
nmap <Leader>gl :!git log %<CR>
nmap <Leader>gL :!git log<CR>
nmap <Leader>gl :!git log %<CR>
nmap <Leader>gv :!git log --pretty=oneline --abbrev-commit origin/master..<CR>
nmap <Leader>gV :!git log -p origin/master..<CR>
nmap <Leader>gf :!git diff --name-status $(git merge-base origin/master HEAD)..HEAD<CR>
nmap <Leader>gb :!git blame %<CR>
nmap <Leader>gr :!git rebase -i origin/master<CR>
nmap <Leader>ge :!ref="$(git symbolic-ref HEAD \| sed 's,refs/heads/,,')"; [ -n "$ref" ] \|\| { echo "Not on bug branch."; exit 1; }; echo "Exporting $ref..."; git format-patch -k -M origin/master..$ref -o ~/care2/tmp/patches/$ref<CR>


