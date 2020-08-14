"" Plugins

" Download Vim Plug if not already downloaded
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'                                            " basic defaults
Plug 'tpope/vim-unimpaired'                                          " variety of useful bracket maps
Plug 'tpope/vim-commentary'                                          " (un)comment code blocks
Plug 'tpope/vim-surround'                                            " edit surrounding tags easily
Plug 'wellle/targets.vim'                                            " target more text objects
Plug 'tpope/vim-repeat'                                              " repeat commands, not just motions
Plug 'tpope/vim-eunuch'                                              " sugar for UNIX shell commands
Plug 'tpope/vim-vinegar'                                             " extend netrw file tree
Plug 'easymotion/vim-easymotion'                                     " move around the buffer even faster
Plug 'mbbill/undotree'                                               " visualize undo history
Plug 'yuttie/comfortable-motion.vim'                                 " smooth scrolling
Plug 'AndrewRadev/splitjoin.vim'                                     " split/join single/multiline blocks/functions
Plug 'junegunn/goyo.vim'                                             " distraction-free editing (for prose/documentation)
Plug 'skywind3000/asyncrun.vim'                                      " run shell commands asynchronously
Plug 'neoclide/coc.nvim', {'branch': 'release'}                      " autocomplete/intellisense
Plug 'j5shi/CommandlineComplete.vim'                                 " autocomplete for command mode
Plug 'godlygeek/tabular'                                             " autocomplete for command mode
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } " key-binding guide
Plug 'jhwheeler/fluidlan-vim'                                        " custom color scheme

" Status line
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Session management
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Integrated Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Language plugins
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'evanleck/vim-svelte'
Plug 'leafgarland/typescript-vim'
Plug 'alx741/vim-rustfmt'
Plug 'mattn/emmet-vim'

call plug#end()


"" Plugin Settings

"" Netrw
let g:netrw_browse_split=4
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_list_hide=netrw_gitignore#Hide()
" Hide hidden files
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


"" EasyMotion
map <leader><leader>f <Plug>(easymotion-overwin-f)
map <leader><leader>j <Plug>(easymotion-overwin-line)
map <leader><leader>k <Plug>(easymotion-overwin-line)
map <leader><leader>w <Plug>(easymotion-overwin-w)

"Jump to anywhere you want with minimal keystrokes, with just one key
"binding.
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

if executable('rg')
  let g:rg_derive_root='true'
endif

"" Undotree
nnoremap <silent> <leader>u :UndotreeShow<CR>


"" Fugitive
set diffopt+=vertical " vertical diffs
nnoremap <leader>gs :vertical Gstatus <bar> :vertical resize 50<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gpl :Gpull<CR>
nmap <leader>gps :Gpush<CR>
nmap <leader>ga% :G add %<CR>
nmap <leader>gaa :G add .<CR>
nmap <leader>gt :G stash<CR>
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
  \ 'coc-explorer',
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

" Restart CoC to refresh new settings/extensions
nnoremap <leader>cr :CocRestart

" Show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Python path
let g:python3_host_prog = $GLOBALINSTALLDIR . "/usr/bin/python3"

" Go imports
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" Explorer
nmap <leader>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif"


"" FZF

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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

" Search filenames
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

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
command! -bang -nargs=* FindInFiles
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always --glob "!.git/*" --glob "!node_modules/*" --glob "!*/node_modules/*" --glob "!.jest/*" --glob "!.expo/*" --glob "!__sapper__/*" --glob "!*/__sapper__/*" --glob "!*/bundle/*" --glob "!public/bundle/build.js" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)

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

" Maps (s is for search)
nnoremap <leader>s/ :History/<CR>
nnoremap <leader>s: :History:<CR>
nnoremap <leader>s; :Commands<CR>
nnoremap <leader>sa :Ag<CR>
nnoremap <leader>sb :BLines<CR>
nnoremap <leader>sB :Buffers<CR>
nnoremap <leader>sc :Commits<CR>
nnoremap <leader>sC :BCommits<CR>
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sg :GFiles?<CR>
nnoremap <leader>sh :Helptags<CR>
nnoremap <leader>sH :History<CR>
nnoremap <leader>si :FindInFiles<CR>
nnoremap <leader>sl :Lines<CR>
nnoremap <leader>sm :Marks<CR>
nnoremap <leader>sM :Maps<CR>
nnoremap <leader>ss :Snippets<CR>
nnoremap <leader>sS :Colors<CR>
nnoremap <leader>st :Tags<CR>
nnoremap <leader>st :BTags<CR>
nnoremap <leader>sy :Filetypes<CR>



