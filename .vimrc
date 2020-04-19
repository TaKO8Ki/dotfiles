" # Plugins
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/tako8ki/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/tako8ki/.cache/dein')
  call dein#begin('/Users/tako8ki/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/tako8ki/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('fatih/vim-go')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/denite.nvim')
  call dein#add('junegunn/fzf', {'build': './install --all'})
  call dein#add('junegunn/fzf.vim')
  call dein#add('mileszs/ack.vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('racer-rust/vim-racer')
  call dein#add('autozimu/LanguageClient-neovim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('kassio/neoterm')
  
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  if has('lua')
    call dein#add('Shougo/neosnippet')
    call dein#add('Shougo/neosnippet-snippets')
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" ## vim-airline
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

" ## nerdtree
function MyNerdToggle()
    if &filetype == 'nerdtree'
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
  endfunction
nnoremap <silent><C-e> :call MyNerdToggle()<CR>

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

" ## fzf
nnoremap <C-p> :FZFFileList<CR>
command! FZFFileList call fzf#run(fzf#wrap({'source': 'find . -type d -name .git -prune -o ! -name .DS_Store', 'down': '40%'}))
nnoremap f :Ag<CR>
nnoremap <C-r> :Buffers<CR>

" ## indent guide
let g:indent_guides_enable_on_vim_startup = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'fzf', 'neoterm']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#262626 ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=gray

" ## neoterm
let g:neoterm_autoscroll=1
let g:neoterm_default_mod='belowright'
let g:neoterm_size=10
nnoremap <C-s> :Tnew<CR>
tnoremap <silent> <C-w> <C-\><C-n><C-w>

" # KeyBind
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
nnoremap fr gt
nnoremap fe gT
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
noremap <Right> <C-w>>
noremap <Left> <C-w><
noremap <Up> <C-w>-
noremap <Down> <C-w>+
noremap <Tab> <C-u>
noremap <C-t> <C-o>

" ## Go
let g:go_bin_path = $GOBIN
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=4
autocmd FileType go setlocal shiftwidth=4

" ## Rust
let g:rustfmt_autosave = 1
let g:LanguageClient_serverCommands = {
        \ 'cpp': ['clangd'],
        \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ 'ruby': ['solargraph', 'stdio'],
        \ 'go': ['gopls'],
        \ }

""augroup LanguageClient_config
""autocmd!
""autocmd User LanguageClientStarted setlocal signcolumn=yes
""autocmd User LanguageClientStopped setlocal signcolumn=auto
""augroup END

let g:LanguageClient_autoStart = 1
nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>:normal! m`<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<CR>

" ## deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'input_patterns', {
    \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
\})

" # Setting
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
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
set clipboard+=unnamed
set inccommand=split
set tabstop=2 shiftwidth=2 expandtab
syntax on
colorscheme antares

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
