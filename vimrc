execute pathogen#infect()

" Setup powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup


syntax on

filetype plugin indent on

set autoindent                                         " Auto indent
set encoding=utf-8

set expandtab                                          " Expand tabs to spaces
set tabstop=2 shiftwidth=2                             " Set tab and shift width to this number of spaces

set number                                             " Show line numbers
set relativenumber                                     " show relative line numbers
au InsertEnter * :set nu                               " absolute line numbers in insert mode,
au InsertLeave * :set rnu                              " relative otherwise for easy movement

set ruler
set cursorline                                         " Highlight the current line
set nowrap                                             " Don't wrap lines
set vb                                                 " Disable audio bell, enable visual bell

set incsearch                                          " Show search as I type
set hlsearch                                           " highlight all search matches

set scrolloff=5                                        " Minimum lines below and above cursor§
set laststatus=2                                       " Always show statusbar
set nocompatible                                       " don't need to be compatible with old vim
set showmatch                                          " show bracket matches
set ttimeoutlen=100                                    " decrease timeout for faster insert with 'O'
set list listchars=tab:»·,trail:·,extends:❯,precedes:❮ " show extra space characters
set clipboard=unnamed                                  " use the system clipboard
set nobackup                                           " Do not keep a backup file
set backspace=indent,eol,start                         " Allow backspacing over everything in insert mode


set showbreak=↪


set background=dark
colorscheme base16-railscasts

highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

au BufReadPost *.twig set syntax=jinja

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

map <C-n> :NERDTreeToggle<CR>

