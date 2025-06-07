---The function checks if a file exists at the specified path and returns a boolean value.
---@param path string The path to the file to check for existence.
---@return boolean
local function exists(path)
  local file = io.open(path, "r")

  return file ~= nil and file:close() or false
end

---The function writes content to a file at the specified path.
---@param path string The path to the file to write to.
---@param content string The content to write to the file.
---@param flag? "w" | "a" | "w+" | "a+" | "wb" | "ab" | "w+b" | "a+b" The file open mode.
---@return nil
local function write(path, content, flag)
  local file = nil

  if exists(path) then
    file = flag ~= nil and io.open(path, flag) or false
  else
    file = io.open(path, flag or "w")
  end

  if file then
    file:write(content)
    file:close()
  end
end

return {
  exists = exists,
  write = write,
}
