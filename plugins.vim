call plug#begin('~/.vim/plugged')
" git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" utils
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar' 
Plug 'editorconfig/editorconfig-vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'mattn/emmet-vim'
"Plug 'tpope/vim-surround'
"Plug 'scrooloose/nerdcommenter'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'kovisoft/slimv'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" autocompletion engine
Plug 'valloric/youcompleteme'
" linting & fixing
Plug 'dense-analysis/ale'
" fancy statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" themes
Plug 'baskerville/bubblegum'
Plug 'sjl/badwolf'
call plug#end()
