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
nmap <CR> o<Esc>

"easier escape from inser mode 
imap <S-Enter> <Esc>


