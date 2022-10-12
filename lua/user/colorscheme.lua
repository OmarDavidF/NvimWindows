-- themes:
-- nightfox
-- terafox
-- dracula
-- catppuccin
-- onedark plus
-- onedark depp
-- onedark cool
-- Para cambiar estilo de material utilizarr let g:material_style = "deep ocean"
-- tokyonight-moon
-- tokyonight-night
-- colorscheme default
-- set background=dark

vim.cmd([[
try
  colorscheme nightfox
  catch /^Vim\%((\a\+)\)\=:E185/
endtry
]])

-- configuración de aspecto para onedark
-- require('onedark').setup {
--     style = 'cool' -- deep
-- }

-- configuración de aspecto para catppuccin
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- require("catppuccin").setup()
-- vim.api.nvim_command "colorscheme catppuccin"
