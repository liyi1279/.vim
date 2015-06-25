" An example for a vimrc file.
"
" Author: from Bram Moolenaar and modified by Thomas Girke
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
"" Needed for vim-r-plugin
set runtimepath=~/Vim-R-plugin,~/.vim,$VIMRUNTIME,~/.vim/after

" sample settings for vim-r-plugin and screen.vim
" Installation 
"       - Place plugin file under ~/.vim/
"       - To activate help, type in vim :helptags ~/.vim/doc
"       - Place the following vim conf lines in .vimrc
" Usage
"       - Read intro/help in vim with :h vim-r-plugin or :h screen.txt
"       - To initialize vim/R session, start screen/tmux, open some *.R file in vim and then hit F2 key
"       - Object/omni completion command CTRL-X CTRL-O
"       - To update object list for omni completion, run :RUpdateObjList
" My favorite Vim/R window arrangement 
"	tmux attach
"	Open *.R file in Vim and hit F2 to open R
"	Go to R pane and create another pane with C-a %
"	Open second R session in new pane
"	Go to vim pane and open a new viewport with :split *.R
" Useful tmux commands
"       tmux new -s <myname>       start new session with a specific name
"	tmux ls (C-a-s)            list tmux session
"       tmux attach -t <id>        attach to specific session  
"       tmux kill-session -t <id>  kill specific session
" 	C-a-: kill-session         kill a session
" 	C-a %                      split pane vertically
"       C-a "                      split pane horizontally
" 	C-a-o                      jump cursor to next pane
"	C-a C-o                    swap panes
" 	C-a-: resize-pane -L 10    resizes pane by 10 to left (L R U D)
" Corresponding Vim commands
" 	:split or :vsplit      split viewport
" 	C-w-w                  jump cursor to next pane-
" 	C-w-r                  swap viewports
" 	C-w C-++               resize viewports to equal split
" 	C-w 10+                increase size of current pane by value

" To open R in terminal rather than RGui (only necessary on OS X)
" let vimrplugin_applescript = 0
" let vimrplugin_screenplugin = 0
" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell' 
" instruct to use your own .screenrc file
let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R 
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
"set expandtab
set shiftwidth=4
set tabstop=8
" start R with F2 key
map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" set folding scheme; more on this see: 
" http://www.dgp.toronto.edu/~mjmcguff/learn/vim/folding.txt
" http://vim.dindinx.net/orig/usr_28.txt
"set foldcolumn=0 " if set to > 1 together with 'set number', then the copy&paste of screen will include the line numbers
"highlight Folded ctermfg=yellow ctermbg=blue  	
" highlight  works only when colorscheme is uncommented
"set foldmethod=indent
"hi FoldColumn ctermbg=NONE

" For Latex work: open *.pdf files in evince/xpdf upon opening of *.tex files in vim 
" more on this on this page: http://ubuntuforums.org/showthread.php?p=5351607
au BufRead *.tex silent !xpdf %<.pdf 2>/dev/null &
au BufRead *.Rnw silent !xpdf %<.pdf 2>/dev/null &

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" Sort function from Gerald Lai at http://www.vim.org/tips/tip.php?tip_id=923 (use last
" script on page, not first!!!!!).
" paste in vimrc file - tested with GVim 6.3

""** use visual block <Ctrl-V> to select lines to sort and hit <F3> **
"vmap <F3> :call Sort(Prompt("0","1"),Prompt("1","f"),"Strcmp")<CR>
"
""sort lines function
"function Sort(wnum, order, cmp) range
"  normal `<
"  execute "let startcol = col(\".\")"
"  normal `>
"  execute "let endcol = col(\".\")"
"  if startcol <= endcol
"    let firstcol = startcol
"    let lastcol = endcol
"  else
"    let firstcol = endcol
"    let lastcol = startcol
"  endif
"
"  call SortR(a:firstline, a:lastline, firstcol, lastcol, a:wnum, a:order, a:cmp)
"  normal gv
"endfunction
"
""sort lines recursively
"function SortR(start, end, first, last, wnum, order, cmp)
"  if a:start >= a:end
"    return
"  endif
"
"  let partition = a:start - 1
"  let middle = partition
"  let partstr2 = Words2(getline((a:start + a:end) / 2), a:first, a:last, a:wnum)
"  let i = a:start
"
"  while i <= a:end
"    let str = getline(i)
"    let partstr = Words2(str, a:first, a:last, a:wnum)
"    if a:order == "r"
"      execute "let result = ".a:cmp."(partstr2, partstr)"
"    else
"      execute "let result = ".a:cmp."(partstr, partstr2)"
"    endif
"
"    if result <= 0
"      "swap i before partition
"      let partition = partition + 1
"
"      if result == 0
"        let middle = partition
"      endif
"
"      if i != partition
"        let str2 = getline(partition)
"        call setline(i, str2)
"        call setline(partition, str)
"      endif
"    endif
"
"    let i = i + 1
"  endwhile
"
"  "make sure middle element at end of partition
"  if middle != partition
"    let str = getline(middle)
"    let str2 = getline(partition)
"    call setline(middle, str2)
"    call setline(partition, str)
"  endif
"
"  call SortR(a:start, partition - 1, a:first, a:last, a:wnum, a:order, a:cmp)
"  call SortR(partition + 1, a:end, a:first, a:last, a:wnum, a:order, a:cmp)
"endfunction
"
""determine compare strings
"function Words2(line, first, last, wnum)
"  if a:wnum == "v"
"    return strpart(a:line, a:first - 1, a:last - a:first + 1)
"  elseif a:wnum > 1
"    return strpart(a:line, matchend(a:line, "\\s*\\(\\S*\\s*\\)\\{".(a:wnum - 1)."}"))
"  elseif a:wnum == 1
"    return strpart(a:line, matchend(a:line, "\\s*"))
"  elseif a:wnum < 0
"    return matchstr(a:line, "\\(\\S*\\s*\\)\\{".(-a:wnum)."}$")
"  else
"    return a:line
"  endif
"endfunction
"
""compare two strings
"function Strcmp(str1, str2)
"  if a:str1 < a:str2
"    return -1
"  elseif a:str1 > a:str2
"    return 1
"  else
"    return 0
"  endif
"endfunction
"
""prompt user for settings
"function Prompt(str, ...)
"  let default = a:0 ? a:1 : ""
"  if a:str == "0"
"    let str = "Sort by which word [(0)whole line (<0)count from right (v)isual]? "
"  elseif a:str == "1"
"    let str = "Order [(f)orward (r)everse]? "
"  endif
"
"  execute "let ret = input(\"".str."\", \"".default."\")"
"
"  return ret
"endfunction 
"
