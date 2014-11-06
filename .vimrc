set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
 Plugin 'gmarik/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
 Plugin 'tpope/vim-fugitive'
 Plugin 'scrooloose/nerdtree'
 Plugin 'shawncplus/phpcomplete.vim'
 Plugin 'vim-scripts/taglist.vim'
 Plugin 'scrooloose/syntastic'
 Plugin 'mattn/emmet-vim'
 Plugin 'maksimr/vim-jsbeautify'
" Plugin 'ghosert/VimProject' "for winddows support
" Plugin 'jlanzarotta/bufexplorer'
 Plugin 'jaredly/vim-debug'
 Plugin 'sickill/vim-monokai'
" Plugin 'vim-scripts/phpfolding.vim'
 Plugin 'othree/html5.vim'
 Plugin 'rkulla/pydiction'
 Plugin 'vim-scripts/OmniCppComplete'
 Plugin 'vim-scripts/YankRing.vim'
 Plugin 'Shougo/neocomplcache.vim'
"" Plugin 'Lokaltog/vim-easymotion'
 Plugin 'pangloss/vim-javascript'
 Plugin 'itspriddle/vim-jquery'
 Plugin 'tpope/vim-markdown'
 Plugin 'arnaud-lb/vim-php-namespace'
 Plugin 'sukima/xmledit'
 Plugin 'Raimondi/delimitMate'


" " plugin from http://vim-scripts.org/vim/scripts.html
 Plugin 'L9'
" " Git plugin not hosted on GitHub
 Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
"" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
"" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line


"basic command for gvim"
syntax on
set number
set clipboard=unnamedplus
set hlsearch
set ignorecase
set cursorline
set autoindent
set smartindent
set ruler
"set autochdir
set tabstop=4
set showcmd
set showmode
set smartcase
set incsearch
set shellslash
set mouse=a
"set spell"
set more
set showmatch
set tags=tags,TAGS,./tags,./TAGS
set wildmode=full
set wildmenu
set wildignore+=.svn,CVS,.git 
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg 

"FOLDING
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0

colorscheme monokai
"set debug=msg
"set foldmethod=syntax
set laststatus=2
set statusline=\ %t%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)\ %(%{fugitive#statusline()}%)

"---------------------------------------------
"" Enable omni completion. (Ctrl-X Ctrl-O)
"---------------------------------------------
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set cot-=preview	"disable doc preview in omnicomplete

"---------------------------------------------
"" for PHP programming
"---------------------------------------------
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
"
""---------------------------------------------
" for edit CSS
" "---------------------------------------------
 autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" " make CSS omnicompletion work for SASS and SCSS
 autocmd BufNewFile,BufRead *.scss			set ft=scss.css
 autocmd BufNewFile,BufRead *.sass			set ft=sass.css
"
" "---------------------------------------------
" " for edit HTML
" "---------------------------------------------
 autocmd FileType html,xhtml setlocal expandtab shiftwidth=2 tabstop=2
 "softtabstop=2

"--------------------------------------------------------------------------- 
"" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1

"Taglist settings"
let Tlist_Show_One_File = 1 
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
set tags=tags

"Key mapping"
map <silent> <F3> :NERDTreeToggle<CR>
map <silent> <F9> :TlistToggle<CR> 
map <silent> <S-left> :bp<CR>
map <silent> <S-right> :bn<CR>
map <silent> <M-left> :wincmd h<CR>
map <silent> <M-right> :wincmd l<CR>
map <silent> <M-up> :wincmd k<CR>
map <silent> <M-down> :wincmd j<CR>
