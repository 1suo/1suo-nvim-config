-- init.lua

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
vim.o.timeoutlen = 300

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

require('lazy').setup('plugins')

-- [[ COLORSCHEME ]]
vim.cmd('colorscheme paramount')

-- [[ TELESCOPE ]]
require("telescope").setup { defaults = { file_ignore_patterns = { "node_modules" } } }

-- [[ TREESITTER ]]
vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')

-- [[ KEYMAPPINGS from init.vim & init-inprogress.lua ]]
vim.api.nvim_set_keymap('n', '<Leader>q', [[:q<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', [[:w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>W', [[:wq<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>1', [[:wincmd 1w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>2', [[:wincmd 2w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>3', [[:wincmd 3w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>4', [[:wincmd 4w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>5', [[:wincmd 5w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>6', [[:wincmd 6w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>7', [[:wincmd 7w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>8', [[:wincmd 8w<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>9', [[:wincmd 9w<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>bd', [[:set background=dark<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bl', [[:set background=light<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>co', [[:Telescope colorscheme<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>ff', [[:Telescope find_files<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', [[:Telescope live_grep<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', [[:Telescope buffers<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>t', [[:terminal<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', [[:execute 'cd ' . expand('%:p:h')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fp', [[:let @+ = expand('%:p:h')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', [[:Explore<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>so', [[:source%<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>/', [[:let @/ = ""<CR>]], { noremap = true, silent = true })

vim.keymap.set('n', 'D', '"mddp')
vim.keymap.set('n', 'U', '"mddkP')
vim.keymap.set('n', 'J', '10j')
vim.keymap.set('n', 'K', '10k')
vim.keymap.set('n', 'H', '10h')
vim.keymap.set('n', 'L', '10l')

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
vim.keymap.set('v', ';', ':')
vim.keymap.set('v', ':', ';')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.api.nvim_set_keymap('n', '<Leader>vs', [[:vsplit<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>hs', [[:split<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>zw', [[:set wrap<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>zn', [[:set nowrap<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>lg', [[:LazyGit<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lf', [[:LazyGitFilter<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>y', ':"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pp', ':"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pP', ':"+P', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>ps', [[:PackerSync<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pc', [[:PackerClean<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pi', [[:PackerInstall<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pu', [[:PackerUpdate<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pl', [[:PackerLoad<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pt', [[:PackerStatus<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>fd', [[:CocCommand prettier.forceFormatDocument<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ct', [[:checktime<CR>]], { noremap = true, silent = true })

-- [[ FUNCTIONS ]]
function OpenBufferInFloatWindow()
    local current_buf = vim.fn.bufnr("")
    local screen_width = vim.fn.winwidth(0)
    local screen_height = vim.fn.winheight(0)

    local float_width = math.floor(screen_width * 0.7)
    local float_height = math.floor(screen_height * 0.9)
    local float_row = math.floor((screen_height - float_height) / 2)
    local float_col = math.floor((screen_width - float_width) / 2)

    local float_opts = {
        relative = 'editor',
        width = float_width,
        height = float_height,
        row = float_row,
        col = float_col,
        border = 'single'
    }

    vim.fn.nvim_open_win(current_buf, 1, float_opts)
end

vim.api.nvim_set_keymap('n', '<leader>of', [[:lua OpenBufferInFloatWindow()<CR>]], { noremap = true, silent = true })

-- Autocmds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function()
    vim.opt_local.foldenable = false
  end,
})
