set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
"first git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
"let Vundle manage Vundle, required
 Plugin 'gmarik/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
 Plugin 'scrooloose/nerdtree'
 Plugin 'shawncplus/phpcomplete.vim'
 Plugin 'vim-scripts/taglist.vim'
 Plugin 'scrooloose/syntastic'
 Plugin 'mattn/emmet-vim'
"" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'ghosert/VimProject' "for winddows support
" Plugin 'jlanzarotta/bufexplorer'
" Plugin 'sickill/vim-monokai'
 "Plugin 'vim-scripts/phpfolding.vim'
"" Plugin 'othree/html5.vim'
"" Plugin 'rkulla/pydiction'
"" Plugin 'vim-scripts/OmniCppComplete'
 Plugin 'vim-scripts/YankRing.vim'
 Plugin 'Shougo/neocomplete.vim'
" Plugin 'Lokaltog/vim-easymotion'
"" Plugin 'pangloss/vim-javascript'
"" Plugin 'itspriddle/vim-jquery'
"" Plugin 'tpope/vim-markdown'
"" Plugin 'arnaud-lb/vim-php-namespace'
"" Plugin 'sukima/xmledit'
 Plugin 'Raimondi/delimitMate'
"" Plugin 'joonty/vdebug'
"" Plugin 'Valloric/YouCompleteMe'
 Plugin 'airblade/vim-gitgutter'


" " plugin from http://vim-scripts.org/vim/scripts.html
 Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
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
filetype plugin on
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

"General settings
"set debug=msg
set verbose=0
syntax enable
set number
set clipboard=unnamedplus
set ruler
set mouse=a
set more
set so=5
set shellslash
set tags=tags,TAGS,./tags,./TAGS
set wildmode=full
set wildmenu
set wildignore+=.svn,CVS,.git 
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg 
set laststatus=2
set statusline=\ %t%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %) ""\ %(%{fugitive#statusline()}%)

"Coloring
set cursorline
colorscheme industry
set colorcolumn=-1
hi CursorLine term=bold cterm=bold ctermbg=8  
hi ColorColumn term=bold ctermbg=8 
hi StatusLine term=bold ctermbg=0 ctermfg=8 
hi StatusLineNC term=bold ctermbg=0 ctermfg=8 
hi VertSplit term=bold ctermbg=8 ctermfg=0

"Editting
set expandtab
set shiftwidth=4
set softtabstop=4
"set autochdir
set showmatch
set tabstop=4
set showcmd
set showmode
set smartcase
set nospell
set autoindent
set smartindent
"set relativenumber 
set textwidth=80

"Searching
set incsearch
set ignorecase
set hlsearch

"Window
set cmdheight=8
set previewheight=30

"FOLDING
set foldmethod=indent
set foldlevelstart=99
set foldlevel=99
set foldcolumn=0

"---------------------------------------------
"" Enable omni completion. (Ctrl-X Ctrl-O)
"---------------------------------------------
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set cot-=preview	"disable doc preview in omnicomplete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"---------------------------------------------
"" for PHP programming
"---------------------------------------------
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
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
 autocmd FileType html,xhtml setlocal expandtab shiftwidth=4 tabstop=4
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
"let Tlist_Auto_Open = 1

"NeoComplete settings
"leg g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3 

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : $HOME. '/.vimshell_hist',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"ycm settings  variables"
"let g:ycm_auto_trigger = 1
"use 
"let g:ycm_min_num_of_chars_for_complete = 99
"for turning off identifier but keeping the semantic triggers.
"let g:ycm_filetpe_whitelist = {'*':1}
"let g:ycm_filetype_blacklist = {'markdown':1, 'text':1, 'tagbar':1, 'mail':1,}

" Vdebug options
let g:vdebug_options={'ide_key': 'vdebug', 'break_on_open': 0 , 'server': '127.0.0.1', 'port': '9001'}

" NERDTree
let g:NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
"let g:NERDTreeWinSize=25

" Taglist
autocmd FileType taglist setlocal relativenumber


"Key mapping"
map <silent> <C-e> :NERDTreeToggle<CR>
map <silent> <C-s> :NERDTreeFind<CR>
map <silent> <S-F9> :TlistToggle<CR> 
map <silent> <S-up> :bp<CR>
map <silent> <S-down> :bn<CR>
map <silent> <M-left> :wincmd h<CR>
map <silent> <M-right> :wincmd l<CR>
map <silent> <M-up> :wincmd k<CR>
map <silent> <M-down> :wincmd j<CR>
map <silent> <g]> :tselect 
nmap <Leader>v :tabedit $MYVIMRC
nmap <Leader>s :source $MYVIMRC

"for gui options"
if has("gui_running")
	set guioptions-=T
	set guioptions-=r
	filetype on
	colorscheme desert
    set textwidth=80
    set colorcolumn=-1
    hi ColorColumn guibg=Gray30
    hi StatusLine  guibg=Gray30
	hi CursorLine guibg=Gray30
    hi StatusLineNC  guifg=black guibg=Gray30
    hi VertSplit guifg=black guibg=gray30
	autocmd Vimenter * NERDTree
	set sessionoptions=buffers,tabpages
	
	"load Session.vim if exists
	if filereadable(getcwd() . "/Session.vim")
		exe "source ./Session.vim"
	endif
endif
