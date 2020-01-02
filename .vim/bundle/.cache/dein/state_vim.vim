if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/Users/tako8ki/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim82,/usr/local/share/vim/vimfiles/after,/Users/tako8ki/.vim/after,/Users/tako8ki/.vim/bundle/.cache/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/tako8ki/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/tako8ki/.vim/bundle/.cache/dein'
let g:dein#_runtime_path = '/Users/tako8ki/.vim/bundle/.cache/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/tako8ki/.vim/bundle/.cache/dein/.cache/.vimrc'
let &runtimepath = '/Users/tako8ki/.vim,/usr/local/share/vim/vimfiles,/Users/tako8ki/.vim/bundle/.cache/dein/repos/github.com/Shougo/dein.vim,/Users/tako8ki/.vim/bundle/.cache/dein/.cache/.vimrc/.dein,/usr/local/share/vim/vim82,/Users/tako8ki/.vim/bundle/.cache/dein/.cache/.vimrc/.dein/after,/usr/local/share/vim/vimfiles/after,/Users/tako8ki/.vim/after'
