" Install Plugged if it is not

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start using vimplugged
call plug#begin('~/.vim/plugged')

" Install Plugs
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'dylanaraps/wal.vim'

" Initialize plugin system
call plug#end()

" End vimplugged


" Plugin Settings

" Airline
  set laststatus=2
  "When there's only one tab, show buffer list in tab bar
  let g:airline#extensions#tabline#enabled=1
  "Remove Buffers label from top right
  let g:airline#extensions#tabline#buffers_label=''
  "show buffer number
  let g:airline#extensions#tabline#buffer_idx_mode=1

"GitGutter
"Update the gutter diffs a bit quicker
  set updatetime=500

"Pywal
  colorscheme wal


"Show line numbers
set number

"Show currently typed command
set showcmd

syntax on

"Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set ignorecase
set smartcase
set fillchars+=vert:\

"Always show one line above/below cursor
set scrolloff=1

"Wild Menu in Tab complete
set wildmode=longest,list
set wildmenu

"Leaves open current buffer when opening another
set hidden

"Enable mouse
set mouse=a

"Ctrl-W always deletes previous words
set backspace=indent,eol,start
