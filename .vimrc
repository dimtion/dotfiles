" Vim rc file
" Reload it: `:so %`
" update the plugins: `:VundleInstall`
"

" At the start I've disabled the arrows to get used to hjkl
" I don't need such help now
noremap <Right> <Nop>
noremap <Left> <Nop>
" noremap <Down> <Nop>
" noremap <Up> <Nop>

" Plugins configuration
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'  
" Plugin 'chriskempson/base16-vim'                                                                                       
" Plugin 'scrooloose/nerdtree'                                                                                           
" Plugin 'Xuyuanp/nerdtree-git-plugin'                                                                                   
Plugin 'airblade/vim-gitgutter'                                                                                        
" Plugin 'yuttie/comfortable-motion.vim'                                                                                 
Plugin 'w0rp/ale'                                                                                                      
Plugin 'valloric/YouCompleteMe'
Plugin 'posva/vim-vue'                                                                                                 
" Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-fugitive' 
Plugin 'editorconfig/editorconfig-vim'                                                                                 
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-obsession'
Plugin 'junegunn/vim-easy-align'

" Plugin 'elixir-editors/vim-elixir'
" Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on

" Splitsmovement
nnoremap  
nnoremap  
nnoremap  

set splitbelow
set splitright

" Editing configuration
syntax on
set smartcase
set smarttab
set expandtab
set autoindent


" Search
set hlsearch
set ignorecase
set incsearch
set laststatus=2

" Status bar
set ruler
set showcmd

" Command bar
set wildignore=*.o,*~,*.pyc
set wildmenu

" spell error color
" To activate spelling: setlocal spell spelllang=fr
highlight SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00

" vim: set ft=vim :
