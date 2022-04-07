call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sharkdp/bat'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-test/vim-test'
call plug#end()

try
	source ~/.vim/plugconf/coc-conf.vim
catch
	echo "unable to load coc-conf file"
endtry

" Line numbers
set number
highlight LineNr ctermfg=grey
set signcolumn=yes
set wildmenu
filetype plugin indent on
set autowrite

" Theme
set background=dark
colorscheme PaperColor

" Switch between buffers
" nnoremap <C-j> :bprev<CR>
" nnoremap <C-k> :bnext<CR>

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

"Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
" autocmd FileType go nmap <leader>b :<C-b>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

nnoremap <C-n> :NERDTreeToggle<CR> "  Toggle side window with `CTRL+f`.

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" let NERDTreeShowHidden=1 " Show hidden file

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" Lightline settings
set laststatus=2

" Fzf Settings
" search for files
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
let $FZF_DEFAULT_COMMAND='find . \( -name vendor -o -name .git -o -name node_modules \) -prune -o -print'
nnoremap <C-h> :Ag<CR>
" <C-t> to open in a new tab
" <C-v> to open in vertical split
" <C-x> to open in horizontal split>
"
" Preview window colors
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'""

" Coc Settings
let g:coc_global_extensions = [
	\ 'coc-pairs',
	\ 'coc-go',
	\ 'coc-json',
	\ 'coc-yaml',
	\ 'coc-prettier',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ ]



" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>