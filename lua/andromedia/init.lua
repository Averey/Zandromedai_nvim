-- https://speakerdeck.com/cocopon/creating-your-lovely-color-scheme
-- inspired from dracula colortheme and zen andromedia

local o = vim.o
local g = vim.g
local cmd = vim.cmd
local nvim_set_hl = vim.api.nvim_set_hl
local tbl_deep_extend = vim.tbl_deep_extend

local DEFAULT_CONFIG = {
   italic_comment = false,
   transparent_bg = false,
   show_end_of_buffer = false,
   lualine_bg_color = nil,
   colors = require("andromedia.palette"),
   overrides = {},
   theme = 'andromedia_nvim'
}

local TRANSPARENTS = {
  "Normal",
  "SignColumn",
  "NvimTreeNormal",
  "NvimTreeVertSplit",
  "NeoTreeNormal",
  "NeoTreeNormalNC"
}

local function apply_term_colors(colors)
  g.terminal_color_0 = colors.black
  g.terminal_color_1 = colors.red
  g.terminal_color_2 = colors.green
  g.terminal_color_3 = colors.yellow
  g.terminal_color_4 = colors.green
  g.terminal_color_5 = colors.white
  g.terminal_color_6 = colors.yellow
  g.terminal_color_7 = colors.white

  g.terminal_color_8 = colors.black
  g.terminal_color_9 = colors.red
  g.terminal_color_10 = colors.green
  g.terminal_color_11 = colors.yellow
  g.terminal_color_12 = colors.green
  g.terminal_color_13 = colors.white
  g.terminal_color_14 = colors.yellow
  g.terminal_color_15 = colors.white

  g.terminal_color_background = colors.bg
  g.terminal_color_foreground = colors.fg
end


--- override colors with colors
local function override_groups(groups, overrides)
   for group, setting in pairs(overrides) do
      groups[group] = setting
   end
   return groups
end

---apply colorscheme
local function apply(configs)
   local colors = configs.colors
   apply_term_colors(colors)
   local groups = require('andromedia.groups').setup(configs)

   -- apply transparents
   if configs.transparent_bg then
      for _, group in ipairs(TRANSPARENTS) do
         groups[group].bg = nil
      end
   end

   if type(configs.overrides) == "table" then
      groups = override_groups(groups, configs.overrides)
   elseif type(configs.overrides) == "function" then
      groups = override_groups(groups, configs.overrides(colors))
   end

   -- set defined highlights
   for group, setting in pairs(groups) do
      nvim_set_hl(0, group, setting)
   end
end

local user_configs = {}

--- get  configs
local function get_configs()
   local configs = DEFAULT_CONFIG

  configs.theme = 'andromedia_nvim'
  configs.colors = require('andromedia.palette')

   -- if g.colors_name == 'dracula-soft' then
   --    configs.theme = 'dracula-soft'
   --    configs.colors = require('dracula.palette-soft')
   -- elseif g.colors_name == 'dracula' then
   --    configs.theme = 'dracula'
   --    configs.colors = require('dracula.palette')
   -- end

   configs = tbl_deep_extend("force", configs, user_configs)

   return configs
end


---setup andromedia colorscheme
local function setup(configs)
   if type(configs) == "table" then
      user_configs = configs
   end
end

---load andromedia colorscheme
---@param theme string?
local function load(theme)
   if vim.fn.has("nvim-0.7") ~= 1 then
      vim.notify("andromedia_nvim: you must use neovim 0.7 or higher")
      return
   end

   -- reset colors
   if g.colors_name then
      cmd("hi clear")
   end

   if vim.fn.exists("syntax_on") then
      cmd("syntax reset")
   end

   o.background = "dark"
   o.termguicolors = true
   g.colors_name = theme or 'andromedia'

   apply(get_configs())
end

return {
  load = load,
  setup = setup,
  configs = get_configs,
  colors = function () return get_configs().colors end,
}
