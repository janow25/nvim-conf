local M = {}

local img_dir = vim.fn.expand("~/.config/nvim/img")

local function get_random_image_path()
  local images = vim.fn.globpath(img_dir, "*", false, true)
  if #images == 0 then
    return nil
  end
  math.randomseed(os.time())
  return images[math.random(1, #images)]
end

function M.get_ascii_image()
  local img_path = get_random_image_path()
  if not img_path then
    return "No images found in " .. img_dir
  end
  local cmd = string.format("ascii-image-converter '%s' -C -c -d 80,40", img_path)  
  local ascii = vim.fn.system(cmd)
  return ascii
end

function M.get_ascii_image_str()
  local img_path = get_random_image_path()
  if not img_path then
    return "No images found in " .. img_dir
  end
  local cmd = string.format("ascii-image-converter '%s' -C -c -d 60,30", img_path)  
  return cmd
end


-- Converts string to a table of lines
function M.get_ascii_header()
  local ascii_image = M.get_ascii_image()
  local lines = {}
  for line in ascii_image:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end
  return lines
end

return M
