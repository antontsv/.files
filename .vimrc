" just pure vim, no vi compatible mode
set nocompatible

" init pathogen (for plugins in ~/.vim/bundle)
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Enable loading filetype
filetype plugin on

" Turn syntax highlighting on
syntax on

" When auto-completing, insert longest common prefix, and list all options
" When not configured, CTRL-L and CTRL-D do those tasks, respectively
set wildmode=longest:list

" show line and column number of the cursor position in status line
set ruler 

" Incremental search (show matches as you type search string)
set incsearch

" Don't highlight results of a search (when not searching anymore)
set nohlsearch

" Use F5 to toggle 'paste' mode, faster than :set paste / :set paste&
set pastetoggle=<F5>

" Use 4 spaces for (auto)indent, with cindent, <<, >>
set shiftwidth=4

" Spaces to show for <Tab> and replace when using :retab
set tabstop=4

" Replaces a tab with a series of spaces in insert mode
" to insert a real tab the following should be used: CTRL-V<Tab>
set expandtab

" Mostly regarding automatic white-space handling see |fo-table|
" c - to autowrap comment lines to a set textwidth
" r - when writing a comment and going to a new line, comment leader is added
" o - add comment leader when starting an edit on a comment using 'o' command
" n - recognize numbered lists: 1. 2., 3: 4: and indent them automatically
" l - existing long lines are not automatically formatted to textwidth if edited
set formatoptions+=croqln

" The a option is what reworks the spacing of entire paragraph on edit
set formatoptions-=a

" The t option causes text to autowrap when you reach at textwidth
set formatoptions-=t

" Set maximum text width (for wrapping)
set textwidth=80

" Folding options
set foldlevel=1000
set foldcolumn=0

" Show (partial) commands (or size of selection in Visual mode) in the status
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Jump to matching bracket for 5/10th of a second (used by showmatch)
set matchtime=5

" Increase history size for use w/ q:
set history=1000

" Show status bar for all windows
set laststatus=2

" Determine what's saved in .viminfo
" remember marks for the last 20 files,
" save max 50 lines for each registry up to 10Kb
set viminfo='20,<50,s10

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

" Use TAB as an ESC
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>

" Settings for CTRL-P plugin
" open a ctrl-p search by pressing space
nnoremap <Space> :CtrlPMixed<CR>
let g:ctrlp_show_hidden = 1

" local customizations
let $LOCALFILE=expand("~/.vimrc_extras")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
