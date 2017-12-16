let g:python_host_prog='/home/mortenmj/.virtualenvs/neovim2/bin/python2'
let g:python3_host_prog='/home/mortenmj/.virtualenvs/neovim3/bin/python3'
let g:mapleader = "\<Space>"
let g:maplocalleader = ";"
inoremap jk <esc>

" Define some paths/variables
let s:main = fnamemodify(expand('<sfile>'), ':h')
let s:init_script = s:main . '/init.sh'
let s:plug = s:main . '/autoload/plug.vim'
let s:bundle = s:main . '/bundle'

if empty(glob("~/.config/nvim/autoload/plug.vim"))
  echo "Installing vim-plug..."
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Run :PlugInstall to install plugins"
endif

" Plugins initialization start {{{
call plug#begin(s:bundle)
" }}}

" Completion
" ====================================================================
function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name: name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force: set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !./install.py
    endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }


" File Navigation
" ====================================================================
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Text Navigation
" ====================================================================

" Text Manipulation
" ====================================================================

" Languages
" ====================================================================
Plug 'scrooloose/syntastic'
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

" Git
" ====================================================================
Plug 'tpope/vim-fugitive'

" Appearance
" ====================================================================
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'

call plug#end() " Plugins initialization finished {{{
" }}}

" General settings {{{
" ====================================================================
set clipboard=unnamed,unnamedplus
set number         " show line numbers
set relativenumber " use relative lines numbering by default
set noswapfile     " disable creating of *.swp files
set hidden         " hide buffers instead of closing
set lazyredraw     " speed up on large files
set mouse=         " disable mouse
set encoding=utf8  " use utf8
set guifont=DroidSansMono_Nerd_Font:h11

set scrolloff=999       " always keep cursor at the middle of screen
set virtualedit=onemore " allow the cursor to move just past the end of the line
set undolevels=5000     " set maximum undo levels

set foldmethod=indent       " use syntax folding
set diffopt=filler,vertical " default behavior for diff

set nowrap        " disable wrap for long lines
set textwidth=0   " disable auto break long lines

" }}}
" Indentation {{{
" ====================================================================
set expandtab     " replace <Tab with spaces
set tabstop=4     " number of spaces that a <Tab> in the file counts for
set softtabstop=4 " remove <Tab> symbols as it was spaces
set shiftwidth=4  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
" }}}
" Search {{{
" ====================================================================
set ignorecase " ignore case of letters
set smartcase  " override the 'ignorecase' when there is uppercase letters
set gdefault   " when on, the :substitute flag 'g' is default on
" }}}
