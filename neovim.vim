""""""""""""""""""""
" Install vim-plug "
""""""""""""""""""""

" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"""""""""""""""""""
" Install Plugins "
"""""""""""""""""""

call plug#begin()
Plug 'Mofiqul/dracula.nvim'
call plug#end()

"""""""""""""""""
" Configuration "
"""""""""""""""""

" Line numbers
set number

" Use the dracula theme. It's a bit redundant to turn on true colour mode for
" this, when my terminal *also* uses dracula. But it's nice for the
" consistency.
set termguicolors
colorscheme dracula

