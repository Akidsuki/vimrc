"##### カラースキーマ #####

"##### 表示設定 #####
set number " 行番号を表示
set title " 編集中のファイル名を表示
set showmatch " 括弧入力中の対応する括弧を表示
syntax on " コードの色分け
set tabstop=4 " インデントをスペース4つ分に設定
set smartindent " スマートインデント
set autoindent " オートインデント
set autoread " ファイルが外部で変更された際に自動で読み込む
set clipboard=unnamed,autoselect " OSとクリップボードを共有
set encoding=utf8 " 文字コードをUTF-8に
set fileencodings=utf-8,iso-2022-jp,enc-jp,sjis " 文字コードの設定
set hidden " ファイル変更中に他のファイルを表示可能にする
set history=1000 " 履歴数の設定
set hlsearch " 検索結果をハイライト表示する
set mouse=a " マウスを有効にする
set noswapfile " スワップファイルを作成しない
set shiftwidth=2 "インデントでずれる幅を設定する
set showcmd " 入力中のコマンドを表示する
set smarttab " コンテキストに応じたタブの処理を行う
set splitbelow
set splitright " 新しいウィンドウを下/右に開く
set visualbell t_vb= " ビープ音を無効にする
set wildmenu " コマンドラインモードでの保管を有効にする
set wildmode=list:longest,full " コマンドモードでの保管方法を設定する
set wrap " 行を折り返す
set list " 不可視文字を表示
set noerrorbells " エラーメッセージの表示時にビープを鳴らさない
set expandtab " TABキーを押した際にTAB文字に代わりにスペースを入れる
nmap <Esc><Esc> :nohlsearch<CR><Esc> " ESC連打で検索文字のハイライトを非表示にする
set cursorline " 現在の行を強調表示
set cursorcolumn " 現在の列を強調表示
set guioptions+=a " yでコピーした時にクリップボードに入れる
set paste " ペースト時にインデントが崩れるのを防ぐ
set ruler " カーソルの位置表示を行う
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[5 q"
set completeopt=menuone

"###### 検索設定 ######
set ignorecase " 大文字小文字の区別なく検索する
set smartcase " 検索時に文字列に大文字が含まれている場合は区別して検索する
set wrapscan " 検索時に最後まで行ったら最初に戻る


"##### dein #####
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')

call dein#add('Townk/vim-autoclose')
call dein#add('vim-airline/vim-airline')
call dein#add('digitaltoad/vim-pug')
call dein#add('tpope/vim-rails')
call dein#add('pangloss/vim-javascript')
call dein#add('w0ng/vim-hybrid')
colorscheme hybrid
set background=dark
call dein#add('mxw/vim-jsx')
call dein#add('slim-template/vim-slim')
call dein#add('rhysd/accelerated-jk')
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
call dein#add('osyo-manga/vim-monster')
call dein#add('Shougo/neocomplete.vim')
let g:neocomplcache_enable_at_startup = 1 " neocomplcacheを起動時に自動起動
let g:neocomplcache_enable_underbar_completion = 1 " _区切りの保管を有効かする
let g:neocomplcache_min_syntax_length = 3 " シンタックスをキャッシュするときの最小文字長を3にする
" vim-monsterを有効にする
let g:neocomplete#sources#omni#input_patterns = {"ruby" : '[^. *\t]\.\w*\|\h\w*::'}
let g:neocomplcache_max_list = 20
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"



call dein#add('thinca/vim-quickrun')
call dein#add('scrooloose/nerdtree')
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call dein#end()

if dein#check_install()
  call dein#install()
endif


if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
endif
