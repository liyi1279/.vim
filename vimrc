" File ~/.vimrc
" $HOME/_vimrc on windows
"" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" The mapleader has to be set before vundle starts loading all the plugins
let mapleader=","
let maplocalleader=","

" =============== Vundle Initialization ===============

filetype off                        "Necessary for install vundles
set rtp+=~/.vim/bundle/Vundle.vim   "Set the runtime path to include Vundle and initialize
call vundle#begin() 
Plugin 'gmarik/Vundle.vim'          "Let Vundle manage Vundle, required

" =============== Vundle Plugins ===============
"" plugin on GitHub repo
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'tpope/vim-markdown'
"Plugin 'ervandew/screen'            "Split shell in vim
Plugin 'vim-scripts/Vim-R-plugin'            "communication from vim-r-plugin to r
"" plugii from http://vim-scripts.org/vim/scripts.html
"Plugin 'Vim-R-plugin'
"Plugin 'Wombat'
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

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowritebackup

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
set shiftwidth=4
set softtabstop=4   "only affact tab but not indent
set tabstop=4
set expandtab

filetype on
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
"
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
" R script settings
"

vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
let vimrplugin_applescript=0
let vimrplugin_vsplit=1

