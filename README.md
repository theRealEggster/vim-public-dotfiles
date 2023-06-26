This is my simple vim config.  

It includes auto backup before writing to a file.  
It has all .swp files sorted into a static folder instead of cluttering down everywhere.  
It has a function or two i use here and there  
It has the plugin manager Plugged with few plugins like coc and airline and my theme (gruvbox)  
It has quite a few keybindings.  
And lastly i try to save all commands i come upon that is useful for me in the help file  


The .vimrc only contains of includes to smaller config files inn ~/.vim/config/*  

The following commands opens up corresponding config file in a split window, and changes can be sources with '-sv'  
In normal mode press:  
    -ed = Default config where most "set" commands reside  
    -ek = The keybindings file  
    -ef = The function file  
    -ec = The coc config file  
    -ep = The plugged plugins file  
    -help = The cheat sheet file, (the help file)  

Worth mentioning is that i use sway as window manager and Alacritty as my terminal. I use transparent terminals but for some reason when i opened vim the background went solid, so the last line in the default file solved that problem.
