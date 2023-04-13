require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- FZF
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- https://github.com/mfussenegger/nvim-dap - for debugging
  -- https://github.com/jose-elias-alvarez/null-ls.nvim - to check

  -- Auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'

  -- Color Scheme
  use 'rafi/awesome-vim-colorschemes'
  use 'morhetz/gruvbox'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'preservim/nerdtree'

  -- Format
  -- use 'prettier/vim-prettier', { 'do': 'yarn install' }

  -- Rename tags
  use 'AndrewRadev/tagalong.vim'

  -- HTML
  use 'mattn/emmet-vim'

  -- Test
  use 'vim-test/vim-test'
  use 'preservim/vimux'

  use 'tpope/vim-fugitive'
  use 'jiangmiao/auto-pairs'
  use 'knsh14/vim-github-link'

  -- Copilot
  use 'github/copilot.vim'
end)

require("stuff.lsp")
require("stuff.treesitter")
require("stuff.cmp")


--------------------------------------------------------------------------------
-- Generic stuff
--------------------------------------------------------------------------------
vim.opt.relativenumber = true
vim.opt.clipboard:append { "unnamedplus" }
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.swapfile = false

--------------------------------------------------------------------------------
-- Color Scheme
--------------------------------------------------------------------------------
vim.opt.termguicolors = true
vim.g.gruvbox_contrast_dark='hard'
vim.cmd("colorscheme gruvbox")

--------------------------------------------------------------------------------
-- Find
--------------------------------------------------------------------------------
vim.keymap.set('n', '<c-p>', ':FZF<CR>')
vim.keymap.set('n', '<leader>ff', ':Rg<CR>')
vim.keymap.set('n', '<leader>fw', ':Rg <c-r><c-w><CR>')
-- Search visually selected text
vim.keymap.set('v', '*', "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.g.fzf_layout = { down="40%" }
vim.g.fzf_layout = { up='60%' }

--------------------------------------------------------------------------------
-- Navigation
--------------------------------------------------------------------------------
vim.keymap.set('n', '<c-k>', '18k')
vim.keymap.set('n', '<c-j>', '18j')
vim.keymap.set('n', '<c-h>', 'zH')
vim.keymap.set('n', '<c-l>', 'zL')


--------------------------------------------------------------------------------
-- Buffers
--------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>fb', ':Buffers <CR>')

--------------------------------------------------------------------------------
-- Quick Fix
--------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>v', ':cnext<CR>')
vim.keymap.set('n', '<leader>z', ':cprevious<CR>')
vim.keymap.set('n', '<c-Q>', ':lua actions.smart_send_to_qflist()<CR>')

--------------------------------------------------------------------------------
-- Jumplist mutations
--  - ThePrimeagen: https://www.youtube.com/watch?v=hSHATqh8svM&t=69s
--------------------------------------------------------------------------------
vim.keymap.set('n', '<expr>', 'k (v:count > 5 ? "m\'" . v:count : "") . \'k\'')
vim.keymap.set('n', '<expr>', 'j (v:count > 5 ? "m\'" . v:count : "") . \'j\'')

--------------------------------------------------------------------------------
-- CoC Golang syntax highlighting
--------------------------------------------------------------------------------
vim.cmd('highlight! link goSpaceError NONE')

--------------------------------------------------------------------------------
-- mouse
---------------------------------------------------------------------------------
vim.opt.mouse = "n"

--------------------------------------------------------------------------------
-- Toggle quickfix list
--------------------------------------------------------------------------------
vim.cmd [[
let g:the_primeagen_qf_g = 0
fun! ToggleQFList()
    if g:the_primeagen_qf_g == 1
        let g:the_primeagen_qf_g = 0
        cclose
    else
        let g:the_primeagen_qf_g = 1
        botright copen 20
    end
endfun
nnoremap <C-Space> :call ToggleQFList()<CR>
]]

--------------------------------------------------------------------------------
-- Formatting
---------------------------------------------------------------------------------
vim.keymap.set('v', '<leader>p', ':PrettierFragment<CR>')

--------------------------------------------------------------------------------
-- LSP
---------------------------------------------------------------------------------
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<space>e', ':lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')

--------------------------------------------------------------------------------
-- Git
--------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>g', ':G<CR>')
vim.keymap.set('n', '<leader>gg', ':G<CR>')
vim.keymap.set('n', '<leader>gc', ":G commit -m ''<LEFT>")
vim.keymap.set('n', '<leader>gC', ":G add . \\| :G commit -m ''<LEFT>")
vim.keymap.set('n', '<leader>ga', ':G commit --amend')
vim.keymap.set('n', '<leader>gp', ':G push')

--------------------------------------------------------------------------------
-- Other mappings
--------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>h', ':noh<CR>')
vim.keymap.set('n', '<c-n>', ':noh<CR>')
vim.keymap.set('n', '<c-s>', ':wa<CR>')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('n', ',p', '"0p')
vim.keymap.set('v', ',p', '"0p')
vim.keymap.set('n', ',P', '"0P')
vim.keymap.set('v', ',P', '"0P')

--------------------------------------------------------------------------------
-- Treesitter
--------------------------------------------------------------------------------
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldmethod = "expr"

--------------------------------------------------------------------------------
-- Fix issue copy pasting non ascii characters
--------------------------------------------------------------------------------
vim.cmd("let $LANG='en_US.UTF-8'")

--------------------------------------------------------------------------------
-- Completion
--------------------------------------------------------------------------------
vim.cmd("set completeopt=menu,menuone,noselect")

--------------------------------------------------------------------------------
-- NERDTree
--------------------------------------------------------------------------------
vim.keymap.set('n', '<leader><leader>', ':NERDTreeFind<CR>')
vim.keymap.set('n', '<leader>ntf', ':NERDTreeFind<CR>')
vim.cmd("let NERDTreeIgnore=['\\~$', '__pycache__']")

--------------------------------------------------------------------------------
-- Custom commands
--------------------------------------------------------------------------------
vim.cmd('command CCopyRelativeFilePath let @+ = expand("%")')
vim.cmd('command CCopyFullFilePath     let @+ = expand("%:p")')

--------------------------------------------------------------------------------
-- Tests
--------------------------------------------------------------------------------
vim.cmd [[
let test#strategy = "vimux"
let test#python#pytest#executable = 'docker-compose -f docker-compose.yml -f docker-compose.test.yml run -w /srv -e PYTHONPATH="/srv/app/service:/srv/app" service pytest'
" let test#python#pytest#executable = 'docker-compose -f docker-compose.yml -f docker-compose.test.yml run -w / -e PYTHONPATH="/app" web pytest'
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
]]

--------------------------------------------------------------------------------
-- Copilot
--------------------------------------------------------------------------------
vim.g.copilot_enabled = false
vim.keymap.set("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("i", "<C-K>", 'copilot#Previous()', { silent = true, expr = true })
vim.keymap.set("i", "<C-J>", 'copilot#Next()', { silent = true, expr = true })

--------------------------------------------------------------------------------
-- How to execute a custom script
--------------------------------------------------------------------------------
--- :lua vim.keymap.set('n', '<leader>0', ':!./.stuff/build_tp_pdf_img_not_showing_up.sh<CR>')
