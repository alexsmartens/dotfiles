" Vimrc
"
" This file contains the minimal settings to set the foundation, with the
" majority of the configuration and settings living in files spread between
" vim/rcfiles and vim/rcplugins

" Enable syntax highlighting
syntax enable

" Need to set the leader before defining any leader mappings
noremap <Space> <Nop>
let mapleader = "\<Space>"

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

" Specify a directory for plugins
call plug#begin('~/.vim/bundle')
call s:SourceConfigFilesIn('rcplugins')
" Initialize plugin system
call plug#end()

call s:SourceConfigFilesIn('rcfiles')

" Reload .vimrc and :PlugInstall to install plugins

