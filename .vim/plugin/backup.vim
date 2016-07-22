" Requires backup be set to enable backups in the first place
" Sets backupext to a timestamp with tilde, and sets backupdir
" based on the current file's path.

let g:backup_directory = expand($VIM_MAIN_BACKUP_DIR)

function! SetBackupExt()
  execute("setlocal backupext=" . strftime(".%Y-%m-%d-%H:%M:%S~"))
endfunction

function! SetBackupDir()
  let backup_dir = expand(g:backup_directory)
  if !isdirectory(backup_dir)
    echom "g:backup_directory doesn't exist: " . backup_dir
    sleep 3
    return
  endif
  let subdir = expand("%:p:h")
  let backupdirs = split(&backupdir, ",")
  " Not reliable to grab backup dir from &backupdir, since we change it
  "if -1 == strridx(backupdirs[0], subdir) && backupdirs[0] != "."
  let backupdirs[0] = backup_dir . subdir
  if !isdirectory(backupdirs[0])
    call mkdir(backupdirs[0], "p", 0750)
  endif
  "endif
  execute("setlocal backupdir=" . join(map(backupdirs, "fnameescape(v:val)"), ","))
endfunction

if strlen(g:backup_directory) > 0
    augroup backupext
      au!
      au BufWritePre * call SetBackupExt()
      au BufWritePre * call SetBackupDir()
    augroup END
endif

