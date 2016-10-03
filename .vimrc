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
Plugin 'mileszs/ack.vim' "search in all files, key: <leader>aa, <leader>aw, <leader>av
Plugin 'jiangmiao/auto-pairs' "autocomplete (''{...
Plugin 'ctrlpvim/ctrlp.vim' "fuzzy find file. key: ctrl-p, buffer: <leader>p
Plugin 'tmhedberg/matchit' " % for tags
Plugin 'scrooloose/nerdtree' "file drawer (leader)<c-n>
Plugin 'vim-scripts/ReplaceWithRegister' "gr... to replace and keep content in registry. key: gr[modtion], grr (line)
Plugin 'scrooloose/syntastic' "eslint. key: <leader>ll <leader>lp
Plugin 'mtscout6/syntastic-local-eslint.vim' "Use project specific eslint
Plugin 'wellle/targets.vim' "Last, Next for Targests. Argument Obejct a. Separator Objects: ,.;:+|&\=. key: Ina, a|, in'
Plugin 'edkolev/tmuxline.vim' "airline for tmux
Plugin 'SirVer/ultisnips' "snippet Engine, key: ctrl-c ctrl-x
Plugin 'FooSoft/vim-argwrap' "Wrap/Unwrap arguments. key: <leader>gw
Plugin 'vim-airline/vim-airline' "Statusbar
Plugin 'vim-airline/vim-airline-themes' "Theme for airline
Plugin 'altercation/vim-colors-solarized' "solarized Theme
Plugin 'tpope/vim-commentary' "comment, uncomment lines key: gc gcc
Plugin 'easymotion/vim-easymotion' "faster navigation. key: <leader>motion 
Plugin 'Olical/vim-enmasse' "Edit all lines from quickfix window in one buffer. key: <leader>mf
Plugin 'isRuslan/vim-es6' "es6 snippets
Plugin 'tommcdo/vim-exchange' "switch two text objects, key: cx
Plugin 'tpope/vim-fugitive' "Git support
Plugin 'airblade/vim-gitgutter' "show git status. new Text Object: c, key: <leader>hh <leader> hk
Plugin 'takac/vim-hardtime' "disable arrow keys and repeat hjkl only once. key: <leader>x
Plugin 'sheerun/vim-polyglot' "Language Support for many languages
Plugin 'tpope/vim-repeat' "use . to repeat plugin motions
Plugin 'honza/vim-snippets' "snippets
Plugin 'tpope/vim-surround' "surrounding tags, brackets etc. key: ys cs ds
Plugin 'kana/vim-textobj-entire' "Object for entire file. key: ae ie (omit empty lines at start or end)
Plugin 'kana/vim-textobj-indent' "Object for indentation level. key: ai (with sub indents), aI (only current indent level)
Plugin 'kana/vim-textobj-user'
Plugin 'christoomey/vim-tmux-navigator' "use Ctrl-hjkl to navigate vim and tmux
Plugin 'benmills/vimux' "execute tmux command from vim
Plugin 'Valloric/YouCompleteMe' "Code completion
Plugin 'vim-scripts/ZoomWin' "Zoom Pane in,out. key: Ctrl-w o

call vundle#end()
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
" :PluginUpdate - updates installed plugins
" sort Plugins with :sort '.*/' i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a "enable mouse support
" resize splits with mouse
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif
set clipboard=unnamed "copy to system clipboard
set nrformats= "use always base 10 numbers"
set splitbelow "new splits below current
set splitright "new splits right to the current
set virtualedit=block "move in visual block mode beyound eol"
set wildmenu "command-line completion with <tab>
set gdefault "substitue globally on lines %s/a/b/ instead %s/a/b/g
filetype plugin indent on "indent automaticly
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab "Tab is 2 spaces
set autoread "reload file when changed externally
set backspace=indent,eol,start "sane backspace
set magic "regex
set ff=unix
set encoding=utf8
set fixendofline "add <EOL> to each file
set ttyfast "faster redrawing"
set ttimeoutlen=0 "no delay when <esc> pressed
set number "show line numbers
set nolazyredraw "don't redraw while executing macros
set dy+=lastline "show last line if it's too long
set breakindent "wrap line according to indent
set updatetime=250 "update vim each 250ms
" load local .vimrc files
set exrc
set secure
" save tmp files in external folders
set undodir=~/.vim/.undo//
set undofile "save undos
" do not use swapfiles
set nobackup
set nowritebackup
set noswapfile
" 5 rows offset when scrolling
set scrolloff=5
set history=200 "remember last commands

