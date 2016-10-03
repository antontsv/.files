" init pathogen (for plugins in ~/.vim/bundle)
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Enable loading filetype
filetype plugin on

" Turn syntax highlighting on
syntax on

" When auto-completing, insert longest common prefix, and list all options
" When not configured, CTRL-L and CTRL-D do those tasks, respectively
set wildmode=longest:list
" Make colors compatible with a dark background - no dark blue comments!
"set background=dark
" Colorschemes that look decent on black bg: evening, peachpuff, desert
" Just setting background=dark makes pipes in help mode black on black
"colorscheme evening
" For use with :find and gf
" set path+=/some_path

set ruler " position of cursor in status line
" Incremental search
set incsearch
" Don't highlight results of a search
set nohlsearch
" Accept mouse clicks or not
"set mouse=a

" Use F5 to toggle 'paste' mode, faster than :set paste / :set paste&
set pastetoggle=<F5>
" Use 4 spaces for (auto)indent
set shiftwidth=4
" Spaces to show for <Tab> and replace w/ :retab
set tabstop=4
" This replaces tabs with spaces...
set expandtab
" Mostly regarding automatic white-space handling see |fo-table|
set formatoptions+=tcroqln
" The a option is what reworks the spacing of entire paragraph on edit
set formatoptions-=a
" The t option causes text to autowrap when you reach at textwidth
set formatoptions-=t
" Set maximum text width (for wrapping)
set textwidth=80
" Folding options...
set foldlevel=1000
set foldcolumn=0


" Show (partial) commands (or size of selection in Visual mode) in the status
set showcmd
" When a bracket is inserted, briefly jump to a matching one
set showmatch
" Jump to matching bracket for 5/10th of a second (works with showmatch)
set matchtime=10
" Increase history size for use w/ q:
set history=1000
" Show status bar for all windows
set laststatus=2
" Determine what's saved in .viminfo, < is new name for ", wviminfo to write
" set viminfo='50,<1000,!,f1,s100
" set viminfo+=%
set viminfo='20,<50,s10
" When file args were passed, vim skips reading the buffer list, resulting
" in it being lost on exit.  So reread it with the arglist temporarily empty.
" Breaks on odd characters in files and occasionally otherwise.
let old_args = copy(argv())
if argc() > 0
  argdelete *
endif
" viminfo
for arg in old_args
  exe "argadd " . fnameescape(arg) . ""
endfor
if argc() > 0
  au VimEnter * argu 1 | filetype detect
endif

" Enable backups
" Note $VIM_MAIN_BACKUP_DIR is used in backup plugin,
" that build file path hierarhy and takes incremental
" snapshots
let $VIM_MAIN_BACKUP_DIR=expand("~/.vimbackups")
if !isdirectory($VIM_MAIN_BACKUP_DIR)
    silent! execute "!mkdir $VIM_MAIN_BACKUP_DIR"
endif

set backup
set backupdir=$VIM_MAIN_BACKUP_DIR

" If file is opened in read-only mode we can will write them as root
" :W
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


" local customizations
let $LOCALFILE=expand("~/.vimrc_extras")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
