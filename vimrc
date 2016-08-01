
source ~/.vim/vimrc-plugins
source ~/.vim/vimrc-mappings

set enc=utf-8
set scroll=5
set scrolloff=7

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" nvim specific config
if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

set laststatus=1
set t_Co=256

let g:agprg="ag --column --smart-case -U"

scriptencoding utf-8

set nocompatible
set incsearch
set hidden

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set laststatus=2

" don't use swapfiles. Use git instead
set nobackup
set nowritebackup
set noswapfile
set hlsearch

" allways use OSX's clipboard
set clipboard=unnamed

" Sets how many lines of history VIM has to remember
set history=700
set nofoldenable

" show linenumbers
set number
set cursorline

" highlight tabs and trailing spaces
"set list listchars=tab:››,eol:¬,trail:·

" Set to auto read when a file is changed from the outside
set autoread

augroup file_type
    autocmd!
    " When vimrc is edited, reload it
    autocmd bufwritepost nested vimrc source ~/.vim/vimrc
    " Remove all trailing whitespace before a file is written
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd BufNewFile,BufRead *.jeco set ft=html
    autocmd BufNewFile,BufRead *.coffee set ft=coffee
    autocmd BufNewFile,BufRead *.less set ft=css
    autocmd BufNewFile,BufRead *.boot set ft=clojure
    autocmd BufNewFile,BufRead *.edn set ft=clojure
augroup end

function! s:setGuiOptions()
        syntax on
        set guioptions=-t " don't show the menu
        set guioptions=+R " show scrollbar
        set hlsearch
        set ch=2          " Make command line two lines high
        set mousehide     " Hide the mouse when typing text
        set guifont=Fira\ Code:h13
        set background=dark
        let g:solarized_visibility = "low"
        let g:solarized_contrast = "normal"
        let g:solarized_termcolors = 16
        let g:solarized_termtrans = 1
        " my favourites:
        " candycode, darkburn, dante, redblack,
        " ir_black, jellybeans, cthulhian,
        " darkdesert, darkocean, solarized
        colorscheme solarized
endfunction

call s:setGuiOptions()

" Strip trailing whitespace
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! g:ToggleParedit()
    if g:paredit_mode
        let g:paredit_mode = 0
        echom "ParEdit mode off"
    else
        let g:paredit_mode = 1
        echom "ParEdit mode on"
    endif
endfunction
