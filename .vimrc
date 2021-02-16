:set number
:set incsearch
:set ic
:set hlsearch 

set encoding=UTF-8

hi Search ctermbg=DarkBlue
hi CursorLineNr ctermfg=white guifg=white guibg=grey
hi CursorLine cterm=NONE
hi LineNr ctermfg=Black 
hi clear SignColumn

:set relativenumber  
:syntax on

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <C-g> :Buffers<Cr>
nnoremap <C-f> :Rg<Cr>
nnoremap <C-p> :ProjectFiles<Cr>
nnoremap w :w<Cr>
"Delete the current buffer/tab
nnoremap <C-x> :bp\|bd #<Cr>
nnoremap <C-h> :bp<Cr>
nnoremap <C-l> :bn<Cr>
let mapleader = "\<Space>"

nnoremap s _
nnoremap t $
nnoremap n b
nnoremap l k
nnoremap u j
nnoremap b n
nnoremap f t
nnoremap j l
nnoremap k u

onoremap s _
onoremap t $
onoremap n b
onoremap l k
onoremap u j
onoremap b n
onoremap f t
onoremap j l

vnoremap s _
vnoremap t $
vnoremap n b
vnoremap l k
vnoremap u j
vnoremap b n
vnoremap f t

map <C-n> :NERDTreeToggle<Cr>

"inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_symbols.maxlinenr = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set noshowmode

""" COC config

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

set statusline^=%{coc#status()}

call plug#begin('~/.vim/plugged')

	Plug 'rust-lang/rust.vim'
	Plug 'preservim/nerdtree'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'wadackel/vim-dogrun'
	Plug 'preservim/nerdcommenter'
	" Need to install Hack Nerd Font or icons won't show
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme dogrun
