"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot' "Language Support for many languages
Plugin 'jiangmiao/auto-pairs' "autocomplete (''{...
Plugin 'scrooloose/nerdtree' "file drawer (leader)<c-n>
Plugin 'Xuyuanp/nerdtree-git-plugin' "git symbols in nerdtree
Plugin 'ctrlpvim/ctrlp.vim' "fuzzy find file (leader)<c-p>
Plugin 'Valloric/YouCompleteMe' "Code completion
Plugin 'severin-lemaignan/vim-minimap' "Minimap <leader>mm
Plugin 'easymotion/vim-easymotion' "faster navigation <leader>motion /
Plugin 'tpope/vim-surround' "surrounding tags, brackets etc. ys... cs... ds...
Plugin 'tpope/vim-repeat' "use . to repeat plugin motions
Plugin 'tpope/vim-commentary' "comment, uncomment lines gc gcc
Plugin 'vim-airline/vim-airline' "Statusbar
Plugin 'vim-airline/vim-airline-themes' "Theme for airline
Plugin 'edkolev/tmuxline.vim' "airline for tmux
Plugin 'tpope/vim-fugitive' "Git support
Plugin 'christoomey/vim-tmux-navigator' "use Ctrl-hjkl to navigate vim and tmux
Plugin 'benmills/vimux' "execute tmux command from vim
Plugin 'mileszs/ack.vim' "search in all files
Plugin 'SirVer/ultisnips' "snippet Entgine
Plugin 'honza/vim-snippets' "snippets
Plugin 'isRuslan/vim-es6' "es6 snippets

call vundle#end()
filetype plugin indent on
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
" :PluginUpdate - updates installed plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a "enable mouse support
set clipboard=unnamed "copy to system clipboard
set wildmenu "command-line completion with <tab>
filetype plugin indent on "indent automaticly
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab "Tab is 2 spaces
set autoread "reload file when changed externally
set backspace=indent,eol,start "sane backspace
set magic "regex
set encoding=utf8
syntax enable "syntax highlighting
set ttyfast "faster redrawing"
set number "show actual line number in current line
highlight LineNr ctermfg=grey
set nolazyredraw "don't redraw while executing macros
set t_Co=256
"load local .vimrc files
set exrc
set secure
set dy+=lastline "show last line if it's too long
"save tmp files in external folders
set directory=~/.vim/.swapfiles//
set undodir=~/.vim/.undo//
"save undos
set undofile
"goto last position when file was left
au BufReadPost  *   if line("'\"") > 0 && line("'\"") <= line("$") | exe 'norm! g`"' | endif
set ff=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
"Do not enter  Ex Mode
nnoremap Q <nop>
"Do not use for scroll. Use as tmux prefix
nnoremap <c-f> <nop>
inoremap jj <Esc>
inoremap <c-s> <Esc>:w<CR>

nnoremap <c-s> :w<CR>
nnoremap <leader><cr> o<Esc>
nnoremap <c-q> :qa<cr>
"Navigate Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDTreeQuitOnOpen=1 "close NERDTree after a file is opened
let NERDTreeShowHidden=1 "show hidden files in NERDTree
let NERDTreeIgnore=['\.swp$', '\~$', 'node_modules']
"Toggle NERDTree
nmap <silent> <c-n> :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader><c-n> :NERDTreeFind<cr>
"close VIM if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"open NERDTree if vim is started without any file specified: $ .vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" CtrlP
nmap <silent> <leader><c-p> :CtrlPBuffer<cr>
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'
" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$|\.swp$'
  \ }
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

" YCM
nnoremap <silent><leader>ref :YcmCompleter GoTo<CR>
nnoremap <leader>ren :YcmCompleter RefactorRename<Space>
set completeopt-=preview

" Minimap
let g:minimap_show='<leader>ms'
let g:minimap_toggle='<leader>mm'

" Easymotion
map <Leader> <Plug>(easymotion-prefix)
nmap <leader>s <Plug>(easymotion-s2)
omap <leader>s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" Airline
let g:airline_theme =  'bubblegum'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Vim-Tmux-Navigator
let g:tmux_navigator_save_on_switch = 1

" Tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '',
      \'c'    : '',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '',
      \'y'    : '#W',
      \'z'    : '#H'}

" Vimux
map <leader>rs :wa <bar> :call VimuxRunCommand("clear && npm start")<cr>
map <leader>rt :wa <bar> :call VimuxRunCommand("clear && npm test")<cr>
map <leader>rw :wa <bar> :call VimuxRunCommand("clear && npm run watch")<cr>
map <leader>rb :wa <bar> :call VimuxRunCommand("clear && npm run build")<cr>

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden --ignore-dir .git'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>p :Ack!<Space>

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-c>"
let g:UltiSnipsJumpForwardTrigger="<C-c>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
