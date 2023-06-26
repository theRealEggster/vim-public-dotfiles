" Every bind that starts with a dash (-) is typed out in command mode
"
"
" Open .vimrc in a split window
nnoremap -ev :vsplit $MYVIMRC<CR>
nnoremap -ek :vsplit ~/.vim/config/keybinds.vim<CR>
nnoremap -ed :vsplit ~/.vim/config/defaults.vim<CR>
nnoremap -ef :vsplit ~/.vim/config/functions.vim<CR>
nnoremap -ep :vsplit ~/.vim/config/plugins.vim<CR>
nnoremap -ec :vsplit ~/.vim/config/coc-stuff.vim<CR>
nnoremap -help :vsplit ~/.vim/config/help.vim<CR>

" Disable highlighted search
nnoremap -n :noh<CR>
" Source .vimrc and reload config
nnoremap -sv :source $MYVIMRC<CR>

" :wq!
nnoremap -w :w!<CR>
" :q!
nnoremap -q :q!<CR>
" x
nnoremap -x :x!<CR>
" :noh 
nnoremap -n :noh<CR>
" Allows opening/closing folds with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" Automatically folds all bash functions (or anything between { and }). There
" is also a function that auto saves folds between sessions (check -ef)
nnoremap -f :%g/^}/ norma! zf%<cr>

" Binds toggling numbers to -num
nnoremap  -num :set nonu! <CR>

" Bind spellcheck (english only) to -spell
nnoremap -spell :setlocal spell! spelllang=en_us <CR>

" Bind F1 to php syntax check of current file
map <F1> :!php -l %<CR>

" Bind F2 to delete all empty lines
map <F2> :%g/^$/d

" Binds -u to toggle between lower/upper case per word.
nnoremap -u g~iw<CR>
" 
" Changes themes between monokai and gruvbox with -c or -g
nnoremap -c :colo monokai<CR>
nnoremap -g :colo gruvbox<CR>

" Set some timestamp aliases:
" type -date or -time in command mode to insert date or time
" type ddate or ttime in insert mode to insert date or time
" type -shortdate or sshortdate in normal or insert mode to insert date + time
noremap -date "=strftime("%Y-%m-%d  ")<CR>P
iab <expr> ddate strftime("%Y-%m-%d")
noremap -time "=strftime("%H:%M:%S  ")<CR>P
iab <expr> ttime strftime("%H:%M:%S")
noremap -shortdate "=strftime("%Y-%m-%d %H:%M  ")<CR>P
iab <expr> sshortdate strftime("%Y-%m-%d %H:%M ")

" Adds smoth  scrolling with ctrl+hjkl in command mode
noremap <silent> <c-k> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-j> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-h> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-l> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Change filetype to UTF8
" Depends on a function in $VIM/config/functions
nnoremap -utf8 :call ChangeToUTF8()<cr>

