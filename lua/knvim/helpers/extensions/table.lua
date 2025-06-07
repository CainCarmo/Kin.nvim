---The function merges a list of values into a table and returns the modified table.
---@param target tablelib The table to merge into
---@param list table The list of values to merge into the target table
---@return tablelib
_G.table.merge = function(target, list)
  for _, v in pairs(list) do
    table.insert(target, v)
  end

  return target
end
