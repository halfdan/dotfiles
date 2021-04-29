"
" Commands
"

" use fd --type f to only show files not ignored by VCS
command! ProjectFiles call fzf#run(fzf#wrap({'source': 'fd --type f'}))



"
" AutoCMDs
"
" automatically go into insert mode when entering terminal
:au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" force lightline update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" tsx/jsx filetypes
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
" autocmd BufNewFile,BufRead *.rs  set colorcolumn=80,100


" disable scrolloff in the terminal
autocmd TermOpen,TermEnter * setlocal scrolloff=0
autocmd TermLeave * setlocal scrolloff=8
" autocmd TermOpen * setlocal scrolloff=0
