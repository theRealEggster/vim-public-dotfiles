" Enables syntax highlighting
syntax on
" Set history to 1000 lines
set history=1000
" should auto reload a file if edited by someone else. But is buggy in cli.
set autoread
" Ignore case when searching
set ignorecase
" Except when the keyword contains atleast one uppercase letter
set smartcase
" Highlights search strings in file
set hlsearch
" Something with incrementally highlighting search results
set incsearch
" Highlights matching opening/closing bracker/braces etc
set showmatch
" Change <TAB> to insert 4 spaces instead of a TAB char
set expandtab
set shiftwidth=4
set softtabstop=2
" Set fold to manual so that -f works
set foldmethod=manual

" Disables numbered list to the right by default, -num to toggle
set nonu
" Sets it so you can copy and paste with ctrl+shift+c/v
set mouse=
" Wraps long lines
set wrap
" Enables airline bar at the bottom
set laststatus=2

" Save backups in .vim dir before you write to file 
" If editing lots of large files, setup a cronjob/systemd service to auto remove older files
set backup
set backupcopy=yes
set writebackup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=no

" Set the general theme and airline theme
let g:airline_theme='minimalist'
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" Make vim transparent
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
