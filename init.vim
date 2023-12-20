lua require('plugins')

function! OpenBufferInFloatWindow()
    " Save the current 'updatetime' option
    let saved_updatetime = &updatetime

    " Set 'updatetime' to a high value to suppress error messages
    set updatetime=10000"
    
    " Get the current buffer and window
    let current_buf = bufnr("")
    let current_win = winnr()

    " Calculate the screen dimensions
    let s:screen_width = &columns
    let s:screen_height = &lines

    " Calculate the floating window position
    let float_width = float2nr(s:screen_width * 0.7)
    let float_height = float2nr(s:screen_height * 0.9)
    let float_row = (s:screen_height - float_height) / 2
    let float_col = (s:screen_width - float_width) / 2

    try
	" Create a new floating window and set its properties
	let float_opts = { 'relative': 'editor', 'width': float_width, 'height': float_height, 'row': float_row, 'col': float_col, 'border': 'single'}

        " Open the floating window and set its buffer to the current buffer
        let float_win = nvim_open_win(current_buf, 1, float_opts)

        " Set the floating window as the current window
        exec 'wincmd w' float_win

        " Return focus to the original window
        exec 'wincmd w' current_win
    finally
        " Restore the original 'updatetime' value
        execute 'set updatetime=' . saved_updatetime
    endtry
endfunction

let g:mapleader=" "

nnoremap <leader>of :call OpenBufferInFloatWindow()<CR>

nnoremap <Leader>bd :set background=dark<CR>
nnoremap <Leader>bl :set background=light<CR>
nnoremap <Leader>co :colorscheme 

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>t :terminal<CR>
nnoremap <Leader>r :execute 'cd ' . expand('%:p:h')<CR>
nnoremap <Leader>fp :let @+ = expand('%:p:h')<CR>
nnoremap <Leader>:e :execute 'cd ' . 'E:\'<CR>
nnoremap <Leader>:c :execute 'cd ' . 'C:\'<CR>

nnoremap <Leader>nf :Neotree float toggle<CR>
nnoremap <Leader>nb :Neotree float buffers<CR>
nnoremap <Leader>nr :Neotree reveal<CR>
nnoremap <Leader>so :source%<CR>
nnoremap <Leader>/ :let @/ = ""<CR>
nnoremap <Leader>ss :Neotree close<CR>:mksession! C:\Users\isuo1\AppData\Local\nvim-data\sessions\
nnoremap <Leader>ls :source C:\Users\isuo1\AppData\Local\nvim-data\sessions\

nnoremap D "mddp 
nnoremap U "mddkP 
noremap J 10j
noremap K 10k
noremap H 10h
noremap L 10l

nnoremap <Leader>1 :wincmd 1w<CR>
nnoremap <Leader>2 :wincmd 2w<CR>
nnoremap <Leader>3 :wincmd 3w<CR>
nnoremap <Leader>4 :wincmd 4w<CR>
nnoremap <Leader>5 :wincmd 5w<CR>
nnoremap <Leader>6 :wincmd 6w<CR>
nnoremap <Leader>7 :wincmd 7w<CR>
nnoremap <Leader>8 :wincmd 8w<CR>
nnoremap <Leader>9 :wincmd 9w<CR>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
tnoremap <Esc> <C-\><C-n>

nnoremap <Leader>vs :vsplit
nnoremap <Leader>hs :split
nnoremap <Leader>vr :vert res =10*
nnoremap <Leader>hr :res =10*
nnoremap <Leader>zw :set wrap<CR>
nnoremap <Leader>zn :set nowrap<CR>
nnoremap <Leader>sc :set signcolumn

nnoremap <Leader>ff :Telescope find_files<CR>
nnoremap <Leader>fg :Telescope live_grep<CR>
nnoremap <Leader>fb :Telescope buffers<CR>

nnoremap <Leader>y :"+y
nnoremap <Leader>pp :"+p
nnoremap <Leader>pP :"+P

nnoremap <Leader>ps :PackerSync<CR>
nnoremap <Leader>pc :PackerClean<CR>
nnoremap <Leader>pi :PackerInstall<CR>
nnoremap <Leader>pu :PackerUpdate<CR>
nnoremap <Leader>pl :PackerLoad<CR>
nnoremap <Leader>pt :PackerStatus<CR>

colorscheme paramount

:set list
" :set listchars=eol:↵,trail:~,tab:>-,nbsp:.,space:.
" :set listchars=eol:␍,trail:~,tab:>-,nbsp:.,space:.
:set ignorecase 
:set number
" :set foldmethod=indent
:set shiftwidth=2
:set foldmethod=indent
" :set foldexpr=nvim_treesitter#foldexpr()
:set nofoldenable                     " Disable folding at startup.
:set encoding=utf-8
:set guifont=JetBrainsMono\ NFM:h10
:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

