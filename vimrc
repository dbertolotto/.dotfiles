"" Plugins (in separate file)
so ~/.vim/plugins.vim

"" redefine leader
let mapleader = ','

"" line handling
set wrap
map <leader>lw :set wrap!<cr>

"" selection
set showmatch       " Highlight matching brace
set mouse=a         " Enable mouse

"" searches
set hlsearch        " Highlight all search results
set smartcase       " Enable smart-case search
set ignorecase      " Always case-insensitive
set incsearch       " IncrementalsSearch for strings

"" indentation
set autoindent      " Auto-indent new lines
set expandtab       " Use spaces instead of tabs
set shiftwidth=2    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tabs
set softtabstop=2   " Number of spaces per Tab
set backspace=indent,eol,start  " Backspace behaviour

"" system
set ruler           " Show row and column ruler information
set laststatus=2    " Always show status bar
set noeb vb t_vb=   " Removes bell and visual bell effects
set undolevels=1000 " Number of undo levels

"" encoding
set encoding=utf-8

"" line numbers
set number
map <leader>ln :set nu!<cr>
map <leader>lr :set rnu!<cr>

"" color scheme
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
map <c-d> :NERDTreeToggle<cr>

"" tagbar (outline)
map <c-o> :TagbarToggle<cr>

"" rainbow parentheses
let g:rainbow_active = 0
map <leader>pr :RainbowToggle<cr>

"" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

"" YCM
let g:ycm_key_list_select_completion = ['<tab>']
let g:ycm_key_list_previous_completion = ['<s-tab>']
let g:ycm_key_list_stop_completion = ['<esc>']

"" Trigger configuration.
"" Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"" ale
let g:ale_fixers = {
      \ 'python' : ['autopep8', 'yapf'],
      \ 'go' : ['gofmt', 'goimports']
      \ }
