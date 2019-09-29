" Dimtion's .vimrc file
" Reload it: `:so %`
" Update the plugins: `:PlugInstall`
"
" Some tips from the reddit wiki page .vimrc checklist:
" https://www.reddit.com/r/vim/wiki/vimrctips

" Nocompatible is useless since it is automatically set by Vim when it finds
" a .vimrc file. It may also override some necessary settings.
" set nocompatible


""
"" Plugins declaration
""

" Auto installation of Plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'

" Replaced my old friend gitgutter by signify which works much better.
" Some shortcuts:
"" ]c next hunk
"" [c previous hunk
"" More help :h signify-modus-operandi
Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'

" Show vim tree of undo in a a panel
Plug 'mbbill/undotree'

" Using ALE+YouCompleteMe for linting, formating and code completion and
" navigation
Plug 'w0rp/ale'
Plug 'valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" I find coc slow and does not work as well as YCM+ale so I disable it for
" now.
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" Very useful for group projects without a formater
" See: https://editorconfig.org/
Plug 'editorconfig/editorconfig-vim'

" vim-vue: Sometime the syntax highlight bugs: `:syntax sync fromstart`
Plug 'posva/vim-vue'

" Git wrapper
Plug 'tpope/vim-fugitive'

" [count]<space> Toggle comment
" [count]<leader>c<space> Toggle comment
" [count]<leader>cc Comment the current line
" [count]<leader>cu Uncomment the current line
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-obsession'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'

" distraction free toggle
Plug 'junegunn/goyo.vim'

" Colors
Plug 'chriskempson/base16-vim'

" Display marks and add some shortcuts
"  ]' Jump to start of next line containing a mark
"  [' Jump to start of prev line containing a mark
Plug 'kshenoy/vim-signature'


" No longer used plugings
" Plug 'junegunn/vim-easy-align'
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

" Open new tab with <c-t>
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

" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up.
let g:fzf_history_dir = '~/.local/share/fzf-history'

""

"" Edition
""

" Tabulation configuration
syntax on
set smartcase
set smarttab
set expandtab
" set autoindent

" shortcut for paste mode
nnoremap <leader>p :set invpaste paste?<CR>

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

"" Undotree
nnoremap <leader>u :UndotreeToggle<cr>:UndotreeFocus<cr>

" For some reason the automatic detection fails often, so it needs to be
" forced
let g:ale_fixers = {
\    'javascript': ['prettier', 'eslint'],
\    'python': ['black', 'isort'],
\    'rust': ['rustfmt']
\}

" This function is helpful for some filetypes incompatible with ale_fixer
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
command StripTrailingWhitespaces :call <SID>StripTrailingWhitespaces()

"" Coc specific configuration
" set updatetime=300

" [experiment] map space to comment toggle
nnoremap <space> :call NERDComment(0,"toggle")<CR>
vnoremap <space> :call NERDComment(0,"toggle")<CR>


""
"" Display
""

"" Theme
" let base16colorspace=256
" set termguicolors
" use 256 colors in Console mode if we think the terminal supports it
if &term =~? 'mlterm\|xterm\|screen'
  set t_Co=256
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors

  let s:background = "09152b"

  function! s:base16_customize() abort
    call Base16hi("MatchParen", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold,italic", "")
  endfunction

  augroup on_change_colorschema
    autocmd!
    autocmd ColorScheme * call s:base16_customize()
  augroup END

  colorscheme base16-oceanicnext
endif

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

"" Signify
" Don't wait for writing file to update the gutter
" Disabled (set to 0) since it writes on disk when I don't want
let g:signify_realtime = 0
let g:signify_vcs_list = [ 'git' ]
" Remove default white color in the sign column
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE

"" Vue syntax
" Detect which preprocessors are in the file on opening:
let g:vue_pre_processors = 'detect_on_enter'
" Vim does not detect automatically vue filetype
au BufNewFile,BufRead *.vue set filetype=vue.html



""
"" Custom commands
""

command Config :vsplit ~/.vimrc

" vim: set ft=vim :
