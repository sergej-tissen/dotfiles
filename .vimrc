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
Plugin 'scrooloose/syntastic' "eslint

call vundle#end()
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
" :PluginUpdate - updates installed plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
set mouse=a "enable mouse support
set clipboard=unnamed "copy to system clipboard
set wildmenu "command-line completion with <tab>
filetype plugin indent on "indent automaticly
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab "Tab is 2 spaces
autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab "use tab for makefile
set autoread "reload file when changed externally
set backspace=indent,eol,start "sane backspace
set magic "regex
set ff=unix
set encoding=utf8
set ttyfast "faster redrawing"
set ttimeoutlen=0 "no delay when <esc> pressed
set number "show line numbers
set nolazyredraw "don't redraw while executing macros
set dy+=lastline "show last line if it's too long
" Layout
syntax enable "syntax highlighting
set t_Co=256
highlight LineNr ctermfg=darkgrey
set cursorline
highlight CursorLine cterm=none ctermbg=234
highlight Statement ctermfg=172
"load local .vimrc files
set exrc
set secure
"save tmp files in external folders
set undodir=~/.vim/.undo//
set undofile "save undos
" do not use swapfiles
set nobackup
set nowritebackup
set noswapfile
"goto last position when file was left
au BufReadPost  *   if line("'\"") > 0 && line("'\"") <= line("$") | exe 'norm! g`"' | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
"Do not enter  Ex Mode
nnoremap Q <nop>
"Do not use for scroll. Use as tmux prefix
nnoremap <c-f> <nop>
inoremap <c-s> <Esc>:w<CR>
nnoremap <c-s> :w<CR>
nnoremap <leader><cr> o<Esc>
nnoremap <c-q> :qa<cr>
"Navigate Buffers
nnoremap <leader>o <C-i>
let g:lasttab = 1
nmap <Leader><Tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDTreeQuitOnOpen=1 "close NERDTree after a file is opened
let NERDTreeShowHidden=1 "show hidden files in NERDTree
let NERDTreeIgnore=['\.swp$', '\~$']
"Toggle NERDTree
nmap <silent> <c-n> :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader><c-n> :NERDTreeFind<cr>
"close VIM if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.branch = '⌥'
let g:airline_symbols.paste = 'ρ'
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

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

nnoremap <leader>ll :lnext<CR>
nnoremap <leader>lp :lprev<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Local .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:syntastic_javascript_checkers = ['eslint'] "run eslint
"map <leader>rs :wa <bar> :call VimuxRunCommand('clear && npm start')<cr>
"map <leader>rt :wa <bar> :call VimuxRunCommand('clear && npm test')<cr>
"map <leader>rw :wa <bar> :call VimuxRunCommand('clear && npm run watch')<cr>
"map <leader>rb :wa <bar> :call VimuxRunCommand('clear && npm run build')<cr>
"map <leader>rr :w <bar> :call VimuxRunCommand('clear && node ' .  bufname('%'))<cr>
