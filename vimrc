"====================="
" LucidVim v0.2-alpha "
"====================="

"" Displays cursorline and cursorcolumn
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn 
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

"" Vim Options in mostly alphabetical order
filetype plugin indent on "changes indentation based on filetype
set autoindent "if prev line indented, newline will indent
set autoread "autoreads file when externally changed
set backspace=indent,eol,start "backspace works like expected
set background=dark
set browsedir=$HOME/ "sets filebrowser to open on home
set cmdheight=1 "command height
set cmdwinheight=1 "command window height
set colorcolumn=79,80 "marks column 79 and 80
set directory=$HOME/.vim/tmp/
set encoding=utf-8 "defaults to unicode
set expandtab "turns tab key into shortcut for multiple spaces
set fileencoding=utf-8
set fileformat=unix "sets end-of-line to unix <NL>
set foldcolumn=0 "set folding column width
set foldenable "enable code folding
set foldlevelstart=10 "leaves most folds open at start
set foldmethod=indent "fold based on indent level
set foldnestmax=2 "avoids nest mess
set hidden "hides buffers with unsaved changes instead of closing them
set history=500 "saves up to 500 history entries per session
set hlsearch "highlights search matches
set ignorecase "ignores case in searches
set incsearch "searches incrementally as characters are typed
set laststatus=2 "always display the status line
set lazyredraw "redraws screen only when necessary
set magic "search mode cross-compatability
set matchtime=2 "time in tenths of second to display showmatch
set mouse="" "disable mouse. vim is keyboard driven
set noerrorbells "turn off annoyances
set nolinebreak "prevents line breaks
set noshowmode "disables --mode-- displaying
set notermguicolors "fixes true color issue
set novisualbell "turn off more annoyances
set nottyfast "reduces characters sent for redrawing, helps slow connections
set nowrap "disables word wrap
set number "displays line numbers
set numberwidth=3 " width of line number column
set omnifunc=syntaxcomplete#Complete "enable omni syntax completion
set relativenumber "displays distance of lines from cursor
set ruler "displays current line number in status column
set scrolloff=7 "determines number of context lines above and below cursor
set shiftwidth=2 "number of spaces for each step of autoindent
set showbreak=> "shows line continuation
set showtabline=1 "shows tabline
set showmatch "highlight matching for brackets, braces, and parenthesis
set smartcase " become case-sensitive when pattern contains an upper case
set softtabstop=2 "number of spaces a tab represents
set synmaxcol=160 "sane syntax highlight columns; 160 is double 80 columns
set t_AB=^[[48;5;%dm "relates to t_Co background
set t_AF=^[[38;5;%dm "relates to t_Co foreground
set t_Co=256 "sets terminal color to 256
set t_Vb="" "turn off yet more annoyances
set tabstop=2 "number of spaces a tab represents
set termencoding=utf-8
set termguicolors "Use 24-bit colors
set textwidth=80 "sets maximum text width
set ttymouse="" "sets the mouse codes that vim will recognize
set whichwrap+=<,>,h,l,[,] "lets cursor wrap to the next line
set wildmenu "creates autocomplete graphical menu
set wildmode=full "for use with wildmenu
set writebackup "creates a backup before overwriting current buffer
syntax on "keeps your current color settings
color dracula

"" Keybindings
"allow spaces to be inserted in normal mode
nnoremap <Space> i<Space><esc>
"allow backspace to work in normal mode like it does in insert mode
nnoremap <BS> i<BS><esc>l

"""statusbar"""

"For displaying mode title when mode keys are pressed
let g:currentmode={
  \ 'n'  : 'NORMAL',
  \ 'i'  : 'INSERT',
  \ 'R'  : 'REPLACE',
  \ 'v'  : 'VISUAL',
  \ 'V'  : 'V-LINE',
  \ '' : 'V-BLOCK',
  \ 'c'  : 'Command',
  \}
"Colors the statusline to Normal mode coloring when vim opens
 " exe 'hi! StatusLine guibg=Green4'

"Changes color of statusline based on the mode
function! ChangeColor()
  mode()=n
  if (mode() ==# 'n')
    exe 'hi! StatusLine guibg=Green4'
  elseif (mode() ==# 'v')
    exe 'hi! StatusLine guibg=Purple4'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine guibg=Blue3'
  elseif (mode() ==# 'R')
    exe 'hi! StatusLine guibg=Red4'
  else
    exe 'hi! StatusLine guibg=Green4'
  endif
  return ''
endfunction

"Statusline components
set statusline= "Initializes statusline
set statusline+=\ %{g:currentmode[mode()]} "Mode name indicator
"set statusline+=%{ChangeColor()} "Color changing function
set statusline+=\ \| "Separator
set statusline+=\ %n\:%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}  "Buffer 
set statusline+=\ \| "Separator
set statusline+=\ %f\ %m "Filename and modified indicator
set statusline+=\ \| "Separator
set statusline+=%= "Spacer
set statusline+=\ \| "Separator
set statusline+=\ %p%% "Percent of file scrolled