"" AsyncRun
let g:asyncrun_open = 8
nnoremap <leader>r :AsyncRun
" Allow vim fugitive commands to be wrapped w/ AsyncRun
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

"" Airline
let g:bufferline_echo = 0
autocmd VimEnter *
      \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()
let g:airline_theme='violet'
" For GitGutter integration
let g:airline#extensions#hunks#non_zero_only = 1


"" WhichKey

" Show on leader
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Only wait half a second before showing window
set timeoutlen=500

" Show keys in small floating window
let g:which_key_use_floating_win = 1

" Register Which Key map
" call which_key#register('<Space>', "g:which_key_map")
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

" Define prefix dictionary
let g:which_key_map =  {}
" Define a separator
" let g:which_key_sep = '→'

" Single Mappings
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['r'] = [ ':AsyncRun'                  , 'async run' ]

" b is for buffer
let g:which_key_map.b = {
      \ 'name': '+buffer',
      \ 'd':   [':bd'                      , 'delete buffer'],
      \ 'da':  'close all buffers except the current one',
      \ }

" v is for vim
let g:which_key_map.v = {
      \ 'name': '+vim',
      \ 'e': [':e ~/.vimrc'              , 'edit vimrc'],
      \ 'v': [':vsp ~/.vimrc'            , 'edit vimrc (vertical split)'],
      \ 's': [':source ~/.vimrc'         , 'source vimrc'],
      \ 'p': [':vsp ~/.vim/plugins.vim'  , 'edit plugins config'],
      \ 'm': [':vsp ~/.vim/maps.vim'     , 'edit mapping config'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name': '+git',
      \ 's':   [':Gstatus'                 , 'git status'],
      \ 'c':   [':Gcommit'                 , 'git commit'],
      \ 't':   [':G stash'                 , 'git stash'],
      \ 'pl':  [':Gpull'                   , 'git pull'],
      \ 'ps':  [':Gpush'                   , 'git push'],
      \ 'a%':  [':G add %'                 , 'git add %'],
      \ 'a.':  [':G add .'                 , 'git add .'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name': '+search',
      \ '/': [':History/'     , 'history'],
      \ ':': [':History:'     , 'command history'],
      \ ';': [':Commands'     , 'commands'],
      \ 'b': [':BLines'       , 'current buffer'],
      \ 'B': [':Buffers'      , 'open buffers'],
      \ 'c': [':Commits'      , 'commits'],
      \ 'C': [':BCommits'     , 'buffer commits'],
      \ 'f': [':Files'        , 'files'],
      \ 'g': [':GFiles?'      , 'modified git files'],
      \ 'h': [':Helptags'     , 'help tags'] ,
      \ 'H': [':History'      , 'file history'],
      \ 'i': [':FindInFiles'  , 'find in files'],
      \ 'l': [':Lines'        , 'lines'] ,
      \ 'm': [':Marks'        , 'marks'] ,
      \ 'M': [':Maps'         , 'normal maps'] ,
      \ 's': [':Snippets'     , 'snippets'],
      \ 'S': [':Colors'       , 'color schemes'],
      \ 't': [':Tags'         , 'project tags'],
      \ 'T': [':BTags'        , 'buffer tags'],
      \ 'y': [':Filetypes'    , 'file types'],
      \ }

" t is for tools
let g:which_key_map.t = {
      \ 'name': '+tools',
      \ 's': [':%s/'          , 'prefill substitute'],
      \ }


"" Session
set sessionoptions-=buffers
set sessionoptions-=help
let g:session_autosave='yes'
let g:session_autoload='no'
let g:session_default_to_last='no'
let g:session_command_aliases = 1


"" rustfmt
let g:rustfmt_on_save = 1
let g:rustfmt_backup = 0


"" Goyo
let g:goyo_height='100%'
let g:goyo_width=85


"" GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
