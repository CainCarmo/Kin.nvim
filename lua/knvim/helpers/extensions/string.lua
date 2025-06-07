---The function checks if a string is null or empty and returns a boolean value.
---@param value string | nil The string value to check
---@return boolean
_G.string.isNullOrEmpty = function(value)
  return value == nil or value == ""
end
