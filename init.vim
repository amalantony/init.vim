" directory for plugins
call plug#begin("~/.config/nvim/plugged")
  " Plugin Section
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python', 'coc-solargraph']
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
  Plug 'mattn/emmet-vim'
  Plug 'christoomey/vim-tmux-navigator'
  " Color themes
  Plug 'gruvbox-community/gruvbox'
  Plug 'crusoexia/vim-monokai'
  Plug 'chase/focuspoint-vim'
  Plug 'https://gitlab.com/yorickpeterse/happy_hacking.vim.git'
  Plug 'junegunn/seoul256.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'nanotech/jellybeans.vim'
  Plug 'dracula/vim'
  Plug 'tpope/vim-vividchalk'
  Plug 'lewis6991/moonlight.vim'
  Plug 'cocopon/iceberg.vim'

  Plug 'vimwiki/vimwiki'
  Plug 'mattn/calendar-vim'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'yuezk/vim-js'
  Plug 'chemzqm/vim-jsx-improve'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['css', 'less', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }
call plug#end()

" open new vertical split to the right , and horizontal split below
set splitright
set splitbelow

" Fold settings
set foldmethod=indent
set foldlevel=99

" IgnoreCase for search by default 
" -> to not ignore case, do :set noic before search
set ic

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

" Prettier autosave
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

set rtp+=~/.fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" Use silver searcher - doesn't autocomplete .gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" NERDTree configs
" --------------------------------
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>
" Show current file in NERDTree
nnoremap <C-f> :NERDTreeFind <CR>
nmap <silent> <leader>nr :NERDTreeRefreshRoot<CR>
" --------------------------------


" Control-P to trigger FZF
nnoremap <silent> <C-p> :FZF<CR>

" Leader c closes current tab with all splits
nnoremap  <C-q> :tabclose<CR>


if (has("termguicolors"))
 set termguicolors
endif


" --------- Color Scheme Related
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"

set background=dark
colorscheme monokai
" Enable transparent background
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" ---------
set t_Co=256
set relativenumber
set number
set mouse=a
set smartindent
set nohlsearch
set hlsearch
nmap <silent> <leader>h :noh<CR>

" Vim wiki configs
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '$HOME/Dropbox/wiki'}] " set path to a directory inside Dropbox
let g:vimwiki_ext = '.md' " set extension to .md
let g:vimwiki_global_ext = 0 " make sure vimwiki doesn't own all .md files

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
" inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

" set Text width to 80 for files like MarkDown, for easy readbility
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal fo+=t
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal fo+=t
" au BufRead,BufNewFile *.md,*.txt :CocDisable

" Move to next line when at end of current line by pressing l
:set whichwrap=lh


" Toggle TODO items in Vik Wiki 
:nmap <Leader>t <Plug>VimwikiToggleListItem


" :Diary Command to go to diary index page. Also, an autocommand to 
" auto-generate the diary entry links on open 
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

" Rename variable shorcut
nmap <leader>rn <Plug>(coc-rename)

" show current time in Airline status bar
" let g:airline_section_b = '%{strftime("%H:%M")}'
"
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Disable middle click paste, upto 4 times
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>
:map <2-MiddleMouse> <Nop>
:imap <2-MiddleMouse> <Nop>
:map <3-MiddleMouse> <Nop>
:imap <3-MiddleMouse> <Nop>
:map <4-MiddleMouse> <Nop>
:imap <4-MiddleMouse> <Nop>

