"" Remaps

let mapleader = " "

" Window movement
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>u :UndotreeShow<CR>

" Show file tree
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Resize
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" vimrc quick access
nnoremap <silent> <leader>ev :vsp ~/.vimrc<CR>

" Command history
nnoremap <silent> <leader>: :History:<CR>

" Trim trailing whitespace
nnoremap <F5> :call Preserve("%s/\\s\\+$//e")<CR>

" Prefill substitute
nnoremap <leader>s :%s/

" Easy save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q<CR>
nnoremap <leader>x :x<CR>

" Close all buffers except the current one
nnoremap <leader>bda :<c-u>up <bar> %bd <bar> e#<cr>

" Source .vimrc quickly
nnoremap <silent> <leader>% :source ~/.vimrc<CR>
