" Custom filetype detection for .env / .settings files
" Only sets filetype to 'docker-compose-env' if docker-compose.yml exists in the same directory

autocmd BufRead,BufNewFile .env,.settings call s:SetConfFiletype()

function! s:SetConfFiletype()
  " Get the directory of the current file
  let l:current_dir = expand('%:p:h')

  " Check if docker-compose.yml exists in the same directory
  if filereadable(l:current_dir . '/docker-compose.yml')
    setlocal filetype=docker-compose-env
  endif
endfunction

