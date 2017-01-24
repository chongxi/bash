" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall
" cd ~/.vim/bundle/YouCompleteMe && ./install.sh
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" " Copy and Paste
set pastetoggle=<F2>
set clipboard=unnamed
"
" " Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again
"
" " Rebind <Leader> key
let mapleader=";"
"
"
" " Bind nohl
" " Removes highlight of your last search
" " ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
" "" vnoremap <C-n> :nohl<CR>
" "" inoremap <C-n> :nohl<CR>
"
"

" " Quicksave command
noremap <C-s> :update<CR>
" "" vnoremap <C-Z> <C-C>:update<CR>
" "" inoremap <C-Z> <C-O>:update<CR>
"
"
" " Quick quit command
" "" noremap <Leader>e :quit<CR>  " Quit current window
" "" noremap <Leader>E :qa!<CR>   " Quit all windows
"
"
" " bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" " Every unnecessary keystroke that can be saved is good for your health :)
" "" map <c-j> <c-w>j
" "" map <c-k> <c-w>k
" "" map <c-l> <c-w>l
" "" map <c-h> <c-w>h
"
"
" " easier moving between tabs
" "" map <Leader>n <esc>:tabprevious<CR>
" "" map <Leader>m <esc>:tabnext<CR>
"
"
" " map sort function to a key
" "" vnoremap <Leader>s :sort<CR>
"
"
" " easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
" "" vnoremap < <gv  " better indentation
" "" vnoremap > >gv  " better indentation
"
"
" " Show whitespace
" " MUST be inserted BEFORE the colorscheme command
" "" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" "" au InsertLeave * match ExtraWhitespace /\s\+$/
"
" " Vundle and Plugins 
set nocompatible	
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'   " commenter: \cc \cu:
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
call vundle#end()            " required

" " Enable syntax highlighting and automatic indent
filetype plugin indent on
syntax on



" ColorScheme
set background=dark
set t_Co=256
highlight Normal ctermfg=grey ctermbg=black
syntax enable
let g:solarized_termcolors=256 
colorscheme PaperColor 
" solarized

" " Highlight current line
set cursorline
hi CursorLine term=bold cterm=bold
"
"
" " Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
"set colorcolumn=90
"highlight ColorColumn ctermbg=233
"
"
" " easier formatting of paragraphs
" "" vmap Q gq
" "" nmap Q gqap
"
"
" " Useful settings
" "" set history=700
" "" set undolevels=700
"
"
" " Real programmers don't use TABs but spaces
" "" set tabstop=4
set softtabstop=4
set shiftwidth=4
" "" set shiftround
" "" set expandtab
"
"
" " Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
"

" Youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"
" Ctrl+N 打开/关闭
map <F7> :NERDTreeToggle<CR>
" " 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" " 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" " 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" " 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1


" Tagbar
nmap <F8> :TagbarToggle<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsSnippetDirectories = ['/Users/laic/.vim/UltiSnips', 'UltiSnips']

map <F5> :call RunPython()<CR>
map <F6> :call DebugPython()<CR>
func! RunPython()
    exec "w"
    if &filetype == 'python'
	exec "!time /anaconda/bin/python %"
    endif
endfunc
func! DebugPython()
    exec "w"
    if &filetype == 'python'
	exec "! /anaconda/bin/pudb %"
    endif
endfunc
