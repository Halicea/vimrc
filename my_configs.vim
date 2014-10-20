"start autocompletion on startup
let g:neocomplcache_enable_at_startup = 1

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType javascript call JavaScriptFold()
" tabs setup
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nofullscreen

"clear search highlights
nnoremap <F3> :set hlsearch!<CR>

"toggle line numbers
nnoremap <F4> :set nu!<CR>

"Git shortcuts
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gh :Gdiff ~
nnoremap <Leader>gp :Gpush origin 
nnoremap <Leader>gl :Gpull origin 

"add new lines above and bellow without exiting normal mode 
nmap <S-Enter> O<Esc>
nmap <C-Enter> o<Esc>

"easier escape from insert mode 
imap jk <Esc>
imap kj <Esc>

"Go stuff
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap gd <Plug>(go-def)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

let g:go_play_open_browser = 0
let g:go_fmt_command = "goimports"

"start nerdtree on start
"au VimEnter * NERDTree

"Unfold everything
"au BufRead * normal zR
"By default vim-go shows errors for the fmt command, to disable it:
let g:go_fmt_fail_silently = 1

"Change the build path
"let g:go_bin_path = expand("~/.gotools")
"let g:go_bin_path = "/home/fatih/.mypath"      "or give absolute path

"Disable auto save
"let g:go_fmt_autosave = 0

let g:pymode_lint_ignore="E111,E302,E501,W601"

colorscheme peaksea
