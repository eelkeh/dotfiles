if has('vim_starting')
  set runtimepath-=~/.vim
  set runtimepath^=~/vim-test/vim
  set runtimepath^=~/vim-test/vim/bundle/neobundle.vim
endif

let s:neobundle_dir = expand('~/vim-test/vim/bundle')

let g:neobundle#types#git#default_protocol = 'https'

call neobundle#begin(s:neobundle_dir)

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/deoplete.nvim'

NeoBundle 'marijnh/tern_for_vim', {
      \ 'build' : {
      \   'mac' : 'npm install'
      \ }}

filetype plugin indent on

call neobundle#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

au FileType javascript,jsx setl omnifunc=tern#Complete
