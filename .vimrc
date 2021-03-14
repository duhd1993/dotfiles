" Set leader to Space
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

Plug 'jceb/vim-orgmode'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'gu-fan/riv.vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

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

" Clear highlighting with double click space
nnoremap <leader><space> :noh<CR>

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
nnoremap <leader>o :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" setting for easy motion
map <Leader> <Plug>(easymotion-prefix)

" mapping for fzf
nnoremap <silent> <leader>f :Files<CR>

" split behaviours
set splitbelow
set splitright

" set toggle for paste mode
set pastetoggle=<F2>

" pass sequence to outer terminal to get bg
if $TERM =~ "tmux"
    let &t_RB="\ePtmux;\e\e]11;?\007\e\\"
endif

" paste does not replace default buffer
xnoremap <silent> p p:let @"=@0<CR>

" fix meta-keys which generate <Esc>a .. <Esc>z
if !has("nvim")
    set ttimeoutlen=100
    exec "set <M-n>=\<Esc>n"
    exec "set <M-p>=\<Esc>p"
endif
