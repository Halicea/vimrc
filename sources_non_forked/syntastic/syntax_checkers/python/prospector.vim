"============================================================================
"File:        prospector.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  LCD 47 <lcd047 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_python_prospector_checker")
    finish
endif
let g:loaded_syntastic_python_prospector_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_python_prospector_IsAvailable() dict
    if !executable(self.getExec())
        return 0
    endif

    let ver = syntastic#util#getVersion(self.getExecEscaped() . ' --version')
    call self.log(self.getExec() . ' version =', ver)

    return syntastic#util#versionIsAtLeast(ver, [0, 7])
endfunction

function! SyntaxCheckers_python_prospector_GetLocList() dict
    let makeprg = self.makeprgBuild({
        \ 'args': '--external-config merge',
        \ 'args_after': '--messages-only --absolute-paths --die-on-tool-error --zero-exit --output-format json' })

    let errorformat = '%f:%l:%c: %m'

    let env = syntastic#util#isRunningWindows() ? {} : { 'TERM': 'dumb' }

    let loclist = SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'env': env,
        \ 'preprocess': 'prospector',
        \ 'returns': [0] })

    for e in loclist
        if e['text'] =~# '\v\[%(dodgy|mccabe|pep8|pep257|pyroma)\]$'
            let e['subtype'] = 'Style'
        endif

        if e['text'] =~# '\v\[pylint\]$'
            let e['type'] = e['text'] =~? '\m^[CRW]' ? 'W' : 'E'
        elseif e['text'] =~# '\v\[%(frosted|pep8)\]$'
            let e['type'] = e['text'] =~? '\m^W' ? 'W' : 'E'
        elseif e['text'] =~# '\v\[%(dodgy|pyroma|vulture)\]$'
            let e['type'] = 'W'
        else
            let e['type'] = 'E'
        endif
    endfor

    call self.setWantSort(1)

    return loclist
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'python',
    \ 'name': 'prospector'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
