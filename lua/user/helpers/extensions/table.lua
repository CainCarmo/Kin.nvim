---@param target tablelib
---@param list table
---@return tablelib
_G.table.merge = function(target, list)
  for _, v in pairs(list) do
    table.insert(target, v)
  end

  return target
end
