local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
end

-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
colorizer.setup({
	"css",
	"javascript",
  css = {css = true, RRGGBBAA = true},
	html = { names = false }, -- Disable parsing "names" like Blue or Gray
})

-- options
--  RGB      = true;         -- #RGB hex codes
-- 	RRGGBB   = true;         -- #RRGGBB hex codes
-- 	names    = true;         -- "Name" codes like Blue
-- 	RRGGBBAA = false;        -- #RRGGBBAA hex codes
-- 	rgb_fn   = false;        -- CSS rgb() and rgba() functions
-- 	hsl_fn   = false;        -- CSS hsl() and hsla() functions
-- 	css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
-- 	css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
-- 	-- Available modes: foreground, background
-- 	mode     = 'background'; -- Set the display mode.
