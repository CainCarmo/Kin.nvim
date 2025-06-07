---The function creates a folder at the specified path if it does not already exist.
---@param path string The path to the folder to create.
---@return boolean
local function create(path)
  return os.execute("mkdir -p " .. path) == true
end

return {
  create = create,
}
