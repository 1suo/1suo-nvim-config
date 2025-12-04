local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local entry_display = require('telescope.pickers.entry_display')

local M = {}

M.org_todos = function(opts)
  opts = opts or {}
  local results = {}
  
  -- Define TODO state colors
  local todo_colors = {
    TODO = 'TelescopeResultsNumber',
    NEXT = 'TelescopeResultsFunction',
    DONE = 'TelescopeResultsString',
    WAITING = 'TelescopeResultsComment',
    CANCELLED = 'TelescopeResultsComment'
  }
  
  local org_dir = vim.fn.getcwd()
  local org_files = vim.fn.glob(org_dir .. '/**/*.org', false, true)
  
  for _, filepath in ipairs(org_files) do
    local file = io.open(filepath, 'r')
    if file then
      local lnum = 0
      
      for line in file:lines() do
        lnum = lnum + 1
        local todo_state, headline, tags = line:match('^%*+%s+([A-Z]+)%s+(.-)%s*(:.*)$')
        if not todo_state then
          todo_state, headline = line:match('^%*+%s+([A-Z]+)%s+(.+)$')
          tags = ''
        end
        
        if todo_state and headline then
          table.insert(results, {
            filename = filepath,
            lnum = lnum,
            text = headline,
            todo_state = todo_state,
            tags = tags,
          })
        end
      end
      file:close()
    end
  end
  
  local displayer = entry_display.create({
    separator = ' ',
    items = {
      { width = 12 },
      { remaining = true },
    }
  })
  
  pickers.new(opts, {
    prompt_title = "Org TODOs",
    finder = finders.new_table({
      results = results,
      entry_maker = function(entry)
        return {
          value = entry,
          display = function(e)
            return displayer({
              { e.value.todo_state, todo_colors[e.value.todo_state] or 'Normal' },
              { string.format('%s:%d: %s %s', 
                  vim.fn.fnamemodify(e.value.filename, ':~:.'),
                  e.value.lnum,
                  e.value.text,
                  e.value.tags) }
            })
          end,
          ordinal = entry.text,
          filename = entry.filename,
          lnum = entry.lnum,
        }
      end
    }),
    sorter = conf.generic_sorter(opts),
    previewer = conf.file_previewer(opts),
  }):find()  -- ADDED :find() and closing properly
end

M.project_files = function(opts)
  opts = opts or {}
  local results = {}
  
  local cwd = vim.fn.getcwd()
  
  -- Search for specific files only
  local find_cmd = string.format(
    "find %s -type f \\( -name '.neolit.json' -o -name 'CONTEXT.md' -o -name 'TODO.org' \\) 2>/dev/null",
    vim.fn.shellescape(cwd)
  )
  
  local output = vim.fn.systemlist(find_cmd)
  
  for _, filepath in ipairs(output) do
    if filepath ~= '' then
      table.insert(results, {
        filename = filepath,
        display = vim.fn.fnamemodify(filepath, ':.'),
      })
    end
  end
  
  -- Also add everything in neolit/ folder
  local neolit_cmd = string.format(
    "find %s/neolit -type f 2>/dev/null",
    vim.fn.shellescape(cwd)
  )
  
  local neolit_files = vim.fn.systemlist(neolit_cmd)
  for _, filepath in ipairs(neolit_files) do
    if filepath ~= '' then
      table.insert(results, {
        filename = filepath,
        display = vim.fn.fnamemodify(filepath, ':.'),
      })
    end
  end
  
  pickers.new(opts, {
    prompt_title = "Project Files (" .. #results .. ")",
    finder = finders.new_table({
      results = results,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.display,
          ordinal = entry.display,
          filename = entry.filename,
        }
      end
    }),
    sorter = conf.generic_sorter(opts),
    previewer = conf.file_previewer(opts),
  }):find()
end

return M

