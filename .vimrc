"----- The Dein package manager ------
if &compatible
  set nocompatible               " Be iMproved
endif

" Set leader to Space
nnorema <SPACE> <Nop>
let mapleader = "\<space>"

" Required:
set runtimepath+=/Users/Haodong/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/Haodong/.vim/bundles')
  call dein#begin('/Users/Haodong/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/Haodong/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('jceb/vim-orgmode')
  call dein#add('preservim/nerdtree')
  call dein#add('preservim/nerdcommenter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-fugitive')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('easymotion/vim-easymotion')
  call dein#add('gu-fan/riv.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
"----- End Dein package manager ------


" auto toggle line number
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" highlight search
set hlsearch

" case insensitive search
set ignorecase
set smartcase

" backspace over autoindent, line breaks and start of insert
set backspace=indent,eol,start

" ask confirm save
set confirm

" mouse
set mouse=a

" Clear highlighting with Enter in command mode
nnoremap <CR> :noh<CR><CR>

" Indentation setting
set shiftwidth=4
set softtabstop=4
set expandtab

" remap for NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" do not continue comment
autocmd BufNewFile,BufRead * setlocal formatoptions-=o

" Magic
command -nargs=* -range SpeedDatingFormat

" Interact with system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

" airline theme
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

" set how white space is displayed
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" setting for easy motion
map <Leader> <Plug>(easymotion-prefix)

" split behaviours
set splitbelow
set splitright

" pass sequence to outer terminal to get bg
if exists("$TMUX")
    let &t_RB="\ePtmux;\e\e]11;?\007\e\\"
endif
