"Use Vim instead of Vi
"Must be first because it changes other options as a side effect
set nocompatible

"Set line numbers
set number

"Make jj do esc
"Must use esc in recording macros
"i for insert mode 
"map for normal, visual, select, opereator pending modes
imap jj <Esc>

"Tab characters will appear 4 spaces wide
":set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
"For python
"set tabstop=8
"set expandtab
"set softtabstop=4
"set shiftwidth=4
"filetype indent on 

"Use mac preferences"
syntax on

"Modified from og_vimrc. Return to last position in file
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

"Highlight searched words
set hlsearch

"Enable mouse
if has('mouse')
set mouse=a
endif

set autoindent
set smartindent

"Yank and Pull up to 500 lines
set viminfo+=<500

set nocompatible              " be iMproved, required
filetype off                  " required

"Statusline shows current mode, filename, modified status on left
"on right it shows file format, encoding, fileetype, and cursor position
"So lightline (color status bar) works on single screen
set laststatus=2
"So insert does not show in the status line. Interferring with lightline
set noshowmode
"This removes file format and encoding 
"no ft means no filetype
let g:lightline = {
      \ 'active': {
      \   'right': [ [ 'mode', 'paste' ],
      \              [ 'percent' ],
      \              [ 'filetype', ] ]
      \ },
      \ }


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" These plugins come from https://www.vimfromscratch.com/articles/vim-for-javascript-and-react-in-2019/
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'othree/yajs.vim'
Plugin 'preservim/NERDtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'maxmellon/vim-jsx-pretty'

" On demand loading 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

"This is for prettier. Installation from https://www.vimfromscratch.com/articles/vim-for-javascript-and-react-in-2019/
" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

au FileType javascript | autocmd vimenter * NERDTree | wincmd p 

set modeline
