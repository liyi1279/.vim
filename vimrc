" File ~/.vimrc
" $HOME/_vimrc on windows
"" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
source ~/.vim/bundle/Vundle.vim

filetype off                        "Necessary for install vundles
set rtp+=~/.vim/bundle/Vundle.vim   "Set the runtime path to include Vundle and initialize
call vundle#begin() 
Plugin 'gmarik/Vundle.vim'          "Let Vundle manage Vundle, required

" =============== Vundle Plugins ===============
"" plugin on GitHub repo
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'tpope/vim-markdown'
"" plugin from http://vim-scripts.org/vim/scripts.html
"plugin 'Wombat'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
" all of plugins must be added before the following line
call vundle#end()
filetype plugin indent on


" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
"syntax enable                   "Keep current color setting
syntax on                      "Let vim to overrule your setting with default

" The mapleader has to be set before vundle starts loading all the plugins
let mapleader=","
" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent      "only indent as same as obove line
set smartindent     "after if, for, et.al. can auto indent
set smarttab
set shiftwidth=2
set softtabstop=2   "only affact tab but not indent
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=eol:¬,tab:▸\ ,trail:.,

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Color ===========================
"" mkdir -p ~/.vim/colors && cd ~/.vim/colors
"" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod
set guifont=Menlo\ Regular:h16

" ================ Custom Settings ========================
"

"""""""""""""""""""""""""""""""""""""""


"" Sample .vimrc file by Martin Brochhaus
""" modified by LI YI
""" Presented at 2014
""" Introduction Video in "http://www.youtube.com/watch?v=YhqsjUUHj6g"
"
"
""" Automatic reloading of .vimrc
"autocmd! bufwritepost .vimrc source %
"
"
""" NOT work"""
""" Better copy & paste
""" When you want to paste large blocks of code into vim, press F2 before you
""" paste. At the bottom you should see ``-- INSERT (paste) --``.
"" set pastetoggle=<F2>
"" set clipboard=unnamed
"
"
""" Mouse and backspace
""set mouse=a  " on OSX press ALT and click
""" NOT work
"" set bs=2     " make backspace behave like normal again
"

"
"
"
""" Bind nohl
""" Removes highlight of your last search
""" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
""" noremap <C-n> :nohl<CR>
""" vnoremap <C-n> :nohl<CR>
""" inoremap <C-n> :nohl<CR>
"
"
""" Quicksave command
""" should find anther one
""" noremap <C-s> :update<CR>
""" vnoremap <C-Z> <C-C>:update<CR>
""" inoremap <C-Z> <C-O>:update<CR>
"vnoremap ,s :w<cr>
"
"
""" Quick quit command
""" should find anther one
"""" noremap <Leader>e :quit<CR>  " Quit current window
"""" noremap <Leader>E :qa!<CR>   " Quit all windows
"
"
""" bind Ctrl+<movement> keys to move around the windows, instead of using
""Ctrl+w + <movement>
""" Every unnecessary keystroke that can be saved is good for your health :)
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h
"
"
""" easier moving between tabs
""" or gt for next, gT for pevious, #gt for number # tab
"map <Leader>n <esc>:tabprevious<CR>
"map <Leader>m <esc>:tabnext<CR>
"
"
""" map sort function to a key
"""" vnoremap <Leader>s :sort<CR>
"
"
""" easier moving of code blocks
""" Try to go into visual mode (v), thenselect several lines of code here and
""" then press ``>`` several times.
"vnoremap < <gv  " better indentation
"vnoremap > >gv  " better indentation
"
"
""" Show whitespace
""" MUST be inserted BEFORE the colorscheme command
""" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
""" au InsertLeave * match ExtraWhitespace /\s\+$/
"
""" Show special character 
""
""
"
"
"
"
""" autocmd InsertEnter * :set number
""" autocmd InsertLeave * :set relativenumber
"""" set tw=79   " width of document (used by gd)
"""" set fo-=t   " don't automatically wrap text when typing
"""" set colorcolumn=80
"""" highlight ColorColumn ctermbg=233
"
"
""" easier formatting of paragraphs
"""" vmap Q gq
"""" nmap Q gqap
"
"
""" Useful settings
"set undolevels=700
"
"
""" Real programmers don't use TABs but spaces
"set shiftround
"
"
"
"
"
"
"" ============================================================================
"" " Python IDE Setup
"" "
"" ============================================================================
""
""
"" " Settings for vim-powerline
"" " cd ~/.vim/bundle
"" " git clone git://github.com/Lokaltog/vim-powerline.git
"set laststatus=2
""
""
"" " Settings for ctrlp
"" " cd ~/.vim/bundle
"" " git clone https://github.com/kien/ctrlp.vim.git
"let g:ctrlp_max_height = 30
"set wildignore+=*.pyc
"set wildignore+=*_build/*
"set wildignore+=*/coverage/*
"let g:ctrlp_working_path_mode = 'ra'
""
""
"" " Settings for python-mode
"" " Note: I'm no longer using this. Leave this commented out
"" " and uncomment the part about jedi-vim instead
"" " cd ~/.vim/bundle
"" " git clone https://github.com/klen/python-mode
"" "" map <Leader>g :call RopeGotoDefinition()<CR>
"" "" let ropevim_enable_shortcuts = 1
"" "" let g:pymode_rope_goto_def_newwin = "vnew"
"" "" let g:pymode_rope_extended_complete = 1
"" "" let g:pymode_breakpoint = 0
"" "" let g:pymode_syntax = 1
"" "" let g:pymode_syntax_builtin_objs = 0
"" "" let g:pymode_syntax_builtin_funcs = 0
"" "" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
""
"" " Settings for jedi-vim
"" " cd ~/.vim/bundle
"" " git clone git://github.com/davidhalter/jedi-vim.git
"" "" let g:jedi#usages_command = "<leader>z"
"" "" let g:jedi#popup_on_dot = 0
"" "" let g:jedi#popup_select_first = 0
"" "" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
""
"" " Better navigating through omnicomplete option list
"" " See
"" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" "" set completeopt=longest,menuone
"" "" function! OmniPopup(action)
"" ""     if pumvisible()
"" ""         if a:action == 'j'
"" ""             return "\<C-N>"
"" ""         elseif a:action == 'k'
"" ""             return "\<C-P>"
"" ""         endif
"" ""     endif
"" ""     return a:action
"" "" endfunction
""
"" "" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" "" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
""
""
""" Python folding (Be instead of default folding method)
""" mkdir -p ~/.vim/ftplugin
""" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
""" set nofoldenable
