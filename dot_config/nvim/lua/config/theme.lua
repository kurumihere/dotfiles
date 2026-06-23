local function is_dark_mode()
  local ok, result = pcall(vim.fn.system, 'gsettings get org.gnome.desktop.interface color-scheme')
  if ok then
    return result:match('prefer%-dark') ~= nil
  end
  local ok2, result2 = pcall(vim.fn.system, 'gsettings get org.gnome.desktop.interface gtk-theme')
  if ok2 then
    return result2:lower():match('dark') ~= nil
  end
  local f = io.open(os.getenv('HOME') .. '/.config/gtk-4.0/settings.ini', 'r')
  if f then
    for line in f:lines() do
      if line:match('gtk%-application%-prefer%-dark%-theme=1') then
        f:close()
        return true
      end
    end
    f:close()
  end
  return true
end

vim.g.airline_theme = 'ppurpp'
vim.o.background = is_dark_mode() and 'dark' or 'light'
require('ppurpp').setup({
  italic = { comments = true, strings = false, emphasis = false, folds = false, operators = false },
  transparent_mode = true,
})
vim.cmd.colorscheme('ppurpp')
