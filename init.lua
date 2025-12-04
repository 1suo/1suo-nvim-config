-- init.lua

-- Disable unused providers
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- [[ OPTIONS ]]
-- See :help option-list
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 500

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should change this to another location if you want your backups to be stored elsewhere.
vim.o.backupdir = os.getenv('HOME') .. '/.cache/nvim/backups/'

vim.o.termguicolors = true
vim.o.cursorline = true

vim.o.list = false
vim.o.listchars = 'eol:↵,trail:~,tab:>-,nbsp:.,space:.'

vim.o.shiftwidth = 2
vim.o.foldmethod = 'indent'
vim.o.encoding = 'utf-8'
vim.o.guifont = 'JetBrainsMono NFM:h10'
vim.o.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

vim.o.foldenable = false

-- [[ KEYMAPS ]]
-- See `:help vim.keymap.set()`

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ PLUGINS ]]
-- only plugin manager is configured here
-- See `:help lazy.nvim`
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  rocks = {
    enabled = false,
  },
})

-- [[ COLORSCHEME ]]
-- vim.cmd.colorscheme 'default'

-- [[ KEYMAPPINGS from init.vim & init-inprogress.lua ]]
-- In <Leader> sequences, system commands are mapped to non-apha symbols to give plugins semantic space in alphabet

-- Frequent commands occupy whole letter domains, write ++p option to force create parent directories if not exist
vim.api.nvim_set_keymap('n', '<Leader>q', [[:q!<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', [[:w! ++p<CR>]], { noremap = true, silent = true })

-- Lazy.nvim shortcut (only plugin to include here)
vim.api.nvim_set_keymap('n', '<Leader>:', [[:Lazy<CR>]], { noremap = true, silent = true })

-- Split window shortcuts
vim.api.nvim_set_keymap('n', '<Leader>|', [[:vsplit<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>-', [[:split<CR>]], { noremap = true, silent = true })

-- Toggle background between dark and light
vim.api.nvim_set_keymap('n', '<Leader>_', [[:set background=dark<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>+', [[:set background=light<CR>]], { noremap = true, silent = true })

-- Check if file changed outside of Neovim
vim.api.nvim_set_keymap('n', '<Leader>=', [[:checktime<CR>]], { noremap = true, silent = true })

-- Clear search highlight
vim.api.nvim_set_keymap('n', '<Leader><Leader>', [[:noh<CR>]], { noremap = true, silent = true })

-- Terminal, marks, jumps, registers
vim.api.nvim_set_keymap('n', '<Leader>~', [[:terminal<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>\'', [[:marks<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>`', [[:jumps<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>"', [[:registers<CR>]], { noremap = true, silent = true })

-- Resize splits
vim.api.nvim_set_keymap('n', '<C-Up>',    [[:resize +2<CR>]],    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>',  [[:resize -2<CR>]],		{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>',  [[:vertical resize -2<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', [[:vertical resize +2<CR>]], { noremap = true, silent = true })

-- Navigation between splits
vim.api.nvim_set_keymap('n', '<C-h>', [[:wincmd h<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', [[:wincmd j<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', [[:wincmd k<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', [[:wincmd l<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>,', [[:wincmd W<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>.', [[:wincmd w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>/', [[:wincmd o<CR>]], { noremap = true, silent = true })

-- Navigate tabs
vim.api.nvim_set_keymap('n', '<Leader>&',    [[:tabclose<CR>]],    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>*',    [[:tabnew<CR>]],      { noremap = true, silent = true })

-- Navigate buffers
vim.api.nvim_set_keymap('n', '<Leader>[',  [[:bprevious<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>]', [[:bnext<CR>]],     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>\\', [[:bdelete<CR>]],   { noremap = true, silent = true })

-- File operations
vim.api.nvim_set_keymap('n', '<Leader>!', [[:ene<CR>]],        { noremap = true, silent = true }) -- new empty file
vim.api.nvim_set_keymap('n', '<Leader>@', [[:let @+ = expand('%:p')<CR>]], { noremap = true, silent = true }) -- copy current file path to clipboard
vim.api.nvim_set_keymap('n', '<Leader>#', [[:yank %<CR>]],        { noremap = true, silent = true }) -- copy entire file to clipboard
vim.api.nvim_set_keymap('n', '<Leader>$', [[:saveas ]],        { noremap = true, silent = false }) -- save as (leave filename to be typed)
vim.api.nvim_set_keymap('n', '<Leader>%', [[:e %:h<CR>]],      { noremap = true, silent = true }) -- open current file's directory
vim.api.nvim_set_keymap('n', '<Leader>^', [[:<C-u>execute 'saveas ' . input('New Name: ', expand('%:p:h') . '/') . expand('%:t')<CR>:bdelete #<CR>]], { noremap = true, silent = true })

-- Open configuration files
vim.api.nvim_set_keymap('n', '<Leader>(', [[:e $MYVIMRC<CR>]],       { noremap = true, silent = true }) -- open init.lua
vim.api.nvim_set_keymap('n', '<Leader>)', [[:e ~/.config/nvim/lua/plugins/init.lua<CR>]], { noremap = true, silent = true }) -- open plugins.lua	

-- Inspect mapping
vim.api.nvim_set_keymap('n', '<Leader>?', [[:map ]], { noremap = true, silent = false })

-- Move lines up and down
vim.api.nvim_set_keymap('n', '<A-j>', [[:m .+1<CR>==]],   { noremap = true, silent = true }) -- move line down
vim.api.nvim_set_keymap('n', '<A-k>', [[:m .-2<CR>==]],	 { noremap = true, silent = true }) -- move line up

-- Utility mappings

vim.keymap.set('n', 'J', '10j')
vim.keymap.set('n', 'K', '10k')
vim.keymap.set('n', 'H', '10h')
vim.keymap.set('n', 'L', '10l')

vim.keymap.set('v', 'J', '10j')
vim.keymap.set('v', 'K', '10k')
vim.keymap.set('v', 'H', '10h')	
vim.keymap.set('v', 'L', '10l')

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
vim.keymap.set('v', ';', ':')
vim.keymap.set('v', ':', ';')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Direct tab access
vim.api.nvim_set_keymap('n', '<Leader>1', [[:tabn 1<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>2', [[:tabn 2<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>3', [[:tabn 3<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>4', [[:tabn 4<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>5', [[:tabn 5<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>6', [[:tabn 6<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>7', [[:tabn 7<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>8', [[:tabn 8<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>9', [[:tabn 9<CR>]], { noremap = true, silent = true })

