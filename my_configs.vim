autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType javascript call JavaScriptFold()
" tabs setup
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nofullscreen

"clear search highlights
nnoremap <F3> :set hlsearch!<CR>

"clear line numbers
nnoremap <F4> :set nu<CR>
nnoremap <F5> :set nu!<CR>

"Spec runner 
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"add new lines above and bellow without exiting normal mode 
nmap <S-Enter> O<Esc>
"nmap <CR> o<Esc>

"easier escape from inser mode 
imap <S-Enter> <Esc>

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

"By default vim-go shows errors for the fmt command, to disable it:
"let g:go_fmt_fail_silently = 1

"Change the build path
"let g:go_bin_path = expand("~/.gotools")
"let g:go_bin_path = "/home/fatih/.mypath"      "or give absolute path

"Disable auto save
"let g:go_fmt_autosave = 0

