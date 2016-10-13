" prefer locally installed node modules
"
let $PATH = './node_modules/.bin;'. $PATH
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set nocompatible              " be iMproved, required
filetype off                  " required
set clipboard=unnamed
set hidden
set shell={fish}
set sh={fish}

let g:deoplete#sources#go#gocode_binary = '/Users/eelke/Go/bin//gocode'

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'
" js/jsx
Plug 'rschmukler/pangloss-vim-indent'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
" Plug 'pangloss/vim-javascript'
" autocompletion 
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', { 'do': 'make'}
" neovim only Plugs
Plug 'Shougo/deoplete.nvim'
Plug 'benekastah/neomake'
" clipboard shizzle
Plug 'svermeulen/vim-easyclip'
" the rest...
" Plug 'Valloric/YouCompleteMe'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ervandew/supertab'
Plug 'tomtom/tcomment_vim'
Plug 'gabesoft/vim-ags'
Plug 'itchyny/lightline.vim'
Plug 'tommcdo/vim-exchange'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-obsession'
Plug 'hynek/vim-python-pep8-indent'
Plug 'hdima/python-syntax'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'
Plug 'bkad/CamelCaseMotion'
" Search
Plug 'haya14busa/incsearch.vim'
" Clojure
Plug 'tpope/vim-fireplace'
Plug 'junegunn/rainbow_parentheses.vim'
" icons for nerdtree
Plug 'ryanoasis/vim-webdevicons'
" DIY Plugs
" Plug 'file:///Users/eelke/.vim/bundle/pymotion'
" Language definitions etc.
Plug 'elixir-lang/vim-elixir'
" Quickfix open in window
Plug 'yssl/QFEnter'
" Color schemes
Plug 'sjl/badwolf'
Plug 'mhartington/oceanic-next'
" Go support
Plug 'fatih/vim-go'
" Snippets!
Plug 'SirVer/ultisnips'
" Sublime like multiple cursor
Plug 'terryma/vim-multiple-cursors'
" Motions
Plug 'easymotion/vim-easymotion'
" rst support
Plug 'Rykka/riv.vim'
Plug 'justinmk/vim-gtfo'
" handlebars
Plug 'mustache/vim-mustache-handlebars'

call plug#end()

" Snippets home
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

" terminal <Esc> to exit insert mode
tnoremap <Esc> <c-\><c-n>

" Clear highlighting on escape in normal mode
" nnoremap <silent><esc> :noh<CR>
" nnoremap <esc>[ <esc>[

set completeopt+=noinsert
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'

" let g:deoplete#sources = {}
" let g:deoplete#sources_ = ['buffer','tag']
" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.javascript = '[^. \t]\.\w*'

" jedi autocomplete settings, disable most of it
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#show_call_signatures = 0

" tern
" autocmd FileType javascript setlocal omnifunc=tern#Complete

let g:tern_request_timeout = 10
let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete

" auto update files in buffer on change (?)
set autoread

" map command-s to F2 (iTerm2)
nnoremap <F6> :w<CR>

set rtp+=~/.fzf

" Neomake settings
autocmd! BufWritePost * Neomake
let g:neomake_logfile = '/var/log/neomake.log'

let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_javascript_enabled_makers = ['eslint']

" All of your Plugins must be added before the following line
filetype plugin indent on    " required

set laststatus=2
set re=1
set regexpengine=1
set nocursorcolumn
set nocursorline
set scrolloff=6
set ignorecase

