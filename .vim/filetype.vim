" my filetype file 
if exists("did_load_filetypes") 
    finish 
endif 
augroup filetypedetect 
    au! BufRead,BufNewFile *.html,*.class        setfiletype php
    au! BufRead,BufNewFile *.wiki                setfiletype Wikipedia
    au! BufRead,BufNewFile CMakeLists.txt        setfiletype cmake
    au! BufRead,BufNewFile *.txt                 setfiletype txt
    au! BufRead,BufNewFile other_M               setfiletype list
    au! BufRead,BufNewFile COMMIT_EDITMSG        setfiletype gitcommit
    au! BufRead,BufNewFile git-rebase-todo       setfiletype gitrebase
    au! BufRead,BufNewFile */git-repo/*          setlocal expandtab&

    " From http://github.com/vim-ruby/
    " Ruby
    au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec  set filetype=ruby
    " Ruby on Rails
    au BufNewFile,BufRead *.builder,*.rxml,*.rjs    set filetype=ruby
    " Rakefile
    au BufNewFile,BufRead [rR]akefile,*.rake    set filetype=ruby
    " Rantfile
    au BufNewFile,BufRead [rR]antfile,*.rant    set filetype=ruby
    " IRB config
    au BufNewFile,BufRead .irbrc,irbrc      set filetype=ruby
    " eRuby
    au BufNewFile,BufRead *.erb,*.rhtml      set filetype=eruby
augroup END 
