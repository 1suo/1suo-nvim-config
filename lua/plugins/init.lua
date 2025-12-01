-- lua/plugins/init.lua
return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    config = function()
      local orgfiles_path = os.getenv('ORGFILES') or '~/memo/orgfiles';
      require('orgmode').setup({
	win_split_mode = 'auto',
	notifications = {
	  enabled = true,
	},
	org_agenda_files = {orgfiles_path .. '/**/*'},
	org_default_notes_file = orgfiles_path .. '/refile.org',
	org_deadline_warning_days = 7,

	org_todo_keywords = {'INBOX(i)', 'TODO(t)', 'PROGRESS(p)', 'WAITING(w)', '|', 'DONE(d)', 'CANCELLED(c)', '( )'},
	org_todo_keyword_faces = {
	  INBOX = ':foreground #5555FF :weight bold',
	  TODO = ':foreground #FF0000 :weight bold',
	  PROGRESS = ':foreground #FFFF00 :weight bold',
	  WAITING = ':foreground #FFA500 :weight bold',
	  DONE = ':foreground #00FF00 :weight bold',
	  CANCELLED = ':foreground #888888 :weight bold',
	},

	mappings = {
	  global = {
	    org_agenda = '<leader>a',
	    org_capture = '<leader>c',
	  },
    	  org = {
	    org_todo = '<leader>o;',
	    org_set_tags_command = '<leader>ot',
	    org_add_note = '<leader>on',
	    org_refile = '<leader>or',
	    org_priority = '<leader>op',
	    org_toggle_heading = '<leader>oh',
	    org_toggle_checkbox = '<leader>ox',
	    org_deadline = '<leader>od',
	    org_schedule = '<leader>os',
	    org_time_stamp = '<leader>oW',
	    org_time_stamp_inactive = '<leader>ow',
	    org_timestamp_up_day = 'U',
	    org_timestamp_down_day = 'D',
	    org_timestamp_up = '<C-a>',
	    org_timestamp_down = '<C-x>',
	    org_change_date = '<leader>o.',
	    org_insert_link = '<leader>ol',
	    org_open_at_point = '<leader>og',
	    org_archive_subtree = '<leader>oz',

	    org_clock_in = '<leader>oi',
	    org_clock_out = '<leader>oo',
	    org_clock_cancel = '<leader>oq',
	    org_clock_goto = '<leader>oj',
	    org_set_effort = '<leader>oe',
	    org_babel_tangle = '<leader>ob',
	  },
	  agenda = {
	    org_agenda_todo = '<leader>o;',
	    org_agenda_set_tags_command = '<leader>ot',
	    org_agenda_add_note = '<leader>on',
	    org_agenda_refile = '<leader>or',
	    org_agenda_priority = '<leader>op',
	    org_agenda_schedule = '<leader>os',
	    org_agenda_deadline = '<leader>od',
	    org_agenda_archive = '<leader>oz',
	    org_agenda_open_at_point = '<leader>og',
	    org_agenda_goto_date = 'D',
	    org_agenda_preview = 'P',
	    org_agenda_later = 'L',
	    org_agenda_earlier = 'H',
	  },
	  capture = {
	    org_capture_finalize = '<leader>ok',
	    org_capture_kill = '<leader>oq',
	  },
	  note = {
	    org_note_finalize = '<leader>ok',
	    org_note_kill = '<leader>oq',
	  },
	},

	-- Create a command and keybinding to quickly create a new org file
	vim.api.nvim_create_user_command(
	  'NewOrgFile',
	  function(opts)
	    local file_name = opts.args
	    vim.cmd('e ~/memo/orgfiles/' .. file_name .. '.org')
	  end,
	  { nargs = 1 }
	),
	vim.api.nvim_set_keymap('n', '<leader>of', ':NewOrgFile ', { noremap = true, silent = false }),

	-- Generate link to current file and line number to insert into org file
	vim.api.nvim_create_user_command(
	  'OrgLink',
	  function()
	    local file_path = vim.fn.expand('%:p')
	    local line_number = vim.fn.line('.')
	    local link = '[[' .. 'file://' .. file_path .. '::' .. line_number .. '][' .. vim.fn.fnamemodify(file_path, ':t') .. ':' .. line_number .. ']]'
	    vim.fn.setreg('+', link)
	    print('Org link copied to clipboard: ' .. link)
	  end,
	  {}
	),
	vim.api.nvim_set_keymap('n', '<leader>fl', ':OrgLink<CR>', { noremap = true, silent = true }),

	org_capture_templates = {
    	  t = {
	    description = 'Task',
	    template = '* INBOX %?\n  %a\n  %U\n  ',
	    target = orgfiles_path .. '/tasks.org',
	  },
	  j = {
	    description = 'Journal',
	    template = '* %U %?\n',
	    target = orgfiles_path .. '/journal/%<%Y-%m>.org'
	  },
	  r = {
	    description = 'Refile',
	    template = '* %?\n  %a\n  %U\n  ',
	    target = orgfiles_path .. '/refile.org',
	  }
	},

	org_agenda_custom_commands = {
	  c = {
	    description = 'Combined view', -- Description shown in the prompt for the shortcut
	    types = {
	      {
		type = 'tags',
		match = 'TODO="INBOX"|TODO="TODO"|TODO="PROGRESS"|TODO="WAITING"|TODO="DONE"|TODO="CANCELLED"',
		org_agenda_overriding_header = 'TODO',
	      },
	      {
		type = 'agenda',
		org_agenda_overriding_header = 'Week overview',
		org_agenda_span = 'week', -- 'week' is default, so it's not necessary here, just an example
		org_agenda_start_on_weekday = 1, -- Start on Monday
	      },
	      {
		type = 'tags',
		org_agenda_overriding_header = 'Journal',
		org_agenda_files = {orgfiles_path .. '/journal/' .. os.date('%Y-%m') .. '.org'},
	      },
	      {
		type = 'tags',
		org_agenda_overriding_header = 'Refile',
		org_agenda_files = {orgfiles_path .. '/refile.org'},
	      }
	    }
	  },
	  j = {
	    description = 'Journal view',
	    types = {
	      {
		type = 'tags',
		org_agenda_overriding_header = 'Journal',
		org_agenda_files = {orgfiles_path .. '/journal/*.org'},
	      }
	    }
	  },
	  f = {
	    description = 'All files',
	    types = {
	      {
		type = 'tags',
		org_agenda_overriding_header = 'All files',
		org_agenda_files = {orgfiles_path .. '/**/*'},
		match = '-TODO="INBOX"-TODO="TODO"-TODO="PROGRESS"-TODO="WAITING"-TODO="DONE"-TODO="CANCELLED"',
	      }
	    }
	  },
	  -- combined view, but for current project folder, not org_agenda_files
	  p = {
	    description = 'Project view',
	    types = {
	      {
		type = 'tags',
		match = 'TODO="INBOX"|TODO="TODO"|TODO="PROGRESS"|TODO="WAITING"|TODO="DONE"|TODO="CANCELLED"',
		org_agenda_overriding_header = 'Project TODO',
		org_agenda_files = {vim.fn.getcwd() .. '/**/*'},
	      },
	      {
		type = 'agenda',
		org_agenda_overriding_header = 'Week overview',
		org_agenda_span = 'week',
		org_agenda_start_on_weekday = 1,
		org_agenda_files = {vim.fn.getcwd() .. '/**/*'},	
	      },
	      types = {
		{
		  type = 'tags',
		  org_agenda_overriding_header = 'Planning',
		  match = 'PLAN',
		  org_agenda_files = {vim.fn.getcwd() .. '/**/*'},
		}
	      }
	    }
	  }
	},
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

      vim.keymap.set("n", "<leader>fr", require("telescope").extensions.orgmode.refile_heading)
      vim.keymap.set("n", "<leader>fh", require("telescope").extensions.orgmode.search_headings)
      vim.keymap.set("n", "<leader>fl", require("telescope").extensions.orgmode.insert_link)
      vim.keymap.set("n", "<leader>ft", require("telescope").extensions.orgmode.search_tags)
    end,
  },

  -- nnn file manager
  { 
    'mcchrish/nnn.vim',
      config = function()
	vim.api.nvim_set_keymap('n', '<Leader>np', [[:NnnPicker<CR>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<Leader>ne', [[:NnnExplorer<CR>]], { noremap = true, silent = true })
      end,
  },

  -- Auto completion, formatting, and linting
  { 
    'neoclide/coc.nvim', 
    branch = 'release',
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>pf', [[:call CocAction('runCommand', 'prettier.forceFormatDocument')<CR>]], { noremap = true, silent = true })
    end,
  },

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

  -- nvim-cmp is an alternative to coc.nvim for auto completion
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
          ['<C-e>'] = cmp.mapping.complete(),
          ['<C-q>'] = cmp.mapping.abort(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
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

  {
    'jiangmiao/auto-pairs',
    config = function()
      vim.g.AutoPairsMultilineClose = 0
    end,
  },

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
      vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function()
	  vim.opt_local.foldenable = false
	end,
      })

      vim.api.nvim_set_keymap('n', '<Leader>ff', [[:Telescope find_files<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>fg', [[:Telescope live_grep<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>fb', [[:Telescope buffers<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>fc', [[:Telescope colorscheme<CR>]], { noremap = true, silent = true })
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
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>lg', [[:LazyGit<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>lf', [[:LazyGitFilter<CR>]], { noremap = true, silent = true })
    end,
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
