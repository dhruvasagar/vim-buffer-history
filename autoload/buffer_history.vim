let s:jumping = 0

function! buffer_history#add(bufnr) abort "{{{1
  if s:jumping | return | endif

  if !exists('w:buffer_history')
    let w:buffer_history = []
    let w:buffer_history_index = -1
  endif

  let index = w:buffer_history_index + 1
  if bufexists(a:bufnr)
    let bindex = index(w:buffer_history, a:bufnr)
    if bindex >= 0
      let index -= 1
      call remove(w:buffer_history, bindex)
    endif
    let w:buffer_history_index = index
    call insert(w:buffer_history, a:bufnr, index)
  endif
endfunction

function! buffer_history#remove(bufnr) "{{{1
  call filter(w:buffer_history, 'v:val !=# a:bufnr')
  if w:buffer_history_index >= len(w:buffer_history)
    let w:buffer_history_index = len(w:buffer_history) - 1
  endif
endfunction

function! buffer_history#jump(...) abort "{{{1
  let dirn = a:0 ? a:1 : -1
  let index = w:buffer_history_index + (dirn * v:count1)
  if index >= 0 && index < len(w:buffer_history)
    if bufexists(w:buffer_history[index])
      let w:buffer_history_index = index
      let s:jumping = 1
      exec 'buffer' w:buffer_history[index]
      let s:jumping = 0
      return
    else
      call buffer_history#remove(w:buffer_history[index])
    endif
  endif
  echo 'Reached' (dirn > 0 ? 'end' : 'start') 'of buffer history'
endfunction

function! buffer_history#list() "{{{1
  let history = copy(w:buffer_history)
  let history = map(history, "printf('%3d %1s %-10s', v:val, v:key == w:buffer_history_index ? '*': ' ', bufname(v:val))")
  call insert(history, 'Buffer History : (* = current): ')
  echo join(history, "\n")
endfunction
