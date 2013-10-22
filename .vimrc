source ~/.vimrc.local

set nocompatible

set guioptions-=T
set wildmenu

" Pathogen
call pathogen#infect() 

" Simple vim configruations
set history=1000

" Color scheme
set background=dark
colorscheme slate

" Some random options
set autochdir          " Change directories to the current file
set showcmd            " Show (partial) command in status line.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes)
set scrolloff=5        " Start scrolling before bottom

" Tab completion (when not at start of line)
function TabOrComplete()
        let col = col('.')-1
        if !col || getline('.')[col-1] !~ '\k'
                return "\<tab>"
        else
                return "\<C-N>"
        endif
endfunction

inoremap <Tab> <C-R>=TabOrComplete()<CR>

" Allow use of ; instead of : in normal mode
nmap ; :

" Shift+enter to save files
nmap <silent> <S-Enter> :silent :confirm w<CR>
map <silent> <S-Enter> :silent :confirm w<CR>

" Mapleader commands/shortcuts
let mapleader = ","

map <silent> <leader>w :silent :NERDTree ~/www<CR>

" Single click to open directories
let g:NERDTreeMouseMode = 3

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction


