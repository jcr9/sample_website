
filetype on
filetype plugin on
filetype indent on

set formatprg=par
set tabstop=2
set breakindent
set nocompatible
set number
set wrap
set linebreak
set nolist 
set tw=0
autocmd bufnewfile *.html r ~/vim/template/skeleton.html

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

packadd minpac
call minpac#init()

call minpac#add('tpope/vim-surround')
call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-repeat')
call minpac#add('godlygeek/tabular')
call minpac#add('vim-scripts/Gundo')
call minpac#add('nelstrom/vim-visual-star-search')
call minpac#add('tommcdo/vim-exchange')
call minpac#add('altercation/vim-colors-solarized')

let g:solarized_contrast="low"

syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized


command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' noexpandtab'
    else
      echon ' expandtab'
    endif
  finally
    echohl None
  endtry
endfunction
