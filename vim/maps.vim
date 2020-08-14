"" Remaps

let mapleader = " "

" Resize
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Vim config
nnoremap <silent> <leader>ve :e ~/.vimrc<CR>
nnoremap <silent> <leader>vv :vsp ~/.vimrc<CR>
nnoremap <silent> <leader>vs :source ~/.vimrc<CR>
nnoremap <silent> <leader>vp :vsp ~/.vim/plugins.vim<CR>
nnoremap <silent> <leader>vm :vsp ~/.vim/maps.vim<CR>

" Trim trailing whitespace
nnoremap <F5> :call Preserve("%s/\\s\\+$//e")<CR>

" Prefill substitute
nnoremap <leader>ts :%s/

" Easy save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q<CR>
nnoremap <leader>x :x<CR>

" Close all buffers except the current one
nnoremap <leader>bda :<c-u>up <bar> %bd <bar> e#<cr>
