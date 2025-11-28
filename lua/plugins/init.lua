-- lua/plugins/init.lua
return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    config = function()
      -- Setup orgmode
      require('orgmode').setup({
	org_agenda_files = '~/memo/orgfiles/*',
	org_default_notes_file = '~/memo/orgfiles/refile.org',
	org_capture_templates = {
    	  t = {
	    description = 'Task',
	    template = '* TODO %?\n  %a\n  %U\n  ',
	    target = '~/memo/orgfiles/tasks.org',
	  },
	  j = {
	    description = 'Journal Entry',
	    template = '* %U %?\n',
	    target = '~/memo/orgfiles/journal.org',
	  },
	}
      })
    end,
  },
  {
    "nvim-orgmode/telescope-orgmode.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-orgmode/orgmode",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("orgmode")

      vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
      vim.keymap.set("n", "<leader>fh", require("telescope").extensions.orgmode.search_headings)
      vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)
      vim.keymap.set("n", "<leader>ot", require("telescope").extensions.orgmode.search_tags)
    end,
  },
  {
    'hamidi-dev/org-super-agenda.nvim',
    dependencies = {
      'nvim-orgmode/orgmode', -- required
      { 'lukas-reineke/headlines.nvim', config = true }, -- optional nicety
    },
    config = function()
      require('org-super-agenda').setup({
	-- Where to look for .org files
	org_files           = {},
	org_directories     = {}, -- recurse for *.org
	exclude_files       = {},
	exclude_directories = {},

	-- TODO states + their quick filter keymaps and highlighting
	todo_states = {
	  { name='TODO',     keymap='ot', color='#FF5555', strike_through=false, fields={'filename','todo','headline','priority','date','tags'} },
	  { name='PROGRESS', keymap='op', color='#FFAA00', strike_through=false, fields={'filename','todo','headline','priority','date','tags'} },
	  { name='WAITING',  keymap='ow', color='#BD93F9', strike_through=false, fields={'filename','todo','headline','priority','date','tags'} },
	  { name='DONE',     keymap='od', color='#50FA7B', strike_through=true,  fields={'filename','todo','headline','priority','date','tags'} },
	},

	-- Agenda keymaps (inline comments explain each)
	keymaps = {
	  filter_reset      = 'oa', -- reset all filters
	  toggle_other      = 'oo', -- toggle catch-all "Other" section
	  filter            = 'of', -- live filter (exact text)
	  filter_fuzzy      = 'oz', -- live filter (fuzzy)
	  filter_query      = 'oq', -- advanced query input
	  undo              = 'u',  -- undo last change
	  reschedule        = 'cs', -- set/change SCHEDULED
	  set_deadline      = 'cd', -- set/change DEADLINE
	  cycle_todo        = 't',  -- cycle TODO state
	  reload            = 'r',  -- refresh agenda
	  refile            = 'R',  -- refile via Telescope/org-telescope
	  hide_item         = 'x',  -- hide current item
	  preview           = 'K',  -- preview headline content
	  reset_hidden      = 'X',  -- clear hidden list
	  toggle_duplicates = 'D',  -- duplicate items may appear in multiple groups
	  cycle_view        = 'ov', -- switch view (classic/compact)
	},

	-- Window/appearance
	window = {
	  width        = 0.8,
	  height       = 0.7,
	  border       = 'rounded',
	  title        = 'Org Super Agenda',
	  title_pos    = 'center',
	  margin_left  = 0,
	  margin_right = 0,
	  fullscreen_border = 'none', -- border style when using fullscreen
	},

	-- Group definitions (order matters; first match wins unless allow_duplicates=true)
	groups = {
	  { name = '📅 Today',     matcher = function(i) return i.scheduled and i.scheduled:is_today() end, sort={ by='priority', order='desc' } },
	  { name = '🗓️ Tomorrow', matcher = function(i) return i.scheduled and i.scheduled:days_from_today() == 1 end },
	  { name = '☠️ Deadlines', matcher = function(i) return i.deadline and i.todo_state ~= 'DONE' and not i:has_tag('personal') end, sort={ by='deadline', order='asc' } },
	  { name = '⭐ Important',  matcher = function(i) return i.priority == 'A' and (i.deadline or i.scheduled) end, sort={ by='date_nearest', order='asc' } },
	  { name = '⏳ Overdue',    matcher = function(i) return i.todo_state ~= 'DONE' and ((i.deadline and i.deadline:is_past()) or (i.scheduled and i.scheduled:is_past())) end, sort={ by='date_nearest', order='asc' } },
	  { name = '🏠 Personal',   matcher = function(i) return i:has_tag('personal') end },
	  { name = '💼 Work',       matcher = function(i) return i:has_tag('work') end },
	  { name = '📆 Upcoming',   matcher = function(i)
	      local days = require('org-super-agenda.config').get().upcoming_days or 10
	      local d1 = i.deadline  and i.deadline:days_from_today()
	      local d2 = i.scheduled and i.scheduled:days_from_today()
	      return (d1 and d1 >= 0 and d1 <= days) or (d2 and d2 >= 0 and d2 <= days)
	    end,
	    sort={ by='date_nearest', order='asc' }
	  },
	},

	-- Defaults & behavior
	upcoming_days      = 10,
	hide_empty_groups  = true,      -- drop blank sections
	keep_order         = false,     -- keep original org order (rarely useful)
	allow_duplicates   = false,     -- if true, an item can live in multiple groups
	group_format       = '* %s',    -- group header format
	other_group_name   = 'Other',
	show_other_group   = false,     -- show catch-all section
	show_tags          = true,      -- draw tags on the right
	show_filename      = true,      -- include [filename]
	heading_max_length = 70,
	persist_hidden     = false,     -- keep hidden items across reopen
	view_mode          = 'classic', -- 'classic' | 'compact'

	classic = { heading_order={'filename','todo','priority','headline'}, short_date_labels=false, inline_dates=true },
	compact = { filename_min_width=10, label_min_width=12 },

	-- Global fallback sort for groups that omit `sort`
	group_sort = { by='date_nearest', order='asc' },

	debug = false,
      })
    end,
  },

  -- nnn file manager
  { 'mcchrish/nnn.vim' },
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

  -- nvim-cmp setup
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end,
  },

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

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { 'node_modules' },
        },
      }
    end,
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
  -- {
  --   'andymass/vim-matchup',
  --   event = 'VimEnter',
  --   init = function()
  --     vim.g.matchup_treesitter_enabled = 0
  --   end,
  -- },

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  {
    'w0rp/ale',
    ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]',
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
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        fold = { enable = true },
      }
      vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
    end,
  },

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
