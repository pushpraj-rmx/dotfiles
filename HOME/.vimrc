"------------------------------|START OF THE FILE|-------------------"
:set background=dark
:set laststatus=2
:set noshowmode
:set encoding=UTF-8
:set number relativenumber
:syntax on
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
"Convertts our tabs to spaces
:set expandtab
:set autoindent
:set fileformat=unix

"Newtab with ctrl+t
        nnoremap <silent> <C-t> :tabnew<CR>
        
"Automatically deletes all trailing whitespace on save.
       autocmd BufWritePre * %s/\s\+$//e
       
"Run xrdb whenever Xdefaults or Xresources are updated.
       autocmd BufWritePost *Xresources,*Xdefaults !xrdb %


"---------------------------------------PLUG-IN----------------------------------"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.gith    ubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}"
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
"________________________________________________________________________________"

"--------------------------------------END OF THE FILE---------------------------"
