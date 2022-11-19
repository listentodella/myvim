" Vundle manage
" Vundle工具安装方法为在终端输入如下命令
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required
set hlsearch        "高亮搜索
set incsearch       "在输入要搜索的文字时，实时匹配
"set ignorecase      "搜索时忽略大小写
set smartcase       "如果搜索模式包含大写字符, 则不忽略大小写
"set noinsearch     "在输入要搜索的文字时, 取消实时匹配
set mouse=a                    " 在任何模式下启用鼠标
set t_Co=256                   " 在终端启用256色
set backspace=2                " 设置退格键可用
set nu!                                            "显示行号

set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set foldenable                                        "启用折叠
set foldmethod=indent                                 "indent 折叠方式
set foldlevel=9999                                    " 折叠的层次，打开文件时默认不折叠
let mapleader = ","
let g:indentLine_color_term = 239
set cmdheight=1                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
hi CursorLine   cterm=NONE ctermbg=white ctermfg=white guibg=darkred guifg=white

set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
" 当文件在外部被修改，自动更新该文件
set autoread

"au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()
" 自动切换目录为当前编辑文件所在目录
"au BufRead,BufNewFile,BufEnter * cd %:p:h
" 打开文件时回到上次位置
au BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe("norm '\"") | else |exe "norm $"| endif | endif


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'winManager'
Plugin 'Mark--Karkat'
"Plugin 'luochen1990/rainbow'
Plugin 'vim-scripts/minibufexplorerpp'
Plugin 'majutsushi/tagbar' " Tag bar"
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ronakg/quickr-cscope.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline' | Plugin 'vim-airline/vim-airline-themes' " Status line"
Plugin 'jiangmiao/auto-pairs'
Plugin 'EasyMotion'
Plugin 'mbbill/undotree'
Plugin 'gdbmgr'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine' " Indentation level"
Plugin 'bling/vim-bufferline' " Buffer line"
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'biskark/vim-ultimate-colorscheme-utility'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'flazz/vim-colorschemes.git'
"Plugin 'LeaderF'
"let g:Lf_ReverseOrder = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" 不用每次询问.ycm_extra_conf.py位置
let g:ycm_confirm_extra_conf=0


"set guifont=Monospace\ 14


syntax enable
syntax on


set background=dark
"colorscheme solarized
"colorscheme desert
"colorscheme molokai
" 随机主题
"<leader><leader>a    " Adds the current colorscheme to favorites
"<leader><leader>A    " Removes the current colorscheme from favorites
"<leader><leader>f    " Goes to next colorscheme in filetype specific favorites
"<leader><leader>F    " Goes to previous colorscheme in filetype specific favorites
"<leader><leader>g    " Goes to next colorscheme in global favorites
"<leader><leader>G    " Goes to previous colorscheme in global favorites
"<leader><leader>n    " Goes to next colorscheme in all colors
"<leader><leader>N    " Goes to previous colorscheme in all colors
"
"<leader><leader>t    " Adds the current font to favorites
"<leader><leader>T    " Removes the current font from favorites
"<leader><leader>e    " Goes to the next font in filetype specific favorites
"<leader><leader>E    " Goes to the previous font in filetype specific favorites
"<leader><leader>r    " Goes to the next font in global favorites
"<leader><leader>R    " Goes to the previous font in global favorites
"<leader><leader>q    " Views all favorites"
"
"
let g:airline_powerline_fonts = 1
set laststatus=2  "永远显示状态栏
"let g:airline_theme='bubblegum' "选择主题
"let g:airline#extensions#tabline#enabled=1    "Smarter tab line: 显示窗口tab和buffer




:set autowrite   " 自动保存

set foldmethod=syntax
set foldlevel=100  " 启动vim时不要自动折叠代码
"  折行
"autocmd FileType c,cpp  setl fdm=syntax | setl fen

 "--------------------------------------------------------------------------------
 " TagList :Tlist 和 wm
 "--------------------------------------------------------------------------------
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"let Tlist_Show_Menu=1
"let Tlist_Auto_Open=1

"let g:winManagerWindowLayout='TagList'
"nmap wm :WMToggle<cr>

" syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"--------------------------------------------------------------------------------
" cscope:建立数据库：cscope -Rbq；  F5 查找c符号； F6 查找字符串；   F7 查找函数谁调用了，
"--------------------------------------------------------------------------------
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

"set cscopequickfix=s-,c-,d-,i-,t-,e-

"nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"F5 查找c符号； F6 查找字符串；   F7 查找函数定义； F8 查找函数谁调用了，
"nmap <silent> <F5> :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR> 
"nmap <silent> <F6> :cs find t <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
"nmap <silent> <F7> :cs find g <C-R>=expand("<cword>")<CR><CR> 
"nmap <silent> <F7> :cs find c <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>

