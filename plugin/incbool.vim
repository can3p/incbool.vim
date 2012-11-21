if exists("loaded_incbool")
    finish
endif
let loaded_incbool = 1

function! SwapBooleans(char)
  let line = getline('.')
  let l = line('.')
  let c = col('.') - 1

  let word_start = match(line[:c], '\w\+$')
  let word_end = match(line, '\W', word_start)
  if word_end == -1
    let word = line[word_start :]
  else
    let word = line[word_start : word_end-1]
  endif

  let convert = ''
  if word == 'false'
    let convert = 'true'
  elseif word == 'true'
    let convert = 'false'
  endif

  "test cases
  "true k
  ":false
  "(true)
  "true
  "True
  "False
  "TRUE
  "FALSE

  if strlen(convert) > 0
    if word ==# 'FALSE' || word ==# 'TRUE'
      let convert = toupper(convert)
    elseif word ==# 'False' || word ==# 'True'
      let convert = toupper(convert[0]) . convert[1:]
    endif

    if word_end == -1
      let newline = (word_start>0 ? line[:word_start-1] : '') . convert
    else
      let newline = (word_start>0 ? line[:word_start-1] : '') . convert . line[word_end :]
    endif

    call setline(l, newline)
  else
    execute 'normal! ' . v:count1 . a:char
  endif
endfunction

nnoremap <silent> <C-a> :<C-u>call SwapBooleans("\<C-a>")<CR>
nnoremap <silent> <C-x> :<C-u>call SwapBooleans("\<C-x>")<CR>