" Layout
syntax enable
set t_Co=16 " 16 colors
set background=dark
colorscheme solarized
set cursorline
set list "show tab and trailing space symbols
set listchars=tab:▸\ ,trail:·

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
" Do not enter  Ex Mode
nnoremap Q <nop>
map j gj
map k gk
inoremap <c-s> <Esc>:w<CR>
nnoremap <c-s> :w<CR>
nnoremap <leader><cr> o<Esc>
nnoremap <c-q> :q<cr>
" Navigate Buffers
nnoremap <leader>q :bd<cr>
nnoremap <Leader><Tab> :bprevious<CR>
nnoremap <Leader><s-Tab> :bnext<CR>
" Y behaves like C and D
noremap Y y$
" goto end of line in insert mode
inoremap <C-e> <C-o>$
" paste with auto indent
nnoremap p p=`]
" replace in file / project
nnoremap <leader>mi :%s///c<left><left>
nnoremap <leader>ma :cdo s///c \| up<left><left><left><left><left><left><left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile *.apib set filetype=markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab "use tab for makefile

" Load manpages with :Man
runtime! ftplugin/man.vim

" goto last position when file was left
autocmd  BufReadPost  *   if line("'\"") > 0 && line("'\"") <= line("$") | exe 'norm! g`"' | endif

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDTreeQuitOnOpen=1 "close NERDTree after a file is opened
let NERDTreeShowHidden=1 "show hidden files in NERDTree
let NERDTreeIgnore=['\.swp$', '\~$']
" Toggle NERDTree
nmap <silent> <c-n> :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader><c-n> :NERDTreeFind<cr>
"close VIM if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP
" show only files that are in the buffer
nmap <silent> <leader>p :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=1
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
" search only filename, not the path
let g:ctrlp_by_filename = 1

" YCM
nnoremap <silent><leader>ref :YcmCompleter GoTo<CR>
nnoremap <leader>ren :YcmCompleter RefactorRename<Space>
set completeopt-=preview

" Easymotion
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
nmap <leader>s <Plug>(easymotion-s2)
omap <leader>s <Plug>(easymotion-s2)
map / <Plug>(easymotion-sn)\V\c
map <leader>/ <Plug>(easymotion-sn)\v
omap / <Plug>(easymotion-tn)\V\c
omap <leader>/ <Plug>(easymotion-tn)\v
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
highlight! link EasyMotionIncSearch IncSearch
highlight! link EasyMotionTarget2First IncSearch
highlight! link EasyMotionTarget2Second IncSearch

" Airline
let g:airline_theme = 'bubblegum'
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
nnoremap <Leader>aa :Ack!<Space>
nnoremap <Leader>aw :Ack!<Space><C-R><C-W><CR>
vnoremap <Leader>av y:Ack!<Space>"<C-R>""<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-c>"
let g:UltiSnipsJumpForwardTrigger="<C-c>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
nnoremap <leader>ll :lnext<CR>
nnoremap <leader>lp :lprev<CR>

" Gitgutter
nmap <leader>hh <Plug>GitGutterNextHunk
nmap <leader>hk <Plug>GitGutterPrevHunk

" EnMasse
nnoremap <leader>mf :EnMasse<CR>

" Argwrap
nnoremap <silent> <leader>gw :ArgWrap<CR>

" Hardtime
let g:hardtime_default_on = 1
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:hardtime_maxcount = 2
let g:hardtime_showmsg = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1
nnoremap <Leader>x :HardTimeToggle<CR>
