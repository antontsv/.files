if exists("did_load_filetypes") 
    finish 
endif 
augroup filetypedetect 
    au! BufRead,BufNewFile *.wiki                setfiletype Wikipedia
    au! BufRead,BufNewFile CMakeLists.txt        setfiletype cmake
    au! BufRead,BufNewFile *.txt                 setfiletype txt
    au! BufRead,BufNewFile COMMIT_EDITMSG        setfiletype gitcommit
    au! BufRead,BufNewFile git-rebase-todo       setfiletype gitrebase
augroup END 
