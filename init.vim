call plug#begin("~/.vim/plugged")
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Plug 'kyazdani42/nvim-tree.lua'
"Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sainnhe/sonokai'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Basic 
set number
set cursorline
set history=1000
set clipboard=unnamed

set autoindent
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set noshowmode
set autoread

filetype indent on

" COC SETTINGS =======================================
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
"=======================================================

"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2                                                   
"autocmd FileType html setlocal shiftwidth=2 tabstop=2
"autocmd FileType css setlocal shiftwidth=2 tabstop=2
"autocmd FileType json setlocal shiftwidth=2 tabstop=2
"autocmd FileType c setlocal shiftwidth=4 tabstop=4

syntax sync minlines=200

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None
" 


"///////////////////////////
" NERDTree plugin 
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Close the tab if NERDTree is the only window remaining in it.
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endi

" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
"///////////////////////////



"/////////////////////////////
" Integrated Terminal 
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
    split term://zsh
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" 


" treesitter 
" Highlight 
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash", "c", "cmake", "comment", "cpp", "css", "dockerfile", "html",
        "http", "java", "javascript", "json", "lua", "make", "python", 
        "typescript", "vim", "yaml"
    }, 
    highlight = {
        enable = true,
        },
    indent = {
        enable = false
        },
    }
EOF
" 
" 


" Sonokai theme 
if has('termguicolors')
    set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda' " 'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, `'espresso'
let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1
colorscheme sonokai
" 


" lightline
let g:lightline = {
            \ 'colorscheme': 'sonokai',
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
            \ 'active' : {
                \   'left' : [ [ 'mode', 'paste' ],
                \              [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
                \   'right': [ [ 'virtualenv', 'lineinfo' ],
                \              [ 'percent' ],
                \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component_function' : {
                \   'gitbranch' : 'gitbranch#name',
                \   'filetype': 'MyFiletype',
                \   'fileformat': 'MyFileformat',
                \ },
            \ }
"


" Colorizer
lua require'colorizer'.setup()
"

" COC
let g:coc_global_extensions = ['coc-json',
            \ 'coc-git',
            \ 'coc-cssmodules',
            \ 'coc-css',
            \ 'coc-eslint',
            \ 'coc-html',
            \ 'coc-tsserver',
            \ 'coc-tslint',
            \ 'coc-pyright',
            \ 'coc-stylelint',
            \ 'coc-yaml',
            \ 'coc-svg',
            \ 'coc-prettier',
            \ 'coc-swagger']
" \ 'coc-clangd',
" \ 'coc-python',


"/////////////////////
" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"////////////////////


" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
