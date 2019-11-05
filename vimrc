"" General
"set linebreak	" Break lines at word (requires Wrap lines)
"set showbreak=+++	" Wrap-broken line prefix
"set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set noeb vb t_vb= "Removes bell and visual bell effects

" searches
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
set laststatus=2 " Always show status bar

"" Advanced
set ruler	" Show row and column ruler information
 
"set backupdir=~/.vim/backup	" Backup directories
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"" encoding
set encoding=utf-8

"" redefine leader
let mapleader = ','

"" Show line numbers
set number relativenumber
map <leader>ln :set nu!<cr>
map <leader>lr :set rnu!<cr>

"" Plugins (in separate file)
so ~/.vim/plugins.vim

"" Colorscheme
"colorscheme bubblegum-256-dark
colorscheme badwolf

"" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_theme='bubblegum'
let g:airline_theme='badwolf'

"" fuzzy finder
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND = 'find * -type f'
map <leader>f. :FZF .<cr> 
map <leader>fh :FZF ~<cr> 

"" nerdtree
map <leader>o :NERDTreeToggle<cr>

"" rainbow parentheses
let g:rainbow_active = 0
map <leader>pr :RainbowToggle<cr>

"" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

"" tagbar
map <leader>t :TagbarToggle<cr>

