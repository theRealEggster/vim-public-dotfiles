" Some keybindings
" open each file in a split window with:
" -ed = defaults
" -ef = funtions
" -ek = keybinds
" -ep = plugins
" -ec = coc
" -help = help file
" Quit or write quit with following:
" -w
" -q


"""""""""""""""""""""""""""""""""""
" How To                        """
""""""""""""""""""""""""""""""""""" 
" IncrementNumbers: mark lines with V, then g ctrl+a to increment a list of numbers
" SwitchWindows: ctrl+w w
" MoveToNextChar: f+<char> ; to repeat and move forward , to move backwards
" MoveHalfway: 50%
" MoveHalfPageDown: ctrl+j
" MoveHalfPageUp: ctrl+k
" ToggleUpperLowerCase: ~
" MoveToNextWord: W
" MoveToPrevWord: B
" ReplaceWord: cw
" VisualyMarLines: V
" VisualyMarkBlock: ctrl+v
" FormatAsColumn: visual mark then :% !column -t
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Some basic stuff for vim everyone should now.  """
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" w = move to start of next word
" W = move to start of next token
" b = move to start of previous word
" B = move to start of previous token
"
" h j k l = DONT USE THE FUCKING ARROW KEYS :D when vim was made, arrow keys didn't exist so the choose the homerow keys h j k l for movement
" h = left
" j = down
" k = up
" l = right
" 
" For all the above and most commands you can preface the command with a number and it will repeat n times, ex: 10dd = delete 10 lines, 100j = move down 100 lines and so on.
" 
" This one is super useful, i use it all the time, prob my most used replace command:
" cw = replace current word. Example sentence: "The brown fox jumped over the road", if you want to replace fox with bear, type 2wcwbear<ESC> (set the cursor on the first letter of the word, then cw which removes the word and enter insert mode so you can type.
" 
" u = undo
" ctrl+r = redo 
" 0 = move to start of line
" $ = move to end of line
" G = move to end of file
" gg = move to top of file
" 10G = move to line 10
" 
" How to manipulate text like a pro, everyone now of a and i, append and insert but you can also do:
" A = append at the end of line
" I = insert at the begining of line
" J = Merge the line below to current line (VERY USEFUL!!!)
" . = repeat the last command (ALSO VERY HANDY). If you are inserting text here and there, instead of doing "i mytexthere" just press . and it will do it for you.
" yy = yank one line (copy)
" 20yy = yank 20 lines (copy)
" p = paste after cursor
" P = paste before the cursor
" dt" = clear everything from cursor to "
" dd = remove line
" 20dd = remove 20 lines
" D = remove everything to the right of the cursor
" r = replace one character
" 
" How to visually mark text, like if you want to delete some lines, instead of counting how many lines there is you can do "V" to visually mark the lines you want and then press dd to remove them (or yy if you want to move the section somewhere else)
" v = visually mark starting from cursor
" V = visually mark lines
" ctrl v = visually mark a block of text.
" This last one is very usefull for example commenting out a block of code. Start at the beginning of a line, press ctrl+v, move down to the last line, press I followed by #, then <ESC> and it will preface all lines with a # (or press x to remove the # from all lines
