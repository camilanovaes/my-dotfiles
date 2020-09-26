" NEOVIM CONFIGURATION
"
" Author: Camila Novaes <novaes.csw@gmail.com>
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set cursorline						" Highlight current line
set nohlsearch						" Stop highlight search
set noerrorbells					" Disable ring the bell for error messages
set tabstop=4 softtabstop=4			" One tab == four spaces
set shiftwidth=4					" One tab == four spaces
set noexpandtab
set smartindent						" Be smart when indenting :P
set smarttab						" Be smart using tabs :B
set number relativenumber			" Set relative line numbers
set textwidth=80					" Define text width
set colorcolumn=80
set mouse=a							" Enable mouse support in all vim modes
set inccommand=nosplit
set nobackup						" No auto backups
set noswapfile						" No swap file
set incsearch						" Incremental search
set splitbelow splitright			" Set new split below/right
set noshowmode
set termguicolors					" Enables 24-bit color in the TUI
set undodir=~/.vim/undodir
set undofile
set scrolloff=8						" Minimal number of lines do keep above the
									" cursor.

let mapleader = " "					" Set space bar as leader key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Basics
Plug 'tpope/vim-surround'								" Surround for (, [
Plug 'tpope/vim-commentary'								" Commentary
Plug 'plasticboy/vim-markdown'							" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'mbbill/undotree'									" Undo history
Plug 'sheerun/vim-polyglot'								" Language pack
Plug 'junegunn/vim-easy-align'							" Alignment tool
Plug 'sirver/ultisnips'									" Snippets
Plug 'honza/vim-snippets'
Plug 'vim-test/vim-test'

" Latex
Plug 'lervag/vimtex'									" Latex

" Git
Plug 'junegunn/gv.vim'									" Commits view
Plug 'tpope/vim-fugitive'								" Core plugin
Plug 'stsewd/fzf-checkout.vim'

" File management
Plug 'scrooloose/nerdtree'								" Nerdtree
Plug 'junegunn/fzf'										" Fuzzy search
Plug 'junegunn/fzf.vim'									" Fuzzy search

" Productivity
Plug 'airblade/vim-gitgutter'							" Git plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}			" Autocomplete
Plug 'mhinz/vim-startify'								" Home page
Plug 'majutsushi/tagbar'								" Tag bar

" Visual
Plug 'machakann/vim-highlightedyank'					" Highlight yank
Plug 'vim-airline/vim-airline'						   	" Powerline bar
Plug 'ntpeters/vim-better-whitespace'					" Show whitespaces
Plug 'thaerkh/vim-indentguides'							" Indent lines
Plug 'gruvbox-community/gruvbox'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" THEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gruvbox
colorscheme gruvbox
set background=dark

let g:airline_theme = 'gruvbox'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STARTIFY
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
         \ { 'type': 'sessions',  'header': ['   Sessions']},
         \ { 'type': 'files',     'header': ['   Files']},
         \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()]},
         \ { 'type': 'bookmarks', 'header': ['   Bookmarks']},
         \ ]

let g:startify_bookmarks = [
         \ { 't': '~/.tmux.conf' },
         \ { 'i': '~/.config/nvim/init.vim' },
         \ { 'z': '~/.zshrc' },
         \ '~/Development/kalman_stdy/Kalman-and-Bayesian-Filters-in-Python',
         \ '~/Development/ufa23/',
         \ ]
let g:startify_custom_header = [""]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NAVIGATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Adjust split size easily
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert/horiz or horiz/vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

inoremap <C-c> <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTREE and TAGBAR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-m> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUZZYSEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-space> :GFiles<CR>
nnoremap <silent> <C-T> :Ag<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GIT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gs :vertical Gstatus<CR>
nmap <Leader>gp :Gpush<Space>
nmap <Leader>gi :Gdiff<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gk :Glog<CR>
nnoremap <leader>gc :GCheckout<CR>

" GV - Git commit browser
nmap <Leader>gl :GV<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM TEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LATEX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=2
let g:tex_conceal=''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SNIPPETS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-n>'
let g:UltiSnipsJumpBackwardTrigger = '<c-p>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.mysnippets']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UNDO HISTORY
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>u :UndotreeShow<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable window preview
set completeopt-=preview

" Give more space for displaying messages.
set cmdheight=2

" Set update time
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>co <Plug>(coc-diagnostic-prev)
nmap <leader>cn <Plug>(coc-diagnostic-next)
nmap <leader>t <Plug>(coc-terminal-toggle)

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword")<CR><CR>

" COC extensions
let g:coc_global_extensions = [
	\ 'coc-python',
	\ 'coc-terminal',
	\ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display fzf window settings
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" POLYGLOT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHERS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hightlight yank
hi HighlightedyankRegion cterm=reverse gui=reverse

" Highlighting and stripping whitespace on save
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save  = 1

" Open terminal inside vim
" map <Leader>tt :bel 10 split term://zsh<CR>

" Aligment
" Ex. gaip=
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func GoYCM()
	:CocDisable
	nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PYTHON
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Highlighting
let python_highlight_all=1

" Diff colorscheme
highlight DiffAdd    gui=bold guifg=#87d700 guibg=#6c6c6c
highlight DiffDelete gui=none guibg=#4e4e4e
highlight DiffChange gui=bold guibg=#6c6c6c
highlight DiffText   gui=bold guifg=Black guibg=#ff0000

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif
