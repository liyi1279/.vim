" as vim
set nocompatible 

" need for vim-markdown-folding
if has("autocmd")
    filetype plugin indent on
endif

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " or call vundle#begin('~/some/path/here/to/install/plugins/'
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"" plugin on GitHub repo
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'tpope/vim-markdown'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
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


set guifont=Menlo\ Regular:h14
""set background=dark " background is dark steries
""highlight Folded guibg=#a0a0a0 guifg=blue
""colorscheme elflord
set nobackup " could be use git as a replacement
set ruler " show col and row num
set nu " set number and relative number
set showcmd " show cmd 
""

"""set showmode " default on in vim show insert / normal mode
""set scrolloff=3 " show 3 line above or follow cursor
set backspace=indent,eol,start " use backspace in indent , end of line, or start
""
"""search config
""set showmatch
""set hlsearch
""set incsearch
""set ignorecase
""set smartcase
""
""set expandtab
""set smarttab
set smartindent
""
""
""
""
""set number
""
nmap ,r :!python %<cr>

""
set softtabstop=4 "only afface tab but not indent
"""set ts=4 "cause indent error in python
""set sw=4
""
set smartindent " after if,for,etal can auto indent
set autoindent "only indent as same as above line
""
""set nowritebackup
""set noswapfile
""set mouse=a
""map <ScrollWheelUp> <C-Y>
""map <ScrollWheelDown> <C-E>


"""""""""""""""""""""""""""""""""""""""


"" Sample .vimrc file by Martin Brochhaus
"" modified by LI YI
"" Presented at 2014
"" Introduction Video in "http://www.youtube.com/watch?v=YhqsjUUHj6g"


"" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


"" NOT work"""
"" Better copy & paste
"" When you want to paste large blocks of code into vim, press F2 before you
"" paste. At the bottom you should see ``-- INSERT (paste) --``.
" set pastetoggle=<F2>
" set clipboard=unnamed


"" Mouse and backspace
set mouse=a  " on OSX press ALT and click
"" NOT work
" set bs=2     " make backspace behave like normal again
""set backspace=indent,eol,start " use backspace in indent , end of line, or start

"" Rebind <Leader> key
"" I like to have it here becuase it is easier to reach than the default and
"" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


"" Configure of research
"" --> Highlight & Increment & Case incasentive
"" /"search" <CR> : to search; <n>: next ; <N> perious
" set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase


"" Bind nohl
"" Removes highlight of your last search
"" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" noremap <C-n> :nohl<CR>
"" vnoremap <C-n> :nohl<CR>
"" inoremap <C-n> :nohl<CR>


"" Quicksave command
"" should find anther one
"" noremap <C-s> :update<CR>
"" vnoremap <C-Z> <C-C>:update<CR>
"" inoremap <C-Z> <C-O>:update<CR>
vnoremap ,s :w<cr>


"" Quick quit command
"" should find anther one
""" noremap <Leader>e :quit<CR>  " Quit current window
""" noremap <Leader>E :qa!<CR>   " Quit all windows


"" bind Ctrl+<movement> keys to move around the windows, instead of using
"Ctrl+w + <movement>
"" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


"" easier moving between tabs
"" or gt for next, gT for pevious, #gt for number # tab
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


"" map sort function to a key
""" vnoremap <Leader>s :sort<CR>


"" easier moving of code blocks
"" Try to go into visual mode (v), thenselect several lines of code here and
"" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


"" Show whitespace
"" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/

"" Show special character 
set list
set list listchars=eol:¬,tab:▸\ ,trail:.,
"
"
"" Color scheme
"" mkdir -p ~/.vim/colors && cd ~/.vim/colors
"" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


"" Enable syntax highlighting
"" You need to reload this file for the change to apply
"" may not be needed
"" filetype off  
filetype plugin indent on
syntax on


"" Showing line numbers and length
"" absort number in Insert Mode, and relative number in Normal Mode
set nu rnu
"" set rnu
"" autocmd InsertEnter * :set number
"" autocmd InsertLeave * :set relativenumber
""" set tw=79   " width of document (used by gd)
""" set nowrap  " don't automatically wrap on load
""" set fo-=t   " don't automatically wrap text when typing
""" set colorcolumn=80
""" highlight ColorColumn ctermbg=233


"" easier formatting of paragraphs
""" vmap Q gq
""" nmap Q gqap


"" Useful settings
set history=700
set undolevels=700


"" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


"" Disable stupid backup and swap files - they trigger too many events
"" for file system watchers
set nobackup
set nowritebackup
set noswapfile


"" Setup Pathogen to manage your plugins and automaticly update help tags
"" mkdir -p ~/.vim/autoload ~/.vim/bundle
"" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
"" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
Helptags



" ============================================================================
" " Python IDE Setup
" "
" ============================================================================
"
"
" " Settings for vim-powerline
" " cd ~/.vim/bundle
" " git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
"
"
" " Settings for ctrlp
" " cd ~/.vim/bundle
" " git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
let g:ctrlp_working_path_mode = 'ra'
"
"
" " Settings for python-mode
" " Note: I'm no longer using this. Leave this commented out
" " and uncomment the part about jedi-vim instead
" " cd ~/.vim/bundle
" " git clone https://github.com/klen/python-mode
" "" map <Leader>g :call RopeGotoDefinition()<CR>
" "" let ropevim_enable_shortcuts = 1
" "" let g:pymode_rope_goto_def_newwin = "vnew"
" "" let g:pymode_rope_extended_complete = 1
" "" let g:pymode_breakpoint = 0
" "" let g:pymode_syntax = 1
" "" let g:pymode_syntax_builtin_objs = 0
" "" let g:pymode_syntax_builtin_funcs = 0
" "" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
" " Settings for jedi-vim
" " cd ~/.vim/bundle
" " git clone git://github.com/davidhalter/jedi-vim.git
" "" let g:jedi#usages_command = "<leader>z"
" "" let g:jedi#popup_on_dot = 0
" "" let g:jedi#popup_select_first = 0
" "" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
" " Better navigating through omnicomplete option list
" " See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" "" set completeopt=longest,menuone
" "" function! OmniPopup(action)
" ""     if pumvisible()
" ""         if a:action == 'j'
" ""             return "\<C-N>"
" ""         elseif a:action == 'k'
" ""             return "\<C-P>"
" ""         endif
" ""     endif
" ""     return a:action
" "" endfunction
"
" "" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" "" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
"
"
"" Python folding (Be instead of default folding method)
"" mkdir -p ~/.vim/ftplugin
"" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable
"" Default Python folding:
"set foldmethod=indent
