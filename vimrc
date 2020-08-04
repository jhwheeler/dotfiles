syntax on

filetype plugin indent on

set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set noswapfile
set encoding=utf8
set synmaxcol=120
set number
set relativenumber
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set history=3000
set undolevels=1000
set hlsearch
set splitbelow
set splitright
set undofile
set incsearch
set colorcolumn=0
set noshowmode
set synmaxcol=0
set diffopt+=vertical
set mouse=a
set wildmode=longest,list,full

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

highlight clear SignColumn

let mapleader = " "

"" File tree (netrw)
let g:netrw_browse_split=4
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_list_hide=netrw_gitignore#Hide()
" Hide hidden files
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"" Plugins

" Download Vim Plug if not already downloaded
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'evanleck/vim-svelte'
Plug 'leafgarland/typescript-vim'
Plug 'alx741/vim-rustfmt'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
Plug 'easymotion/vim-easymotion'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jhwheeler/fluidlan-vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mattn/emmet-vim'

call plug#end()


"" Colors
" local version for testing (located in ~/.vim/colors)
" colorscheme fluidlan-vim
" version from the plugin hosted on Github
colorscheme fluidlan

set termguicolors
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" Wrap commands in Preserve to keep window position
function! Preserve(command)
  " Preparation: save window state
  let l:saved_winview = winsaveview()
  " Run the command:
  execute a:command
  " Clean up: restore previous window position
  call winrestview(l:saved_winview)
endfunction


"" Remaps

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


"" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

"Jump to anywhere you want with minimal keystrokes, with just one key
"binding.
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

if executable('rg')
  let g:rg_derive_root='true'
endif


"" Fugitive
nnoremap <leader>gs :vertical Gstatus <bar> :vertical resize 50<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>


"" Emmet
map ,, <C-y>,
imap ,, <C-y>,


"" CoC

" Extensions
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-svelte',
  \ 'coc-vimlsp',
  \ 'coc-rust-analyzer',
  \ 'coc-go',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \  ]

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()"

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Python path
let g:python3_host_prog = $GLOBALINSTALLDIR . "/usr/bin/python3"

" Go imports
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1


"" FZF
nnoremap <leader>; :FZF <CR>

function! FloatingFZF()
  let width = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.8)
  let opts = { 'relative': 'editor',
             \ 'row': (&lines - height) / 2,
             \ 'col': (&columns - width) / 2,
             \ 'width': width,
             \ 'height': height }

  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Search in files
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --glob "!.git/*" --glob "!node_modules/*" --glob "!*/node_modules/*" --glob "!.jest/*" --glob "!.expo/*" --glob "!__sapper__/*" --glob "!*/__sapper__/*" --glob "!*/bundle/*" --glob "!public/bundle/build.js" '.shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <leader>f :Find<CR>

" Allows you to put selected items in the quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

function! QuickFixOpenAll()
  if empty(getqflist())
    return
  endif
  let s:prev_val = ""
  for d in getqflist()
    let s:curr_val = bufname(d.bufnr)
    if (s:curr_val != s:prev_val)
      exec "edit " . s:curr_val
    endif
    let s:prev_val = s:curr_val
  endfor
endfunction

nnoremap <leader>oqf<CR> :call QuickFixOpenAll()<CR>


"" AsyncRun
let g:asyncrun_open = 8
nnoremap <leader>r :AsyncRun


"" Airline
let g:bufferline_echo = 0
autocmd VimEnter *
      \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()
let g:airline_theme='violet'


"" Session
set sessionoptions-=buffers
set sessionoptions-=help
let g:session_autosave='yes'
let g:session_default_to_last='no'
let g:session_command_aliases = 1


"" rustfmt
let g:rustfmt_on_save = 1
let g:rustfmt_backup = 0


"" Goyo
let g:goyo_height='100%'
let g:goyo_width=85