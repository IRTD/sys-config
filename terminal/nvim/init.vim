call plug#begin()

" ColorThemes
Plug 'rebelot/kanagawa.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
Plug 'hachy/eva01.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'maxmx03/fluoromachine.nvim'

" Util
Plug 'preservim/nerdtree'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/nvim-compe'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'mg979/vim-visual-multi'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'folke/which-key.nvim'
Plug 'folke/flash.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'qpkorr/vim-bufkill'
Plug 'HiPhish/rainbow-delimiters.nvim'
Plug 'mrcjkb/haskell-tools.nvim'

call plug#end()

colorscheme kanagawa

" highlight normal guibg=none

let mapleader = " "
" Use tab and s-tab for cycling through items in coc-autocompletion
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>t   <cmd>Telescope find_files<CR>

nmap <leader>c :bd <CR> 

" Scroll through documentation
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Create multiple cursors downwards
noremap <C-j> <Plug>(multicursor-visual-mode-down)
xnoremap <C-j> <Plug>(multicursor-visual-mode-down)

" Create multiple cursors upwards
noremap <C-k> <Plug>(multicursor-visual-mode-up)
xnoremap <C-k> <Plug>(multicursor-visual-mode-up)

" Prevents other buffers to overpower NERDTree
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Custom Keybinds
nmap <C-c> <Plug>CommentaryLine
nmap <silent> K :call ShowDocumentation()<CR>
nnoremap , :noh<CR>
nnoremap <silent> f :NERDTreeFocus<CR>
nnoremap <silent> q :w<CR>
cmap q qa

" Functions
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" autocmds that execute when neovim starts
autocmd VimEnter * NERDTree | wincmd p
autocmd BufWritePost * NERDTreeRefresh
autocmd ShellCmdPost * NERDTreeRefresh

"ale autocompletion plugin config
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set mouse=

packadd termdebug
let termdebugger="rust-gdb"

let g:rainbow_delimiters = {
    \ 'strategy': {
        \ '': rainbow_delimiters#strategy.global,
        \ 'vim': rainbow_delimiters#strategy.local,
    \ },
    \ 'query': {
        \ '': 'rainbow-delimiters',
        \ 'lua': 'rainbow-blocks',
    \ },
    \ 'highlight': [
        \ 'RainbowDelimiterRed',
        \ 'RainbowDelimiterYellow',
        \ 'RainbowDelimiterBlue',
        \ 'RainbowDelimiterOrange',
        \ 'RainbowDelimiterGreen',
        \ 'RainbowDelimiterViolet',
        \ 'RainbowDelimiterCyan',
    \ ],
\ }
