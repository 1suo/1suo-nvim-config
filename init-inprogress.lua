require('plugins')

function OpenBufferInFloatWindow()
    -- Save the current 'updatetime' option
    local saved_updatetime = vim.o.updatetime

    -- Set 'updatetime' to a high value to suppress error messages
    vim.o.updatetime = 10000

    -- Get the current buffer and window
    local current_buf = vim.fn.bufnr("")
    local current_win = vim.fn.winnr()

    -- Calculate the screen dimensions
    local screen_width = vim.fn.winwidth(0)
    local screen_height = vim.fn.winheight(0)

    -- Calculate the floating window position
    local float_width = math.floor(screen_width * 0.7)
    local float_height = math.floor(screen_height * 0.9)
    local float_row = math.floor((screen_height - float_height) / 2)
    local float_col = math.floor((screen_width - float_width) / 2)

    -- Create a new floating window and set its properties
    local float_opts = {
        relative = 'editor',
        width = float_width,
        height = float_height,
        row = float_row,
        col = float_col,
        border = 'single'
    }

    -- Open the floating window and set its buffer to the current buffer
    local float_win = vim.fn.nvim_open_win(current_buf, 1, float_opts)

    -- Set the floating window as the current window
    vim.cmd('wincmd w' .. float_win)

    -- Return focus to the original window
    vim.cmd('wincmd w' .. current_win)

    -- Restore the original 'updatetime' value
    vim.o.updatetime = saved_updatetime
end

-- Function to open buffer in a floating window
function OpenBufferInFloatWindow()
    local saved_updatetime = vim.o.updatetime
    vim.o.updatetime = 10000

    local current_buf = vim.fn.bufnr("")
    local current_win = vim.fn.winnr()

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

    local float_win = vim.fn.nvim_open_win(current_buf, 1, float_opts)

    vim.cmd('wincmd w' .. float_win)
    vim.cmd('wincmd w' .. current_win)

    vim.o.updatetime = saved_updatetime
end

vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>of', [[:lua OpenBufferInFloatWindow()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>bd', [[:set background=dark<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bl', [[:set background=light<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>co', [[:colorscheme paramount<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>ff', [[:Telescope find_files<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', [[:Telescope live_grep<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', [[:Telescope buffers<CR>]], { noremap = true, silent = true })

--remappings from init.vim
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



vim.o.list = true
vim.o.listchars = 'eol:↵,trail:~,tab:>-,nbsp:.,space:.'

vim.o.ignorecase = true
vim.o.number = true
vim.o.shiftwidth = 2
vim.o.foldmethod = 'indent'
vim.o.encoding = 'utf-8'
vim.o.guifont = 'JetBrainsMono NFM:h10'
vim.o.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

vim.o.foldmethod = 'indent'
vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')

-- Disable folding at startup
vim.o.foldenable = false

vim.cmd('colorscheme paramount')

-- Set options for list characters
vim.o.list = true
vim.o.listchars = 'eol:␍,trail:~,tab:>-,nbsp:.,space:.'

-- Set ignorecase
vim.o.ignorecase = true
vim.o.number = true
vim.o.foldmethod = 'indent'
vim.o.shiftwidth = 2
vim.o.encoding = 'utf-8'
