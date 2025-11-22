-- lua/plugins/init.lua
return {
  -- Packer can manage itself
  'wbthomason/packer.nvim',

  -- Auto completion, formatting, and linting
  { 'neoclide/coc.nvim', branch = 'release' },
  -- List of CoC extensions
  -- NOTE: You need to run :CocInstall followed by the extension name for each of these
  -- vim.g.coc_global_extensions = {
  --   'coc-tslint-plugin',
  --   'coc-tsserver',
  --   'coc-css',
  --   'coc-html',
  --   'coc-json',
  --   'coc-prettier',
  --   'coc-rust-analyzer',
  -- }

  -- Auto close brackets, parentheses, and braces
  'jiangmiao/auto-pairs',

  -- Highlighting and indenting for JSX and TSX files
  'yuezk/vim-js',
  'HerringtonDarkholme/yats.vim',
  'maxmellon/vim-jsx-pretty',

  -- Simple plugins can be specified as strings
  'rstacruz/vim-closer',

  -- Instant commenting
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        ignore = '^$',
      })
    end,
  },

  { 'burntsushi/ripgrep' },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim', 'burntsushi/ripgrep', 'sharkdp/fd' },
  },

  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- hop.nvim
      require('hop').setup()

      -- normal mode (easymotion-like)
      vim.api.nvim_set_keymap('n', '<Leader><Leader>b', '<cmd>HopWordBC<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader><Leader>w', '<cmd>HopWordAC<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader><Leader>j', '<cmd>HopLineAC<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader><Leader>k', '<cmd>HopLineBC<CR>', { noremap = true })

      -- visual mode (easymotion-like)
      vim.api.nvim_set_keymap('v', '<Leader><Leader>w', '<cmd>HopWordAC<CR>', { noremap = true })
      vim.api.nvim_set_keymap('v', '<Leader><Leader>b', '<cmd>HopWordBC<CR>', { noremap = true })
      vim.api.nvim_set_keymap('v', '<Leader><Leader>j', '<cmd>HopLineAC<CR>', { noremap = true })
      vim.api.nvim_set_keymap('v', '<Leader><Leader>k', '<cmd>HopLineBC<CR>', { noremap = true })

      -- normal mode (sneak-like)
      vim.api.nvim_set_keymap('n', 's', '<cmd>HopChar2AC<CR>', { noremap = false })
      vim.api.nvim_set_keymap('n', 'S', '<cmd>HopChar2BC<CR>', { noremap = false })

      -- visual mode (sneak-like)
      vim.api.nvim_set_keymap('v', 's', '<cmd>HopChar2AC<CR>', { noremap = false })
      vim.api.nvim_set_keymap('v', 'S', '<cmd>HopChar2BC<CR>', { noremap = false })
    end,
  },

  -- Lazy loading:
  -- Load on specific commands
  { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } },

  -- Load on an autocommand event
  { 'andymass/vim-matchup', event = 'VimEnter' },

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  {
    'w0rp/ale',
    ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]',
  },

  -- Plugins can have dependencies on other plugins
  {
    'haorenW1025/completion-nvim',
    dependencies = { 'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ' },
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},

  -- Plugins can have post-install/update hooks
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn.system('cd app && yarn install')
    end,
    cmd = 'MarkdownPreview'
  },

  -- Post-install/update hook with neovim command
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Use dependency and run lua function after load
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  },

  {
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'joshuadanpeterson/typewriter',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('typewriter').setup()
    end,
  },

  'wakatime/vim-wakatime',
  'karb94/neoscroll.nvim',

  -- Colorschemes
  { 'dracula/vim', as = 'dracula' },
  { 'folke/tokyonight.nvim' },
  { 'skullamortis/forest.nvim' },
  { 'junegunn/seoul256.vim' },
  { 'sainnhe/everforest' },
  'Mofiqul/adwaita.nvim',
  { 'owickstrom/vim-colors-paramount' },
  { 'rose-pine/neovim' },
  { 'catppuccin/nvim' },
  { 'kepano/flexoki-neovim' },

  -- { 'norcalli/nvim-colorizer.lua' },

  { 'github/copilot.vim' },
  { 'tact-lang/tact.vim' },
}
