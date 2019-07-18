" Dimtion's .vimrc file
" Reload it: `:so %`
" Update the plugins: `:PlugInstall`
"
" Some tips from the reddit wiki page .vimrc checklist:
" https://www.reddit.com/r/vim/wiki/vimrctips

" Nocompatible is useless since it is automatically set by Vim when it finds
" a .vimrc file. It may also override some necessary settings.
" set nocompatible


" Plugins configuration

" Auto installation of Plug
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
" I find coc slow and does not work as well as YCM+ale so I disable it for
" now.
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" vim-vue: Sometime the syntax highlight bugs: `:syntax sync fromstart`
Plug 'posva/vim-vue'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-obsession'
Plug 'junegunn/vim-easy-align'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'

" No longer used plugings
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'chriskempson/base16-vim'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'leafgarland/typescript-vim'
" Plug 'elixir-editors/vim-elixir'
" Plug 'rust-lang/rust.vim'
call plug#end()

""
"" Navigation
""

" At the start I've disabled the arrows to get used to hjkl
" I don't need such help now
noremap <Right> <Nop>
noremap <Left> <Nop>
" noremap <Down> <Nop>
" noremap <Up> <Nop>

" Splitsmovement
" Quicly move to left/right/top/bottom pane
nnoremap  
nnoremap  
nnoremap  

" I prefer this behavior of split
set splitbelow
set splitright

nnoremap <c-t> :tabnew<cr>

" Search
set hlsearch
set ignorecase
set incsearch
set laststatus=2

" Vim easy motion
let g:EasyMotion_smartcase = 1

" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" FZF
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Rg<cr>


""
"" Edition
""

" Tabulation configuration
syntax on
set smartcase
set smarttab
set expandtab
set autoindent

"" YouCompleteMe
" Disable <tab> since I don't like it and it interferes with UltraSnip
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

"" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

"" Ultrasnip
" Disable ultraSnip since we are using YouCompleteMe
inoremap <c-x><c-k> <c-x><c-k>

"" ALE
nmap <leader>f <Plug>(ale_fix)
nmap <leader>a <Plug>(ale_toggle_buffer)

let b:ale_fixers = {
\    'javascript': ['prettier', 'eslint'],
\    'python': ['black'],
\    'rust': ['rustfmt']
\}

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
command StripTrailingWhitespaces :call <SID>StripTrailingWhitespaces()

"" Coc specific configuration
" set updatetime=300

""
"" Display
""

" Status bar
set ruler
set showcmd

" Command bar
set wildignore=*.o,*~,*.pyc
set wildmenu

" spell error color
" To activate spelling: setlocal spell spelllang=fr
" TODO: Follow best practices from:
" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
highlight SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00

" Goyo settings (distraction free plugin)
let g:goyo_width=120
let g:goyo_height="95%"
nmap <leader>g :Goyo<CR>

"
" Custom commands
"

command Config :vsplit ~/.vimrc

" vim: set ft=vim :
