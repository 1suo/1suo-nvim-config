-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\isuo1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\isuo1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\isuo1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\isuo1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\isuo1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ChatGPT.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fchatgpt\frequire\0" },
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vignore\a^$\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ale = {
    commands = { "ALEEnable" },
    config = { "vim.cmd[[ALEEnable]]" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\ale",
    url = "https://github.com/w0rp/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\colorbuddy.vim",
    url = "https://github.com/tjdevries/colorbuddy.vim"
  },
  ["completion-nvim"] = {
    after = { "vim-vsnip", "vim-vsnip-integ" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\completion-nvim",
    url = "https://github.com/haorenW1025/completion-nvim"
  },
  dracula = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dracula",
    url = "https://github.com/dracula/vim"
  },
  edge = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\edge",
    url = "https://github.com/sainnhe/edge"
  },
  ["forest.nvim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\forest.nvim",
    url = "https://github.com/skullamortis/forest.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n�\6\0\0\6\0 \0f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\n\0'\4\v\0005\5\20\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\a\0'\4\b\0005\5\21\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\r\0'\4\14\0005\5\22\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\16\0'\4\17\0005\5\23\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\24\0'\4\25\0005\5\30\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\27\0'\4\28\0005\5\31\0B\0\5\1K\0\1\0\1\0\1\fnoremap\1\1\0\1\fnoremap\1\1\0\1\fnoremap\1\24<cmd>HopChar2BC<CR>\6S\1\0\1\fnoremap\1\24<cmd>HopChar2AC<CR>\6s\1\0\1\fnoremap\2\1\0\1\fnoremap\2\1\0\1\fnoremap\2\1\0\1\fnoremap\2\6v\1\0\1\fnoremap\2\23<cmd>HopLineBC<CR>\22<Leader><Leader>k\1\0\1\fnoremap\2\23<cmd>HopLineAC<CR>\22<Leader><Leader>j\1\0\1\fnoremap\2\23<cmd>HopWordAC<CR>\22<Leader><Leader>w\1\0\1\fnoremap\2\23<cmd>HopWordBC<CR>\22<Leader><Leader>b\6n\20nvim_set_keymap\bapi\bvim\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n�\23\0\0\a\0K\0o6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\14\0005\3\15\0=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\3=\3 \0024\3\0\0=\3!\0025\3\"\0005\4#\0=\4$\0035\4&\0005\5%\0=\5'\0045\5(\0005\6)\0=\6*\5=\5+\0045\5,\0005\6-\0=\6*\5=\5.\4=\4/\3=\0030\0024\3\0\0=\0031\0025\0038\0005\0042\0004\5\0\0=\0053\0044\5\0\0=\0054\0044\5\0\0=\0055\0044\5\0\0=\0056\0044\5\0\0=\0057\4=\0049\0035\4:\0=\4;\0035\4=\0005\5<\0=\5/\0045\5>\0=\5?\4=\0040\0034\4\0\0=\4!\3=\3@\0025\3B\0005\4A\0=\4;\0035\4D\0005\5C\0=\5/\4=\0040\3=\3E\0025\3H\0005\4F\0005\5G\0=\5/\4=\0040\3=\3\31\2B\0\2\0016\0\0\0009\0I\0'\2J\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\bcmd\1\0\0\1\0\a\agc\15git_commit\6A\16git_add_all\agr\20git_revert_file\agp\rgit_push\aga\17git_add_file\agg\24git_commit_and_push\agu\21git_unstage_file\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\6.\rset_root\abd\18buffer_delete\t<bs>\16navigate_up\1\0\2\21group_empty_dirs\2\18show_unloaded\2\1\0\2\fenabled\2\20leave_dirs_open\1\15filesystem\26fuzzy_finder_mappings\1\0\4\n<C-p>\19move_cursor_up\v<down>\21move_cursor_down\t<up>\19move_cursor_up\n<C-n>\21move_cursor_down\1\0\0\1\0\n\n<c-x>\17clear_filter\6f\21filter_on_submit\6.\rset_root\a[g\22prev_git_modified\6D\27fuzzy_finder_directory\6H\18toggle_hidden\6#\17fuzzy_sorter\t<bs>\16navigate_up\a]g\22next_git_modified\6/\17fuzzy_finder\24follow_current_file\1\0\2\fenabled\1\20leave_dirs_open\1\19filtered_items\1\0\3\27use_libuv_file_watcher\2\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\26never_show_by_pattern\15never_show\16always_show\20hide_by_pattern\17hide_by_name\1\0\4\16hide_hidden\1\20hide_gitignored\1\18hide_dotfiles\1\fvisible\2\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\0\0\badd\6P\vconfig\1\0\1\14use_float\2\1\2\0\0\19toggle_preview\f<space>\1\0\23\6z\20close_all_nodes\6A\18add_directory\6p\25paste_from_clipboard\6m\tmove\6R\frefresh\6<\16prev_source\6s\16open_vsplit\6x\21cut_to_clipboard\6C\15close_node\6t\16open_tabnew\6S\15open_split\6>\16next_source\6l\18focus_preview\6?\14show_help\n<esc>\vcancel\t<cr>\topen\18<2-LeftMouse>\topen\6q\17close_window\6w\28open_with_window_picker\6y\22copy_to_clipboard\6r\vrename\6c\tcopy\6d\vdelete\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\2\rposition\tleft\nwidth\3(\rcommands\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\rconflict\b\vstaged\b\runstaged\t󰄱\rmodified\5\fignored\b\14untracked\b\frenamed\t󰁕\fdeleted\b✖\nadded\5\tname\1\0\3\14highlight\20NeoTreeFileName\26use_git_status_colors\2\19trailing_slash\1\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\14highlight\20NeoTreeFileIcon\17folder_empty\t󰜌\16folder_open\b\18folder_closed\b\fdefault\6*\vindent\1\0\t\14highlight\24NeoTreeIndentMarker\23expander_highlight\20NeoTreeExpander\22expander_expanded\b\23expander_collapsed\b\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\fpadding\3\1\16indent_size\3\2\14container\1\0\0\1\0\1\26enable_character_fade\2$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\6\26sort_case_insensitive\1\"enable_normal_mode_for_inputs\1\23enable_diagnostics\2\22enable_git_status\2\23popup_border_style\frounded\25close_if_last_window\1\nsetup\rneo-tree\frequire\1\0\2\ttext\t󰌵\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\t \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\t \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\t \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neoai.nvim"] = {
    commands = { "NeoAI", "NeoAIOpen", "NeoAIClose", "NeoAIToggle", "NeoAIContext", "NeoAIContextOpen", "NeoAIContextClose", "NeoAIInject", "NeoAIInjectCode", "NeoAIInjectContext", "NeoAIInjectContextCode" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nneoai\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\neoai.nvim",
    url = "https://github.com/Bryley/neoai.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\3\19autoselect_one\2\23other_win_hl_color\f#e35e4f\20include_current\1\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["seoul256.vim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\seoul256.vim",
    url = "https://github.com/junegunn/seoul256.vim"
  },
  ["space-vim-theme"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\space-vim-theme",
    url = "https://github.com/liuchengxu/space-vim-theme"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-closer"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-closer",
    url = "https://github.com/rstacruz/vim-closer"
  },
  ["vim-colors-paramount"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-colors-paramount",
    url = "https://github.com/owickstrom/vim-colors-paramount"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-js"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-js",
    url = "https://github.com/yuezk/vim-js"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-jsx-pretty",
    url = "https://github.com/maxmellon/vim-jsx-pretty"
  },
  ["vim-matchup"] = {
    after_files = { "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-matchup\\after\\plugin\\matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-vsnip"] = {
    load_after = {
      ["completion-nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    after_files = { "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-vsnip-integ\\after\\plugin\\vsnip_integ.vim" },
    load_after = {
      ["completion-nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "C:\\Users\\isuo1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\yats.vim",
    url = "https://github.com/HerringtonDarkholme/yats.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: ChatGPT.nvim
time([[Config for ChatGPT.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fchatgpt\frequire\0", "config", "ChatGPT.nvim")
time([[Config for ChatGPT.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n�\23\0\0\a\0K\0o6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\14\0005\3\15\0=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\3=\3 \0024\3\0\0=\3!\0025\3\"\0005\4#\0=\4$\0035\4&\0005\5%\0=\5'\0045\5(\0005\6)\0=\6*\5=\5+\0045\5,\0005\6-\0=\6*\5=\5.\4=\4/\3=\0030\0024\3\0\0=\0031\0025\0038\0005\0042\0004\5\0\0=\0053\0044\5\0\0=\0054\0044\5\0\0=\0055\0044\5\0\0=\0056\0044\5\0\0=\0057\4=\0049\0035\4:\0=\4;\0035\4=\0005\5<\0=\5/\0045\5>\0=\5?\4=\0040\0034\4\0\0=\4!\3=\3@\0025\3B\0005\4A\0=\4;\0035\4D\0005\5C\0=\5/\4=\0040\3=\3E\0025\3H\0005\4F\0005\5G\0=\5/\4=\0040\3=\3\31\2B\0\2\0016\0\0\0009\0I\0'\2J\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\bcmd\1\0\0\1\0\a\agc\15git_commit\6A\16git_add_all\agr\20git_revert_file\agp\rgit_push\aga\17git_add_file\agg\24git_commit_and_push\agu\21git_unstage_file\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\6.\rset_root\abd\18buffer_delete\t<bs>\16navigate_up\1\0\2\21group_empty_dirs\2\18show_unloaded\2\1\0\2\fenabled\2\20leave_dirs_open\1\15filesystem\26fuzzy_finder_mappings\1\0\4\n<C-p>\19move_cursor_up\v<down>\21move_cursor_down\t<up>\19move_cursor_up\n<C-n>\21move_cursor_down\1\0\0\1\0\n\n<c-x>\17clear_filter\6f\21filter_on_submit\6.\rset_root\a[g\22prev_git_modified\6D\27fuzzy_finder_directory\6H\18toggle_hidden\6#\17fuzzy_sorter\t<bs>\16navigate_up\a]g\22next_git_modified\6/\17fuzzy_finder\24follow_current_file\1\0\2\fenabled\1\20leave_dirs_open\1\19filtered_items\1\0\3\27use_libuv_file_watcher\2\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\26never_show_by_pattern\15never_show\16always_show\20hide_by_pattern\17hide_by_name\1\0\4\16hide_hidden\1\20hide_gitignored\1\18hide_dotfiles\1\fvisible\2\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\0\0\badd\6P\vconfig\1\0\1\14use_float\2\1\2\0\0\19toggle_preview\f<space>\1\0\23\6z\20close_all_nodes\6A\18add_directory\6p\25paste_from_clipboard\6m\tmove\6R\frefresh\6<\16prev_source\6s\16open_vsplit\6x\21cut_to_clipboard\6C\15close_node\6t\16open_tabnew\6S\15open_split\6>\16next_source\6l\18focus_preview\6?\14show_help\n<esc>\vcancel\t<cr>\topen\18<2-LeftMouse>\topen\6q\17close_window\6w\28open_with_window_picker\6y\22copy_to_clipboard\6r\vrename\6c\tcopy\6d\vdelete\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\2\rposition\tleft\nwidth\3(\rcommands\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\rconflict\b\vstaged\b\runstaged\t󰄱\rmodified\5\fignored\b\14untracked\b\frenamed\t󰁕\fdeleted\b✖\nadded\5\tname\1\0\3\14highlight\20NeoTreeFileName\26use_git_status_colors\2\19trailing_slash\1\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\14highlight\20NeoTreeFileIcon\17folder_empty\t󰜌\16folder_open\b\18folder_closed\b\fdefault\6*\vindent\1\0\t\14highlight\24NeoTreeIndentMarker\23expander_highlight\20NeoTreeExpander\22expander_expanded\b\23expander_collapsed\b\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\fpadding\3\1\16indent_size\3\2\14container\1\0\0\1\0\1\26enable_character_fade\2$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\6\26sort_case_insensitive\1\"enable_normal_mode_for_inputs\1\23enable_diagnostics\2\22enable_git_status\2\23popup_border_style\frounded\25close_if_last_window\1\nsetup\rneo-tree\frequire\1\0\2\ttext\t󰌵\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\t \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\t \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\t \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n�\6\0\0\6\0 \0f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\n\0'\4\v\0005\5\20\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\a\0'\4\b\0005\5\21\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\r\0'\4\14\0005\5\22\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\16\0'\4\17\0005\5\23\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\24\0'\4\25\0005\5\30\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\19\0'\3\27\0'\4\28\0005\5\31\0B\0\5\1K\0\1\0\1\0\1\fnoremap\1\1\0\1\fnoremap\1\1\0\1\fnoremap\1\24<cmd>HopChar2BC<CR>\6S\1\0\1\fnoremap\1\24<cmd>HopChar2AC<CR>\6s\1\0\1\fnoremap\2\1\0\1\fnoremap\2\1\0\1\fnoremap\2\1\0\1\fnoremap\2\6v\1\0\1\fnoremap\2\23<cmd>HopLineBC<CR>\22<Leader><Leader>k\1\0\1\fnoremap\2\23<cmd>HopLineAC<CR>\22<Leader><Leader>j\1\0\1\fnoremap\2\23<cmd>HopWordAC<CR>\22<Leader><Leader>w\1\0\1\fnoremap\2\23<cmd>HopWordBC<CR>\22<Leader><Leader>b\6n\20nvim_set_keymap\bapi\bvim\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vignore\a^$\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\3\19autoselect_one\2\23other_win_hl_color\f#e35e4f\20include_current\1\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'NeoAI', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAI', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAI ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIOpen', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIClose', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIToggle', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIContext', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIContext', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIContext ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIContextOpen', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIContextOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIContextOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIContextClose', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIContextClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIContextClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIInject', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIInject', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIInject ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIInjectCode', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIInjectCode', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIInjectCode ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIInjectContext', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIInjectContext', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIInjectContext ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIInjectContextCode', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIInjectContextCode', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIInjectContextCode ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MarkdownPreview', function(cmdargs)
          require('packer.load')({'markdown-preview.nvim'}, { cmd = 'MarkdownPreview', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'markdown-preview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MarkdownPreview ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ALEEnable', function(cmdargs)
          require('packer.load')({'ale'}, { cmd = 'ALEEnable', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'ale'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ALEEnable ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Dispatch', function(cmdargs)
          require('packer.load')({'vim-dispatch'}, { cmd = 'Dispatch', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dispatch'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Dispatch ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Make', function(cmdargs)
          require('packer.load')({'vim-dispatch'}, { cmd = 'Make', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dispatch'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Make ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Focus', function(cmdargs)
          require('packer.load')({'vim-dispatch'}, { cmd = 'Focus', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dispatch'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Focus ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Start', function(cmdargs)
          require('packer.load')({'vim-dispatch'}, { cmd = 'Start', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dispatch'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Start ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType c ++once lua require("packer.load")({'ale'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'ale'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'ale'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'ale'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'ale'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'ale'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'ale'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'ale'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType racket ++once lua require("packer.load")({'ale'}, { ft = "racket" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'ale'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'ale'}, { ft = "vim" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
