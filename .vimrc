" Vim rc file
" Reload it: `:so %`
" update the plugins: `:PlugInstall`
"

set nocompatible

" At the start I've disabled the arrows to get used to hjkl
" I don't need such help now
noremap <Right> <Nop>
noremap <Left> <Nop>
" noremap <Down> <Nop>
" noremap <Up> <Nop>

" Plugins configuration

" Auto installation of plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'airblade/vim-gitgutter'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'
Plug 'valloric/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" Sometime the syntax highlight bugs: `:syntax sync fromstart`
Plug 'posva/vim-vue' "
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-obsession'
Plug 'junegunn/vim-easy-align'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'

" Plug 'yuttie/comfortable-motion.vim'
" Plug 'chriskempson/base16-vim'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'leafgarland/typescript-vim'
" Plug 'elixir-editors/vim-elixir'
" Plug 'rust-lang/rust.vim'
call plug#end()

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

"
" Plugins configuration
"

"" Coc specific configuration
" set updatetime=300

"" YouCompleteMe
" Disable <tab> since I don't like it and it interferes with UltraSnip
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

"" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

"" Vim easy motion
let g:EasyMotion_smartcase = 1

" Quickly move to a position
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

"" Ultrasnip
" Disable ultraSnip since we are using YouCompleteMe
inoremap <c-x><c-k> <c-x><c-k>

"
" Custom commands
"

command Config :vsplit ~/.vimrc

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
command StripTrailingWhitespaces :call <SID>StripTrailingWhitespaces()


" vim: set ft=vim :
