vim.cmd 'colorscheme aetherwind-dark'
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"

vim.opt.scrolloff = 4

vim.opt.updatetime = 44

vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undoarchive"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

--
-- for overriding tpope/vim-markdown tabstop
vim.cmd([[                                                                                          
set runtimepath^=~/.vim runtimepath+=~/.vim/after                                                   
let &packpath = &runtimepath                                                                        
if get(g:, 'markdown_recommended_style', 1)                                                         
  setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4   
endif                                                                                               
]])

-- Reference from .vimrc
-- vim.opt.mouse = 
-- vim.cmd 'nnoremap Y Y'
-- vim.opt.shiftwidth =  
-- vim.opt.tabstop = 2
-- vim.opt.autoindent
-- vim.opt.smartindent
-- vim.opt.nowrap
-- vim.opt.hlsearch
-- vim.opt.incsearch
