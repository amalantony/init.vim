" directory for plugins
call plug#begin("~/.config/nvim/plugged")
  " Plugin Section
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'dracula/vim'
  Plug 'scrooloose/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'lifepillar/vim-mucomplete'
  Plug 'alvan/vim-closetag'
  Plug 'pangloss/vim-javascript'
  Plug 'chemzqm/vim-jsx-improve'
  Plug 'mileszs/ack.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'gruvbox-community/gruvbox'
  Plug 'crusoexia/vim-monokai'
call plug#end()


" F9 folds code
set foldmethod=indent
set foldlevel=99

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" set space as leader
let mapleader=" "

" Use the_silver_searcher for code search with Ack.vim - need to setup both
" silver_searher and ack.vim for this to work:
let g:ackprg = 'ag --nogroup --nocolor --column'

" Ack keyboard bindings for better search experience - open new tab and search
" with Leader-a and search word under cursor with Leader-A
nmap <leader>a :tab split<CR>:Ack<Space>
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>


set rtp+=~/.fzf
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" Use silver searcher - doesn't autocomplete .gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>


if (has("termguicolors"))
 set termguicolors
endif
syntax enable

" let g:gruvbox_contrast_dark="hard"
colorscheme dracula

set number
set mouse=a
set smartindent
syntax enable
set nohlsearch

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2


" Code folding with space
" set foldmethod=indent
" set foldlevel=99
" nnoremap <space> za


" Easier split navigations nnoremap <C-J> <C-W><C-J>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enter shouldn't insert new line while autcompleting
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))


