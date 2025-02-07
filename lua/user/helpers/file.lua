---@param path string
---@return boolean
local function exists(path)
  local file = io.open(path, "r")

  return file ~= nil and file:close() or false
end

---@param path string
---@param content string
---@param flag? "w" | "a" | "w+" | "a+" | "wb" | "ab" | "w+b" | "a+b"
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
