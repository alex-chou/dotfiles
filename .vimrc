"
" Vim-Plug Configs
" Installation: https://github.com/junegunn/vim-plug#installation
"
    " install vim-plug automatically if it is not there already
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif

    " plug ins that we want to install
    call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'Yggdroot/indentLine'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'fholgado/minibufexpl.vim'
    Plug 'fatih/vim-go'
    call plug#end()

"
" Key Mappings
"
    " set <leader> to be space key
    let mapleader=" "

    " reload vim configuration
    map <Leader>s :source ~/.vimrc<CR>

    " move to left, down, up, right buffers
    map <C-h> <C-W>h
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-l> <C-W>l

    " toggle NERDTree on and off
    map <silent> <C-n> :NERDTreeToggle<CR>

    " look for files
    map <C-f> :Files<CR>

    " quick save, quit, save & quit
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>q :q<CR>
    nnoremap <Leader>x :x<CR>

"
" Wrap Configs
"
    " allow specified keys to move the cursor move to the next line
    set whichwrap+=<,>,h,l

    " turn on wraparound for text when it gets too long
    set wrap

"
" Tab Configs
"
    " # of columns for \\t
    set tabstop=4

    " replace tab with spaces
    set expandtab

    " # of spaces for tab
    set shiftwidth=4

    " # of columns for tab key or backspace
    set softtabstop=4

    " smart auto indent for new line
    set autoindent
    set smartindent

"
" Search Configs
"
    " turn on highlight search
    set hlsearch

    " incrementally highlights as searching
    set incsearch

    " turn on regex for search
    set magic

    " get rid of highlighting for a search
    nnoremap <silent> <Leader><Esc> :nohl<CR>

"
" File and Backup Configs
"
    " enable filetype plugins
    filetype indent plugin on

    " auto read the file if it has been changed elsewhere
    set autoread

    " no backup after file has been written
    set nobackup
    set nowritebackup

    " turn off swap file
    set noswapfile

    " use unix as the standard file type
    set ffs=unix,dos,mac

    " undo file configurations
    try
        " try to create the undo-dir
        if !isdirectory($HOME."/.vim/undodir")
            call mkdir($HOME."/.vim/undodir", "", 0700)
        endif

        set undofile
        set undodir=~/.vim/undodir
    catch
    endtry

"
" Misc Configs
"
    " enable syntax highlighting
    syntax enable

    " color scheme located in ~/.vim/colors
    colorscheme Tomorrow-Night

    " if a buffer is hidden, it is abandoned
    set hidden

    " the number of lines vim should remember
    set history=700

    " allow backspace to work as expected
    set backspace=indent,eol,start

    " turn on line numbers
    set number

    " create a colored column
    set colorcolumn=80

    " set utf8 as standard encoding and en_us as standard language
    set encoding=utf8

    " disable redraw when executing macros
    set lazyredraw

    " show matching brackets
    set showmatch

    " splits new vertical split to the right and new horizontal to the bottom
    set splitbelow splitright

    " removes trailing whitespaces
    autocmd BufWritePre * :%s/\s\+$//e

"
" Go Configs
"
    autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=0 noexpandtab
    autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
    autocmd FileType go nmap <leader>b <Plug>(go-build)
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd FileType go nmap <leader>l :GoMetaLinter<CR>

    " Syntax stuff
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_interfaces = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"

"
" Ruby Configs
"
    autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

"
" C Configs
"
    autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2

"
" Python Configs
"
    autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 autoindent nosmartindent
