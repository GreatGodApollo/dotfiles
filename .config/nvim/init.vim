" Ensure vim-plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}


"" Nerdtree stuffs

Plug 'scrooloose/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'



Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder

Plug 'scrooloose/nerdcommenter'

Plug 'morhetz/gruvbox' " gruvbox theme



Plug 'vim-airline/vim-airline' " airline

Plug 'vim-airline/vim-airline-themes' " airline themes

Plug 'christoomey/vim-tmux-navigator'



call plug#end()



" Keymaps

nmap <C-n> :NERDTreeToggle<CR>

vmap ++ <plug>NerdCommenterToggle

nmap ++ <plug>NerdCommenterToggle

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

inoremap <silent> <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent> <expr> <C-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

noremap <F3> :noh<CR>



"" Goto Keymaps

nmap <silent> gd <Plug>(coc-definition)

nmap <silent> gy <Plug>(coc-type-definition)

nmap <silent> gi <Plug>(coc-implementation)

nmap <silent> gr <Plug>(coc-references)

  

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']



" Theming

autocmd vimenter * colorscheme gruvbox

set background=dark

let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1

autocmd vimenter * AirlineTheme gruvbox


" Miscellaneous settings

set hidden

set nobackup

set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

set signcolumn=yes

set smarttab

set cindent

set tabstop=2

set shiftwidth=2

set expandtab

set number

set relativenumber

" Functions

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction


function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
