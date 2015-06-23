" File ~/.vim/ftplugin/markdown.vim
" $HOME/vimfiles/ftplugin/markdown.vim on Windows
" Markdown specific settings

set noexpandtab

" Need for vim-markdown-folding
if has("autocmd")
    filetype plugin indent on
endif

" Shortcut space to fold
nnoremap <Space> za

