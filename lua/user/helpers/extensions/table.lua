---Merge two tables and returns the result.
---@param target tablelib
---@param list tablelib
---@return tablelib
_G.table.merge = function(target, list)
  for _, v in pairs(list) do
    table.insert(target, v)
  end

  return target
end