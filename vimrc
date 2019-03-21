"" General
set number	" Show line numbers
"set linebreak	" Break lines at word (requires Wrap lines)
"set showbreak=+++	" Wrap-broken line prefix
"set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set noeb vb t_vb= "Removes bell and visual bell effects

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
set mouse=a     " Enable mouse

"" Advanced
set ruler	" Show row and column ruler information
 
"set backupdir=~/.vim/backup	" Backup directories
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" plugins (in separate file)
so ~/.vim/plugins.vim

" don't show anymore -- INSERT -- etc. since
" we are using lightline
set noshowmode

" lightline configuration
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'component_function': {
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   },
      \ }

" these functions make the status bar
" visible on small screens by cropping some
" information
function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
