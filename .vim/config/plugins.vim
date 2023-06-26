" Plugins will be downloaded under the specified directory.
call plug#begin("~/.vim/plugged")

" Declare the list of plugins.
Plug 'junegunn/vim-plug'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" File Explorer for Vim
Plug 'weirongxu/coc-explorer'
" Indexes the file
Plug 'neoclide/coc-tabnine'
 " zsh integration
Plug 'tjdevries/coc-zsh'
" Smooth scrolling
Plug 'terryma/vim-smooth-scroll'
" Gruvbox theme
Plug 'morhetz/gruvbox'
" Syntastic
Plug 'vim-syntastic/syntastic'
" Airline
Plug 'vim-airline/vim-airline'
" Airline theme
Plug 'vim-airline/vim-airline-themes'
" Check shell syntax
Plug 'tomtom/checksyntax_vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
