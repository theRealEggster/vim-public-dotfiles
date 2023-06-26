" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    175


let s:prototype = {'in_mode': 'nl', 'out_mode': 'nl', 'err_mode': 'nl'}


function! s:Out_cb(ch, msg) abort dict "{{{3
    Tlibtrace 'checksyntax', a:msg
    call checksyntax#Debug('vim8 output: '. a:msg, 2)
    call add(self.lines, a:msg)
endf


function! s:Err_cb(ch, msg) abort dict "{{{3
    Tlibtrace 'checksyntax', a:msg
    echohl ErrorMsg
    echom 'CheckSyntax' self.name .':' a:msg
    echohl NONE
endf


function! s:Exit_cb(job, status) abort dict "{{{3
    Tlibtrace 'checksyntax', a:job, a:status, self.job_id
    call checksyntax#Debug('vim8 exit: '. self.job_id)
    let errorformat = &errorformat
    try
        Tlibtrace 'checksyntax', self.async_type, self.bufnr, bufnr('%')
        if self.async_type !=# 'loc' || self.bufnr == bufnr('%')
            let &errorformat = self.async_efm
            Tlibtrace 'checksyntax', &errorformat
            call checksyntax#Debug('vim8 &errorformat='. &errorformat, 2)
            try
                exec 'noautocmd silent' self.async_getexpr self.WrapGetExpr('self.lines')
            catch /^Vim\%((\a\+)\)\=:E523/
                echom 'CheckSyntax: A strange E523 error occurred. Please try again!'
            endtry
        endif
        call self.issues.AsyncDone(self)
    finally
        let &errorformat = errorformat
    endtry
endf


function! checksyntax#async#vim8#New(ext) abort "{{{3
    let o = extend(deepcopy(s:prototype), a:ext)
    return o
endf

function! checksyntax#async#vim8#Run(cmd, make_def) abort "{{{3
    Tlibtrace 'checksyntax', a:cmd
    Tlibtrace 'checksyntax', a:make_def
    Tlibtrace 'checksyntax', getcwd()
    let make_def = a:make_def
    let make_def.lines = []
    let type = get(a:make_def, 'listtype', 'loc')
    let make_def.async_getexpr = checksyntax#GetMakerParam(a:make_def, 'vim8', 'getexpr', type ==# 'loc' ? 'lgetexpr' : 'cgetexpr')
    let make_def.async_type = type
    let make_def.async_efm = checksyntax#GetMakerParam(a:make_def, 'vim8', 'efm', &errorformat)
    let opts = checksyntax#async#vim8#New({})
    let ecb = checksyntax#GetMakerParam(a:make_def, 'vim8', 'use_err_cb', 0)
    if ecb
        let opts.out_cb = function('s:Out_cb', [], make_def)
        let opts.err_cb = function('s:Err_cb', [], make_def)
    else
        let opts.callback = function('s:Out_cb', [], make_def)
    endif
    let opts.exit_cb = function('s:Exit_cb', [], make_def)
    call checksyntax#Debug('vim8 job: '. a:cmd)
    let job = job_start(a:cmd, opts)
    Tlibtrace 'checksyntax', job
    let input = checksyntax#GetMakerParam(a:make_def, 'vim8', 'input', [])
    if !empty(input)
        Tlibtrace 'checksyntax', input
        let ch = job_getchannel(job)
        for line in input
            sleep 200m
            Tlibtrace 'checksyntax', line
            if type(line) == 1
                let text = line
            elseif type(line) == 4
                if has_key(line, 'var')
                    let text = a:make_def[line.var]
                else
                    throw 'Checksyntax/vim8: Unsupported input dict: '. string(line)
                endif
            else
                throw 'Checksyntax/vim8: Unsupported input value: '. string(line)
            endif
            call checksyntax#Debug('vim8 input: '. text, 2)
            call ch_sendraw(ch, text ."\n")
        endfor
    endif
    Tlibtrace 'checksyntax', job_status(job)
    return 1
endf

