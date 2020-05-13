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
"Plug 'jiangmiao/auto-pairs'

" text editing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

" clojure
"Plug 'tpope/vim-salve'
"Plug 'tpope/vim-projectionist'
"Plug 'tpope/vim-dispatch'
"Plug 'tpope/vim-fireplace'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" autocompletion engine
"Plug 'valloric/youcompleteme', { 'do': '~/.vim/ycm-install.sh' }

" completion/lsp
"Plug 'natebosch/vim-lsc'
"Plug 'ajh17/VimCompletesMe'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'

" linting & fixing
"Plug 'dense-analysis/ale'

" fancy statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" themes
Plug 'baskerville/bubblegum'
Plug 'sjl/badwolf'

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
