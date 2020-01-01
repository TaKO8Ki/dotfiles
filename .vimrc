" # Plugins
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/tako8ki/.vim/bundle/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/tako8ki/.vim/bundle/.cache/dein')
  call dein#begin('/Users/tako8ki/.vim/bundle/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/tako8ki/.vim/bundle/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('fatih/vim-go')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add("cohama/lexima.vim")
  call dein#add('tpope/vim-surround')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('scrooloose/nerdtree')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" ## vim-airline
let g:airline_theme='minimalist'

" ## nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" ## vim-go
let g:go_fmt_command = "goimports"
let g:go_hightlight_functions = 1
let g:go_hightlight_methods = 1
let g:go_hightlight_structs = 1
let g:go_hightlight_interfaces = 1
let g:go_hightlight_operators = 1
let g:go_hightlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

" # KeyBind

" ## Go
let g:go_bin_path = $GOBIN

" # Setting
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set cursorline
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set list listchars=tab:\▸\-
set term=xterm-256color
syntax on
colorscheme antares

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

