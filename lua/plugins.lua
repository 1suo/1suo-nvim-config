-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Auto completion, formatting, and linting
  use {'neoclide/coc.nvim', branch = 'release'}
  -- List of CoC extensions
  vim.g.coc_global_extensions = {
    'coc-tslint-plugin',
    'coc-tsserver',
    'coc-css',
    'coc-html',
    'coc-json',
    'coc-prettier',
    'coc-rust-analyzer',
  }

  -- Auto close brackets, parentheses, and braces
  use 'jiangmiao/auto-pairs'

  -- Highlighting and indenting for JSX and TSX files
  use 'yuezk/vim-js'
  use 'HerringtonDarkholme/yats.vim'
  use 'maxmellon/vim-jsx-pretty'

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  -- Instant commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
	ignore = '^$'
      })
    end
  }

  use {'burntsushi/ripgrep'}

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'}, {'burntsushi/ripgrep'}, {'sharkdp/fd'} }
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
        -- hop.nvim
      require'hop'.setup()

      -- normal mode (easymotion-like)
      vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
      vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
      vim.api.nvim_set_keymap("n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
      vim.api.nvim_set_keymap("n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})

      -- visual mode (easymotion-like)
      vim.api.nvim_set_keymap("v", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
      vim.api.nvim_set_keymap("v", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
      vim.api.nvim_set_keymap("v", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
      vim.api.nvim_set_keymap("v", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})


      -- normal mode (sneak-like)
      vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
      vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2BC<CR>", {noremap=false})

      -- visual mode (sneak-like)
      vim.api.nvim_set_keymap("v", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
      vim.api.nvim_set_keymap("v", "S", "<cmd>HopChar2BC<CR>", {noremap=false})
    end
  }

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }


  use({
     "kylechui/nvim-surround",
         tag = "*", -- Use for stability; omit to use `main` branch for the latest features
             config = function()
             require("nvim-surround").setup({
             -- Configuration here, or leave empty to use defaults
         })
     end
    })

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  use({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      requires = {
	  "nvim-lua/plenary.nvim",
      },
  })

  -- Colorschemes
  use {'dracula/vim', as = 'dracula'}
  use {'folke/tokyonight.nvim'}
  use {'skullamortis/forest.nvim'}
  use {'junegunn/seoul256.vim'}
  use {'sainnhe/everforest'}
-- " seoul256 (dark):
-- "   Range:   233 (darkest) ~ 239 (lightest)
-- "   Default: 237
-- let g:seoul256_background = 236
-- colo seoul256

-- " seoul256 (light):
-- "   Range:   252 (darkest) ~ 256 (lightest)
-- "   Default: 253
-- let g:seoul256_background = 256
-- colo seoul256
  use {'owickstrom/vim-colors-paramount'}
  use {'rose-pine/neovim'}
  use {'catppuccin/nvim'}
  use {'kepano/flexoki-neovim'}

  use { 'norcalli/nvim-colorizer.lua' }

  -- use {'github/copilot.vim'}

end)
