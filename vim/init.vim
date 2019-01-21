" ----------------------------------------------------------------------------
" VUNDLE SETUP
" ----------------------------------------------------------------------------
set nocompatible				" be IMproved, required
filetype off					" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ----------------------------------------------------------------------------
" GENERAL PLUGINS
" ----------------------------------------------------------------------------

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'

" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'

" NERDTree and tabs together in Vim, painlessly.
Plugin 'jistr/vim-nerdtree-tabs'

" A plugin of NERDTree showing git status flags.
Plugin 'Xuyuanp/nerdtree-git-plugin'

" A plugin for commenting
Plugin 'scrooloose/nerdcommenter'

" status/tabline for vim
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Solarized colorscheme for vim
" Plugin 'altercation/vim-colors-solarized'

" Nord colorscheme for vim
Plugin 'arcticicestudio/nord-vim'

" adds filetype glyphs (icons) to other plugins
Plugin 'ryanoasis/vim-devicons'

" Syntax checker
Plugin 'scrooloose/syntastic'

" Linting engine
Plugin 'w0rp/ale'

" Autocomplete
Plugin 'shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" ----------------------------------------------------------------------------
" GOLANG PLUGINS
" ----------------------------------------------------------------------------

" Go language support
Plugin 'fatih/vim-go'

" Delve debug support
Plugin 'sebdah/vim-delve'

" Deoplete support for go
Plugin 'zchee/deoplete-go'

" ----------------------------------------------------------------------------
" TYPESCRIPT PLUGINS
" ----------------------------------------------------------------------------

" Syntax file and other settings for TypeScript.
Plugin 'leafgarland/typescript-Vim'

" ----------------------------------------------------------------------------
" CPP PLUGINS
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" MISC PLUGINS
" ----------------------------------------------------------------------------

" the best Git wrapper of all time
" Plugin 'tpope/vim-fugitive'

" used by google/maktaba
" Plugin 'google/maktaba'

" syntax-aware code formatting using clang-formatter
" Plugin 'google/vim-codefmt'

" graphql syntax
" Plugin 'jparise/vim-graphql'

" Autocomplete plugin
" Plugin 'Valloric/YouCompleteMe'

" Syntax highlight for AppleScript
Plugin 'applescript.vim'

" All of your Plugins must be added before the following line
call vundle#end()				" required
filetype plugin indent on			" required

" ----------------------------------------------------------------------------
" BASIC CONFIGURATION
" ----------------------------------------------------------------------------
set number					" enable line numbers
set wildignore+=*/tmp/*,*.so,*.swp,*.zip	" MacOS/Linux
set encoding=utf8				" encoding
let mapleader=','				" remap leader key
set tabstop=2					" set tab width to 2 char
set shiftwidth=2				" indent width 2 char
set softtabstop=2				" num. columns for tab
set expandtab					" expand tab to spaces
set mouse=a           " enable mouse

" Clipboard provider support
set clipboard+=unnamedplus

" Python provider support
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'


" transparent background
" hi Normal             ctermbg=NONE
" hi Statement          ctermbg=NONE
" hi Title              ctermbg=NONE
" hi Todo               ctermbg=NONE
" hi Underlined         ctermbg=NONE
" hi ErrorMsg           ctermbg=NONE
" hi LineNr             ctermbg=NONE

" ----------------------------------------------------------------------------
" ctrlpvim/ctrlp.vim PLUGIN
" ----------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'			" default mapping
let g:ctrlp_cmd = 'CtrlP'			" default command
let g:ctrlp_working_path_mode = 'ra'		" starting directory

" ----------------------------------------------------------------------------
" scrooloose/nerdtree PLUGIN
" ----------------------------------------------------------------------------
" arrow symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1			" show hidden files

" ----------------------------------------------------------------------------
" scrooloose/nerdcommenter PLUGIN
" ----------------------------------------------------------------------------
let g:NERDSpaceDelims = 1       " Add spaces after comment delimeter
let g:NERDCompactSexyComs = 1   " Use compact multiline sytnax
let g:NERDDefaultAlign = 'left' " Allign blocks to the left
let g:NERDCommentEmptyLines = 1

" ----------------------------------------------------------------------------
" jistr/vim-nerdtree-tabs PLUGIN
" ----------------------------------------------------------------------------
let g:nerdtree_tabs_open_on_console_startup = 1	" always open NERDTree
let g:nerdtree_tabs_focus_on_files = 1		" focus is on file window

" ----------------------------------------------------------------------------
" Xuyuanp/nerdtree-git-plugin PLUGIN
" ----------------------------------------------------------------------------
" GIT symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeShowIgnoredStatus = 1		" show ignored status

" ----------------------------------------------------------------------------
" bling/vim-airline PLUGIN
" ----------------------------------------------------------------------------
set laststatus=2				" always shoe statussyntax enable
let g:airline_powerline_fonts = 1		" powerline support
" let g:airline_theme='sol'			" set theme
let g:airline#extensions#tabline#enabled = 1	" enable tabline
" let g:airline_solarized_bg='dark'		" set dark theme
" let g:solarized_termcolors=256

" ----------------------------------------------------------------------------
" altercation/vim-colors-solarized PLUGIN
" ----------------------------------------------------------------------------
syntax enable					" enable syntax highlight
" set background=dark				" set dark theme
" let g:solarized_termcolors=256			" terminal fix
" colorscheme solarized				" set theme

" ----------------------------------------------------------------------------
" arcticicestudio/nord-vim PLUGIN
" ----------------------------------------------------------------------------
colorscheme nord    " enable theme
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 12
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

" ----------------------------------------------------------------------------
" tpope/vim-fugitive PLUGIN
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" google/codefmt PLUGIN
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" leafgarland/typescript-vim PLUGIN
" ----------------------------------------------------------------------------
let g:typescript_indent_disable = 1		" disable auto indent

" ----------------------------------------------------------------------------
" Valloric/YouCompleteMe PLUGIN
" ----------------------------------------------------------------------------
" set completeopt-=preview " Don't show preview window

" Autocomplete dialog colors
" highlight Pmenu ctermfg=7 ctermbg=23

" ----------------------------------------------------------------------------
" fatih/vim-go PLUGIN
" ----------------------------------------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>gt :GoDeclsDir<cr>
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>

" let g:go_auto_type_info = 1

au FileType go nmap <F12> <Plug>(go-def)

let g:go_addtags_transform = "snakecase"

" ----------------------------------------------------------------------------
" scrooloose/syntastic PLUGIN
" ----------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----------------------------------------------------------------------------
" w0rp/ale PLUGIN
" ----------------------------------------------------------------------------
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" " Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" ----------------------------------------------------------------------------
" shougo/deoplete.nvim PLUGIN
" ----------------------------------------------------------------------------
if has('nvim')
	" Enable deoplete on startup
  let g:deoplete#enable_at_startup = 1
endif
set completeopt-=preview

" ----------------------------------------------------------------------------
" sebdah/vim-delve PLUGIN
" ----------------------------------------------------------------------------
au FileType go nmap <leader>dtb :DlvToggleBreakpoint<cr>
au FileType go nmap <leader>dt :DlvTest<cr>
let g:delve_breakpoint_sign_highlight = 'ALEErrorSign'
