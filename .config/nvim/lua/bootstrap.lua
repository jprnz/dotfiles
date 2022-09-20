fn = vim.fn
local create_cache_dirs = function()
  local dirs = {
    vim.g.cache_dir .. '/backup',
    vim.g.cache_dir .. '/session',
    vim.g.cache_dir .. '/swap',
    vim.g.cache_dir .. '/tags',
    vim.g.cache_dir .. '/undo',
  }

  for _, v in pairs(dirs) do
    if fn.isdirectory(v) == 0 then
      os.execute('mkdir -p ' .. v)
    end
  end
end

if fn.isdirectory(cache_dir) == 0 then
  create_cache_dirs()
end