" vimgrep ignore some folders
set wildignore+=node_modules/**,.git/**,sites-packages/**,build/**

" set vim shell
set shell=bash

" let base16colorspace=256  " Access colors present in 256 colorspace

" cosmetic
" Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark
" colorscheme base16-monokai
" set guifont=Andale\ Mono:h12
" set guifont=Andale\ Mono\ Plus\ Nerd\ File\ Types:h12
set guifont=Meslo\ LG\ M\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Book

" indents
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype indent on
" fix super annoying nested braces indents in css files
" au BufEnter *.s?css set nocindent
" au BufEnter *.s?css set autoindent

" xml indentation
" set equalprg=xmllint\ --format\ -

" delimitMate settings
let delimitMate_expand_cr = 1

" split behavior
set splitbelow
set splitright

" no esc plz
imap jj <Esc>
imap jk <Esc>

" easier window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" easymotion settings
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" replace all unde cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" select just pasted text
nnoremap gp `[v`]

" look for tags files
set tags=tags;/

" bubble lines up/down
nmap <C-Up> ddkP
nmap <C-Down> ddp
" bubble visual mode
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" search
" set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" react syntax in .js files
" let g:jsx_ext_required = 0

" xml indenting
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" from: http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" " no pause when leaving insert mode?
" set ttimeoutlen=50
"
" Nerdtree ignore python .pyc files
let NERDTreeIgnore = ['\.pyc$']

" fix python indendation
let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

" stuff from: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"
" nmap <Leader><Leader> V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Default settings. (NOTE: Remove comments in dictionary before sourcing)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'i}'  :1,
      \ 'ib'  :1,
      \ 'a]'  :1,
      \ 'a}'  :1,
      \ 'ab'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }

vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" vim fugitive remaps, from, inspired by https://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Git push origin<CR>

" ctrp settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build'
nnoremap <Leader>fu :CtrlPFunky<Cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" Vertical diffs in fugitive
set diffopt+=vertical

" Qargs to populate the args list with quicklist results
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" move swp files etc. to tmp dir
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('md', 'Gray', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('js', 'Cyan', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('py', 'Cyan', 'none', '#686868', '#151515')


nnoremap <buffer> ]]  :<C-U>call pymotion#ftplugin#python#move('<Bslash>v^(class<bar>def)<Bslash>s', '')<CR>
nnoremap <buffer> [[  :<C-U>call pymotion#ftplugin#python#move('<Bslash>v^(class<bar>def)<Bslash>s', 'b')<CR>
nnoremap <buffer> ]C  :<C-U>call pymotion#ftplugin#python#move('<Bslash>v^(class<bar>def)<Bslash>s', '')<CR>
nnoremap <buffer> [C  :<C-U>call pymotion#ftplugin#python#move('<Bslash>v^(class<bar>def)<Bslash>s', 'b')<CR>
nnoremap <buffer> ]M  :<C-U>call pymotion#ftplugin#python#move('^<Bslash>s*def<Bslash>s', '')<CR>
nnoremap <buffer> <Leader>j  :<C-U>call pymotion#ftplugin#python#move('^<Bslash>s*def<Bslash>s', '')<CR>
nnoremap <buffer> [M  :<C-U>call pymotion#ftplugin#python#move('^<Bslash>s*def<Bslash>s', 'b')<CR>
nnoremap <buffer> <Leader>k  :<C-U>call pymotion#ftplugin#python#move('^<Bslash>s*def<Bslash>s', 'b')<CR>

onoremap <buffer> ]]  :<C-U>call pymotion#ftplugin#python#move('<Bslash>v^(class<bar>def)<Bslash>s', '')<CR>
onoremap <buffer> [[  :<C-U>call pymotion#ftplugin#python#move('<Bslash>v^(class<bar>def)<Bslash>s', 'b')<CR>
onoremap <buffer> ]C  :<C-U>call pymotion#ftplugin#python#move('<Bslash>v^(class<bar>def)<Bslash>s', '')<CR>
onoremap <buffer> [C  :<C-U>call pymotion#ftplugin#python#move('<Bslash>v^(class<bar>def)<Bslash>s', 'b')<CR>
onoremap <buffer> ]M  :<C-U>call pymotion#ftplugin#python#move('^<Bslash>s*def<Bslash>s', '')<CR>
onoremap <buffer> [M  :<C-U>call pymotion#ftplugin#python#move('^<Bslash>s*def<Bslash>s', 'b')<CR>

vnoremap <buffer> ]]  :call pymotion#ftplugin#python#vmove('<Bslash>v^(class<bar>def)<Bslash>s', '')<CR>
vnoremap <buffer> [[  :call pymotion#ftplugin#python#vmove('<Bslash>v^(class<bar>def)<Bslash>s', 'b')<CR>
vnoremap <buffer> ]M  :call pymotion#ftplugin#python#vmove('^<Bslash>s*def<Bslash>s', '')<CR>
vnoremap <buffer> [M  :call pymotion#ftplugin#python#vmove('^<Bslash>s*def<Bslash>s', 'b')<CR>

onoremap <buffer> C  :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*class<Bslash>s', 0)<CR>
onoremap <buffer> aC :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*class<Bslash>s', 0)<CR>
onoremap <buffer> iC :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*class<Bslash>s', 1)<CR>
vnoremap <buffer> aC :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*class<Bslash>s', 0)<CR>
vnoremap <buffer> iC :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*class<Bslash>s', 1)<CR>

onoremap <buffer> M  :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*def<Bslash>s', 0)<CR>
onoremap <buffer> aM :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*def<Bslash>s', 0)<CR>
onoremap <buffer> iM :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*def<Bslash>s', 1)<CR>
vnoremap <buffer> aM :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*def<Bslash>s', 0)<CR>
vnoremap <buffer> iM :<C-U>call pymotion#ftplugin#python#select('^<Bslash>s*def<Bslash>s', 1)<CR>
