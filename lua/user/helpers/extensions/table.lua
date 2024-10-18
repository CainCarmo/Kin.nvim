---@param tbl table
---@param list table
---@return tablelib
_G.table.merge = function(tbl, list)
  for _, v in pairs(list) do
    table.insert(tbl, v)
  end

  return tbl
end