nmap <silent> <F5> <plug>(quickr_cscope_symbols)
nmap <silent> <F6> <plug>(quickr_cscope_text)
nmap <silent> <F7> <plug>(quickr_cscope_callers)

let g:quickr_cscope_keymaps = 0
let g:quickr_cscope_use_qf_g = 1
nmap <C-\>s  <plug>(quickr_cscope_symbols)
nmap <C-\>g  <plug>(quickr_cscope_global)
nmap <C-\>c  <plug>(quickr_cscope_callers)
nmap <C-\>t  <plug>(quickr_cscope_text)
nmap <C-\>f  <plug>(quickr_cscope_functions)
nmap <C-\>i  <plug>(quickr_cscope_includes)
nmap <C-\>e  <plug>(quickr_cscope_egrep)
"nmap <C-\>f  <plug>(quickr_cscope_files)
"nmap <C-\> <plug>(quickr_cscope_assignments)



 "--------------------------------------------------------------------------------
"  自动加载ctags: ctags -R
"if filereadable("tags")
      set tags=tags
      "set tags=tags;
      "set autochdir
"endif
"set tags=tags;
"set autochdir


"  自动保存 kernel 的ctags文件
if isdirectory("kernel/") && isdirectory("mm/")
	au BufWritePost *.c,*.h silent! !ctags -L tags.files&
	au BufWritePost *.c,*.h silent! !cscope -bkq -i tags.files&
endif


"--------------------------------------------------------------------------------
" global:建立数据库
"--------------------------------------------------------------------------------
if filereadable("GTAGS")
	set cscopetag
	set cscopeprg=gtags-cscope
	cs add GTAGS
	au BufWritePost *.c,*.cpp,*.h silent! !global -u &
endif


 "--------------------------------------------------------------------------------
 " QuickFix
 "--------------------------------------------------------------------------------
 nmap <F3> :cn<cr>   " 切换到下一个结果
 nmap <F4> :cp<cr>   " 切换到上一个结果

 "--------------------------------------------------------------------------------
" MiniBufExp :  Ctrl + Tab 键可以在minibuf中选择，Ctrl+h,j,k,l或者方向键
" 来选择窗口
 "--------------------------------------------------------------------------------
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>
imap <c-k> <Up>
imap <c-h> <Left>
imap <c-l> <Right>
" Ctrl + f 光标跳转到行头
imap <c-f> <ESC>0i
" Ctrl + e 光标跳转到行尾
imap <c-e> <ESC>$i

" -----------------------------------------------------------------------------
"  < Tagbar 插件配置 >
" -----------------------------------------------------------------------------
" 相对 TagList 能更好的支持面向对象

" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
nmap tb :TlistClose<CR>:TagbarToggle<CR>

" Tagbar
"nmap tag :TagbarToggle<CR>
let g:tagbar_width=25
autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()
"退出VIM时自动关闭tagbar
autocmd bufenter * if (winnr("$") == 3 && exists("b:TagbarType") &&b:TagbarType == "primary")  | qa | endif

" -----------------------------------------------------------------------------
"  < TagList 插件配置 >
" -----------------------------------------------------------------------------
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等

" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
nmap tl :TagbarClose<CR>:Tlist<CR>
let Tlist_Show_One_File=1                   "只显示当前文件的tags
" let Tlist_Enable_Fold_Column=0              "使taglist插件不显示左边的折叠行
let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_File_Fold_Auto_Close=1            "自动折叠
let Tlist_WinWidth=25                       "设置窗口宽度
let Tlist_Use_Right_Window=1                "在右侧窗口中显示
"退出VIM时自动关闭taglist
autocmd bufenter * if (winnr("$") == 3 && exists("b:TagListType") &&b:TagbarType == "primary")  | qa | endif


" -----------------------------------------------------------------------------
" 常规模式下输入 F2 调用插件
"
nmap <F2> :NERDTreeToggle<CR>
" NerdTree
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeWinSize=20
let NERDTreeShowLineNumbers=0
"let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



 "--------------------------------------------------------------------------------
 " A, c和h文件切换
 "--------------------------------------------------------------------------------
nnoremap <silent> <F12> :A<CR>

""easymotion color
"https://github.com/easymotion/vim-easymotion/blob/master/doc/easymotion.txt
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen
hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search

"if (exists('g:rainbow_active') && g:rainbow_active)
"    auto syntax * call rainbow#hook()
"    auto colorscheme * call rainbow#show()
"    " 下面这命令使rainbow在vim启动时被打开
"    autocmd VimEnter * nested call rainbow#toggle()
"endif
"
" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
