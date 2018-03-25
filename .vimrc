" Execute before first usage
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall
" cd ~/.vim/bundle/YouCompleteMe && ./install.py --js-completer

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
Plugin 'w0rp/ale' "linter, key: <leader>ll lk
Plugin 'mileszs/ack.vim' "search in all files, key: <leader>aa, <leader>aw, <leader>av. -G filetype, -C show 2 lines context, -i ignore-case, -s case-sensitive ./sub search in subfolder
Plugin 'ctrlpvim/ctrlp.vim' "fuzzy find file. key: ctrl-p, buffer: <leader>p, toggle include path: ctrl-d
Plugin 'Raimondi/delimitMate' "autocomplete brackets
Plugin 'sjl/gundo.vim' "show undo tree. key: <leader>u
Plugin 'tmhedberg/matchit' " % for tags
Plugin 'scrooloose/nerdtree' "file drawer (leader)<c-n>
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'vim-scripts/ReplaceWithRegister' "gr... to replace and keep content in registry. key: gr[modtion], grr (line)
Plugin 'wellle/targets.vim' "Last, Next for Targests. Argument Obejct a. Separator Objects: ,.;:+|&\=. key: Ina, a|, in'
Plugin 'SirVer/ultisnips' "snippet Engine, key: ctrl-c ctrl-x
Plugin 'FooSoft/vim-argwrap' "Wrap/Unwrap arguments. key: <leader>gw
Plugin 'vim-airline/vim-airline' "Statusbar
Plugin 'vim-airline/vim-airline-themes' "Theme for airline
Plugin 'alvan/vim-closetag' "key: > , new line with indent: >>
Plugin 'altercation/vim-colors-solarized' "solarized Theme
Plugin 'tpope/vim-commentary' "comment, uncomment lines key: gc gcc
Plugin 'easymotion/vim-easymotion' "faster navigation. key: <leader>motion
Plugin 'isRuslan/vim-es6' "es6 snippets
Plugin 'tommcdo/vim-exchange' "switch two text objects, key: cx
" fugitive: Git support. command :Git command % ( % = current file), :Gblame, :Gdiff, :Gwrite (git add %),
" :Gread (git checkout %), :Gremove, :Gmove /project-root, za open/close fold,
" :Gedit browse commits, C back to commit view, Enter open diff mode, a show tree as link
" :Glog -10 show log for current file, :Glog -- % show commits for current file, :Glog -- load all commits in quickfix window
" :GStatus - (add, remove file), p (patch), <Enter> (show file), C (commit), C-n C-p jump to next file
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter' "show git status. key: <leader>hh hk, hp preview hunk, hs stage hunk, hu undo hunk
Plugin 'tpope/vim-repeat' "use . to repeat plugin motions
Plugin 'kshenoy/vim-signature' "show marks. key: remove mark: dm[mark], delete all marks in buffer: m<space>
Plugin 'honza/vim-snippets' "snippets
Plugin 'tpope/vim-surround' "surrounding tags, brackets etc. key: ys cs ds Visual Mode: S
Plugin 'godlygeek/tabular' "align by a pattern. :Tab /x (x is regex by which to align. ie. = or , or |)
Plugin 'kana/vim-textobj-entire' "Object for entire file. key: ae ie (omit empty lines at start or end)
Plugin 'kana/vim-textobj-indent' "Object for indentation level. key: ai (with sub indents), aI (only current indent level)
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-unimpaired' "Navigate quickfix window. key []q :cnext, :cprevious, Q :cfirst, :clast, b Buffer, e exchange x lines
Plugin 'Valloric/YouCompleteMe' "Code completion
" Language Plugins
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'honza/dockerfile.vim'
Plugin 'elzr/vim-json'
Plugin 'stephpy/vim-yaml'
Plugin 'hashivim/vim-hashicorp-tools'

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
set clipboard=unnamed "copy to system clipboard
set noautochdir "do not switch root dir when opening file
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
set linebreak "do not break in the middle of a word
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
" use gf to open files
set path=**
set suffixesadd=.js,.html,.css,.json,.md
" open diffsplit vertically
set diffopt=filler,vertical

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
nmap j gj
nmap k gk
nmap $ g$
nmap 0 g0
nmap ^ g^
vmap j gj
vmap k gk
vmap $ g$
vmap 0 g0
vmap ^ g^
" Navigate Buffers
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <s-Tab> <c-^>
" Y behaves like C and D
noremap Y y$
" goto end of line in insert mode
inoremap <C-e> <C-o>$
" replace in file / project
nnoremap <leader>mi :%s///c<left><left>
nnoremap <leader>ma :cdo s///c \| up<left><left><left><left><left><left><left>
" remove trailing whitespace
nnoremap <leader>dw :%s/\s\+$//e<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile *.scss set filetype=scss.css
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.tfstate* set filetype=json
autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab "use tab for makefile

" goto last position when file was left
autocmd  BufReadPost  *   if line("'\"") > 0 && line("'\"") <= line("$") | exe 'norm! g`"' | endif

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" Load manpages with :Man
runtime! ftplugin/man.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDTreeQuitOnOpen=1 "close NERDTree after a file is opened
let NERDTreeShowHidden=1 "show hidden files in NERDTree
let NERDTreeIgnore=['\.swp$', '\~$']
let g:NERDTreeWinSize=50
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
" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 'ra'
" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
      \ 'file': '\v\.(exe|so|dll|swp|class)$',
      \ }
" Ignore files in .gitignore
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" search only filename, not the path
let g:ctrlp_by_filename = 1
" index all files
let g:ctrlp_max_files=0

" YCM
nnoremap <silent><leader>rf :YcmCompleter GoTo<CR>
nnoremap <leader>rn :YcmCompleter RefactorRename<Space>
set completeopt-=preview
" show autocompletion for css
let g:ycm_semantic_triggers = {'css': [ 're!^\s{2}', 're!:\s+' ],}

" Easymotion
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
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
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1
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

" Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'xml': [],
\}
let g:ale_sign_column_always = 1
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_lint_on_text_changed = 'never'
nmap <silent> <leader>lk <Plug>(ale_previous_wrap)
nmap <silent> <leader>ll <Plug>(ale_next_wrap)

" Gitgutter
nmap <leader>hh <Plug>GitGutterNextHunk
nmap <leader>hk <Plug>GitGutterPrevHunk

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" Rainbow Parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#blacklist = [237, 238]
augroup rainbow_lisp
  autocmd!
  autocmd FileType javascript,json,css RainbowParentheses
augroup END

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.ejs,*.xml"

" Javascript
let g:javascript_plugin_flow = 1

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" delimitMate
let delimitMate_expand_cr = 1
