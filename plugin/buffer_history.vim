if exists('g:loaded_buffer_history')
  finish
endif
let g:loaded_buffer_history = 1

augroup BufferHistory
  au!

  autocmd BufWinEnter * call buffer_history#add(winbufnr(0))
  autocmd BufWipeout * call buffer_history#remove(bufnr('<afile>'))
augroup END

command! BufferHistoryList call buffer_history#list()
command! -count=1 BufferHistoryBack call buffer_history#jump()
command! -count=1 BufferHistoryForward call buffer_history#jump(1)

nnoremap <silent> <Plug>(buffer-history-list) :BufferHistoryList<CR>
nnoremap <silent> <Plug>(buffer-history-back) :BufferHistoryBack<CR>
nnoremap <silent> <Plug>(buffer-history-forward) :BufferHistoryForward<CR>

if !hasmapto('<Plug>(buffer-history-list)')
  nmap gbl <Plug>(buffer-history-list)
endif
if !hasmapto('<Plug>(buffer-history-back)')
  nmap gbp <Plug>(buffer-history-back)
endif
if !hasmapto('<Plug>(buffer-history-forward)')
  nmap gbn <Plug>(buffer-history-forward)
endif
