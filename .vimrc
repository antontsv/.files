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

" show commands in the status
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Jump to matching bracket for 5/10th of a second (used by showmatch)
set matchtime=5

" Increase history size for use w/ q:
set history=1000

" Show status bar for all windows
set laststatus=2

" Do not show mode, because airline will have it in the status line
set noshowmode

" Do not add two spaces from joining w/ J
set nojoinspaces

" case-insensitive search
set ignorecase
" switch to case-sensitive in mixed case is used in the search term
set smartcase

" copy indent from previous line for O and o
set autoindent
" smart indent around {} and certain keywords
set smartindent

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
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Settings for CTRL-P plugin
" open a ctrl-p search by pressing space
nnoremap [<Space> :CtrlPMixed<CR>
let g:ctrlp_show_hidden = 1

" Show NerdTree
nnoremap <Leader>f :NERDTreeToggle<CR>

" display line numbers and be relative to current line
set number
set relativenumber

" Airline settings for a status line customizations
set t_Co=256
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

" Get current color variant from management script
function! ColorMode(mode)
    if a:mode == "light"
        set background=light
    else
        set background=dark
    endif
endfunction

function! ApplyColorMode(...)
    if a:0 > 0
        let color_variant=a:1
    else
        let color_variant=system("$HOME/bin/color-mode-for-term")
        if v:shell_error
            " if no management script, fall back to env variable
            let color_variant=$TERM_COLOR_VARIANT
        endif
    endif
    call ColorMode(color_variant)
endfunction

function! ColorModeToggle()
    call ApplyColorMode(&background == 'dark' ? 'light' : 'dark')
endfunction

call ApplyColorMode()

nnoremap <Leader>c :call ColorModeToggle()<CR>
let g:solarized_contrast='high'
colorscheme solarized

" Learn homerow!
noremap <Up> :echom "Use k"<CR>
noremap <Down> :echom "Use j"<CR>
noremap <Left> :echom "Use h"<CR>
noremap <Right> :echom "Use l"<CR>

" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert
" set 'updatetime' just for insert mode / default is 4000 ms
au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
au InsertLeave * let &updatetime=updaterestore

" Go lang
let g:go_fmt_command = 'goimports'
if isdirectory($GOPATH . '/src/github.com/golang/lint/misc/vim')
    set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
endif

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" local customizations
let $LOCALFILE=expand("~/.vimrc_extras")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
