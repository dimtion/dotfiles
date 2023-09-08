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
"" Cheatsheet
""

" Scroll down one line: <C-E>
" Scroll up one line: <C-Y>

" Search exact word:     `#` / `*`
" Search not exact word: `g#` / `g*`

" Back-and-forth between 2 buffers: `<C-6>` or `:b#`
" Jump to the previous position: `<C-O>`
" Jump to next position: `<C-I>`

" Open fold: zo
" Close fold: zc
" Toggle fold: za
" Open all folds: zO
" Open all folds: zR

" Select an HTML outer tag: vat
" Select an HTML inner tag: vit
" Other corner of selection: o

" Show diff with local file
" :w !diff % -


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
"
" Trying coc
" Plug 'w0rp/ale'
" Plug 'valloric/YouCompleteMe'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" I find coc slow and does not work as well as YCM+ale so I disable it for
" now.
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'fannheyward/coc-rust-analyzer'
" Plug 'liuchengxu/vista.vim'

" Very useful for group projects without a formater
" See: https://editorconfig.org/
Plug 'editorconfig/editorconfig-vim'

" vim-vue: Sometime the syntax highlight bugs: `:syntax sync fromstart`
Plug 'posva/vim-vue'

" JS, TS, TSX, JSX syntax
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'

" Git wrapper
Plug 'tpope/vim-fugitive'
" :BlamerToggle
" Plug 'APZelos/blamer.nvim'
" Plug 'dimtion/blamer.nvim'

" [count]<space> Toggle comment
" [count]<leader>c<space> Toggle comment
" [count]<leader>cc Comment the current line
" [count]<leader>cu Uncomment the current line
Plug 'preservim/nerdcommenter'
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


" Org mode
Plug 'jceb/vim-orgmode'

" Better surround.vim
" Add: `sa{motion/textobject}{addition}`
" Delete: `sd{deletion}`
" Replate: `srb{addition}`
" Disabled since it conflicts with my mapping of easymotion
" Plug 'machakann/vim-sandwich'


" No longer used plugings
" Plug 'junegunn/vim-easy-align'
" Plug 'yuttie/comfortable-motion.vim'
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
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
" nnoremap  
" nnoremap  
" nnoremap  

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
" Fake bindings for VSCode
nmap s <Plug>(easymotion-overwin-f2)

" FZF
" tips:
" Open in new tab: <C-T>
" Open in new split: <C-X>
" Open in new vertical split: <C-V>
" :Files! (bang) will open in fullscreen
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Rg<cr>

vnoremap // y:Rg <C-R>"<cr>

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

" Do not change the endofline if there is an issue
set nofixendofline


" shortcut for paste mode
nnoremap <leader>p :set invpaste paste?<CR>

"" YouCompleteMe
" Disable <tab> since I don't like it and it interferes with UltraSnip
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

"" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

"" Ultrasnip
" Disable ultraSnip since we are using YouCompleteMe
inoremap <c-x><c-k> <c-x><c-k>

"" ALE
" nmap <leader>f <Plug>(ale_fix)
" nmap <leader>a <Plug>(ale_toggle_buffer)

"" Coc

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  :Format<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"" Vista

let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']

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
command! StripTrailingWhitespaces :call <SID>StripTrailingWhitespaces()

"" Coc specific configuration
set updatetime=300


" Map space to comment toggle
nnoremap <space> :call NERDComment(0,"toggle")<CR>
vnoremap <space> :call NERDComment(0,"toggle")<CR>


""
"" Display
""

"" Theme
" let base16colorspace=256
" set termguicolors
" use 256 colors in Console mode if we think the terminal supports it
" if &term =~? 'mlterm\|xterm\|screen'
"   set t_Co=256
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" 
"   let s:background = "09152b"
" 
"   function! s:base16_customize() abort
"     call Base16hi("MatchParen", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold,italic", "")
"   endfunction
" 
"   augroup on_change_colorschema
"     autocmd!
"     autocmd ColorScheme * call s:base16_customize()
"   augroup END
" endif
colorscheme base16-oceanicnext

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

"" Blamer
let g:blamer_enabled = 1
let g:blamer_delay = 200


"" Vue syntax
" Detect which preprocessors are in the file on opening:
let g:vue_pre_processors = 'detect_on_enter'
" Vim does not detect automatically vue filetype
au BufNewFile,BufRead *.vue set filetype=vue.html


""
"" Custom commands
""

" format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! Config :vsplit ~/.vimrc

" Insert current datetime
inoremap <F5> <C-R>=strftime("%c")<CR>
nnoremap <F5> "=strftime("%c")<CR>P

" vim: set ft=vim :
