"Plugin settings
  
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" for windows mkdir in user home: .vim, and set
" set rtp+=$HOME/.config/nvim/plug.vim
" call plug#begin('~/.config/nvim/plugged')
 set rtp+=~/.vim/autoload/plug.vim
 call plug#begin('~/.vim/plugged')
 " " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
"first get https://github.com/junegunn/vim-plug/blob/master/plug.vim to .vim/autoload/

 Plug 'scrooloose/nerdtree'
 Plug 'tpope/vim-fugitive'
 Plug 'scrooloose/nerdtree'
 Plug 'shawncplus/phpcomplete.vim'
 Plug 'vim-scripts/taglist.vim'
 Plug 'scrooloose/syntastic'
 Plug 'mattn/emmet-vim'
 Plug 'vim-scripts/pythoncomplete'
 
 call plug#end()  
 filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
filetype plugin on

" " Brief help
" " :PlugInstall    - installs plugins; append `!` to update or just
"   :PlugUpdate

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
set scrolloff=3
set shellslash
set tags=tags,TAGS,./tags,./TAGS
set wildmode=full
set wildmenu
set wildignore+=.svn,CVS,.git 
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg 

"Statusline
set laststatus=2
set statusline=\ %f%m%r%h%w[%n]\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %) 

"Coloring
set cursorline
colorscheme industry
set colorcolumn=-1
hi CursorLine term=bold cterm=bold ctermbg=8  
hi ColorColumn term=bold ctermbg=8 
hi StatusLine term=bold ctermbg=7 ctermfg=8 
hi StatusLineNC term=bold ctermbg=7 ctermfg=8 
hi VertSplit term=bold ctermbg=8 ctermfg=0
hi TabLineFill ctermfg=8
hi TabLine ctermbg=7 ctermfg=8
hi TabLineSel term=bold ctermbg=15 ctermfg=8

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

"PHP programming
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

"CSS
 autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" make CSS omnicompletion work for SASS and SCSS
 autocmd BufNewFile,BufRead *.scss			set ft=scss.css
 autocmd BufNewFile,BufRead *.sass			set ft=sass.css

"HTML
 autocmd FileType html,xhtml setlocal expandtab shiftwidth=4 tabstop=4
"softtabstop=2

"ENCODING SETTINGS
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1

"Taglist settings"
let Tlist_Show_One_File = 1 
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
"let Tlist_Auto_Open = 1

"Vdebug options
let g:vdebug_options={'ide_key': 'vdebug', 'break_on_open': 0 , 'server': '127.0.0.1', 'port': '9001'}

"NERDTree
let g:NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
"let g:NERDTreeWinSize=25

"Taglist
autocmd FileType taglist setlocal relativenumber

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"Key mapping"
map <silent> <C-e> :NERDTreeToggle<CR>
map <silent> <C-s> :NERDTreeFind<CR>
map <silent> <S-F9> :TlistToggle<CR> 
map <silent> <S-up> :bp<CR>
map <silent> <S-down> :bn<CR>
map <silent> <M-h> :wincmd h<CR>
map <silent> <M-l> :wincmd l<CR>
map <silent> <M-k> :wincmd k<CR>
map <silent> <M-j> :wincmd j<CR>
map <silent> <g]> :ptselect 

"NeoComplete
"leg g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=2
let g:neocomplete#auto_completion_start_length=4
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries={
    \ 'default' : $HOME. '/.vimshell_hist',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

"Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'

"Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set cot-=preview	"disable doc preview in omnicomplete

"GUI options"
if has("gui_running")
	set guioptions-=T
	set guioptions-=r
    set guioptions+=c
	filetype on
	colorscheme desert
    set textwidth=80
    set colorcolumn=-1
    hi ColorColumn guibg=Gray30
    hi StatusLine  guibg=Gray30
	hi CursorLine guibg=Gray30
    hi StatusLineNC  guifg=black guibg=Gray30
    hi VertSplit guifg=black guibg=gray30
	autocmd VimEnter,BufNewFile * NERDTree
	set sessionoptions=buffers,tabpages
	
	"load Session.vim if exists
	if filereadable(getcwd() . "/Session.vim")
		exe "source ./Session.vim"
	endif
endif
