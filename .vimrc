set nocompatible
filetype off

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'preservim/nerdtree'
call plug#end()

let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview
set number
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set softtabstop=2
set smarttab
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 -Wall -Wshadow -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -DLOCAL % -o %:p:r && ~/scripts/run_samples.sh %:t:r <CR>
autocmd filetype cpp nnoremap <F8> :w <bar> !g++ -std=c++17 -O2 -Wall -Wshadow -g % -o %:p:r && ~/scripts/run_samples.sh %:t:r <CR>
" autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall -Wshadow -Wno-unused-result % -o %:p:r && echo "Input:" && %:p:r <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !echo "Input:" && %:p:r <CR>
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
