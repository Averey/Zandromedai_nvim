
local function setup(configs)
  local c = configs.colors
  local endOfBuffer = {
    fg = configs.show_end_of_buffer and c.visual or c.bg,
  }

  return {
    Normal = { fg = c.fg, bg = c.bg, },
    NormalFloat = { fg = c.fg, bg = c.bg, },
    Comment = { fg = c.comment, italic = configs.italic_comment },
    Constant = { fg = c.spring_green },
    String = { fg = c.orange},
    Character = { fg = c.white },
    Number = { fg = c.spring_green },
    Boolean = { fg = c.spring_green },
    Float = { fg = c.white },
    FloatBorder = { fg = c.green },
    Operator = { fg = c.orange },
    Keyword = { fg = c.green },
    Keywords = { fg = c.green },
    Identifier = { fg = c.green },
    Function = { fg = c.yellow },
    Statement = { fg = c.white },
    Conditional = { fg = c.white },
    Repeat = { fg = c.white },
    Label = { fg = c.green },
    Exception = { fg = c.white },
    PreProc = { fg = c.yellow },
    Include = { fg = c.green },
    Define = { fg = c.green },
    Title = { fg = c.white },
    Macro = { fg = c.green },
    PreCondit = { fg = c.green },
    Type = { fg = c.bright_green },
    StorageClass = { fg = c.white },
    Structure = { fg = c.white },
    TypeDef = { fg = c.white },
    Special = { fg = c.white },
    SpecialCommment = { fg = c.white },
    Error = { fg = c.bright_red },
    Todo = { fg = c.spring_green },
    Underlined = { fg = c.bright_green },

    Cursor = { reverse = true },
    CursorLineNr = { fg = c.green, bold = true},
    LineNr = { fg = c.dark_gray, },

    SignColumn = { bg = c.bg },

    Conceal = { fg = c.comment },
    CursorColumn = { bg = c.black },
    CursorLine = { bg = c.selection },
    ColorColumn = { bg = c.selection },

    StatusLine = { fg = c.white, bg = c.black },
    StatusLineNC = { fg = c.comment },
    StatusLineTerm = { fg = c.white, bg = c.black  },
    StatusLineTermNc = { fg = c.comment },

    Directory = { fg = c.green },
    DiffAdd = { fg = c.bg, bg = c.green },
    DiffChange = { fg = c.orange },
    DiffDelete = { fg = c.red },
    DiffText = { fg = c.comment },


    ErrorMsg = { fg = c.bright_red, },
    VertSplit = { fg = c.black, },
    WinSeparator = { fg = c.black, },
    Folded = { fg = c.comment, },
    FoldColumn = {},
    Search = { fg = c.black, bg = c.orange, },
    IncSearch = { fg = c.orange, bg = c.comment, },
    MatchParen = { fg = c.orange },
    NonText = { fg = c.nontext, },

    PmenuMathcSel = { fg = c.green },
    Pmenu = { fg = c.white, bg = c.bg, },
    PmenuSel = { fg = c.green, bg = c.selection, },
    PmenuSbar = { bg = c.green, },
    PmenuThumb = { bg = c.selection, },

    Question = { fg = c.green, },
    QuickFixLine = { fg = c.black, bg = c.yellow, },
    SpecialKey = { fg = c.nontext, },

    SpellBad = { fg = c.bright_red, underline = true, },
    SpellCap = { fg = c.yellow, },
    SpellLocal = { fg = c.yellow, },
    SpellRare = { fg = c.yellow, },

    TabLine = { fg = c.comment, },
    TabLineSel = { fg = c.white, },
    TabLineFill = { bg = c.bg, },
    Terminal = { fg = c.white, bg = c.black, },
    Visual = { bg = c.visual, },
    VisualNOS = { fg = c.visual, },
    WarningMsg = { fg = c.yellow, },
    WildMenu = { fg = c.black, bg = c.white, },

    EndOfBuffer = endOfBuffer,


    -- TreeSitter
    -- ['@error'] = "Error",
    ['@error'] = { fg = c.bright_red },
    ['@punctuation.delimiter'] = { fg = c.fg, },
    ['@punctuation.bracket'] = { fg = c.fg, },
    ['@markup.list'] = { fg = c.bright_green, },

    ['@constant'] = { fg = c.orange },
    ['@constant.builtin'] = { fg = c.orange, },
    ['@markup.link.label.symbol'] = { fg = c.orange, },

    ['@constant.macro'] = { fg = c.orange, },
    ['@string.regexp'] = { fg = c.red, },
    ['@string'] = { fg = c.orange, },
    ['@string.escape'] = { fg = c.orange, },
    ['@string.special.symbol'] = { fg = c.orange, },
    ['@character'] = { fg = c.white },
    ['@number'] = { fg = c.white },
    ['@boolean'] = { fg = c.spring_green },
    ['@number.float'] = { fg = c.spring_green },
    ['@annotation'] = { fg = c.yellow, },
    ['@attribute'] = { fg = c.green, },
    ['@module'] = { fg = c.orange, },

    ['@function.builtin'] = { fg = c.orange, },
    ['@function'] = { fg = c.yellow, },
    ['@function.macro'] = { fg = c.white, },
    ['@variable.parameter'] = { fg = c.green, },
    ['@variable.parameter.reference'] = { fg = c.orange, },
    ['@function.method'] = { fg = c.green, },
    ['@variable.member'] = { fg = c.green, },
    ['@property'] = { fg = c.green, },
    ['@constructor'] = { fg = c.green, },

    ['@keyword.conditional'] = { fg = c.white, },
    ['@keyword.repeat'] = { fg = c.white, },
    ['@label'] = { fg = c.green, },

    ['@keyword'] = { fg = c.green, },
    ['@keyword.function'] = { fg = c.green, },
    ['@keyword.function.ruby'] = { fg = c.green, },
    ['@keyword.operator'] = { fg = c.orange, },
    ['@operator'] = { fg = c.orange, },
    ['@keyword.exception'] = { fg = c.orange, },
    ['@type'] = { fg = c.bright_green, },
    ['@type.builtin'] = { fg = c.bright_green, italic = true, },
    ['@type.qualifier'] = { fg = c.white, },
    ['@structure'] = { fg = c.white, },
    ['@keyword.include'] = { fg = c.green, },

    ['@variable'] = { fg = c.white, },
    ['@variable.builtin'] = { fg = c.green, },

    -- ['@markup'] = { fg = c.orange, },
    -- ['@markup.strong'] = { fg = c.orange, bold = true, },     -- bold
    -- ['@markup.emphasis'] = { fg = c.yellow, italic = true, }, -- italic
    -- ['@markup.underline'] = { fg = c.orange, },
    -- ['@markup.heading'] = { fg = c.pink, bold = true, },        -- title
    -- ['@markup.raw'] = { fg = c.yellow, },                 -- inline code
    -- ['@markup.link.url'] = { fg = c.yellow, italic = true, },      -- urls
    -- ['@markup.link'] = { fg = c.orange, bold = true, },

    ['@tag'] = { fg = c.green, },
    ['@tag.attribute'] = { fg = c.green, },
    ['@tag.delimiter'] = { fg = c.white, },

    -- Cmp
    CmpItemAbbr = { fg = c.white, bg = c.bg },
    CmpItemKind = { fg = c.green, bg = c.bg },
    CmpItemKindMethod = { link = "@function.method" },
    CmpItemKindText = { link = "@markup" },
    CmpItemKindFunction = { link = "@function" },
    CmpItemKindConstructor = { link = "@type" },
    CmpItemKindVariable = { link = "@variable" },
    CmpItemKindClass = { link = "@type" },
    CmpItemKindInterface = { link = "@type" },
    CmpItemKindModule = { link = "@module" },
    CmpItemKindProperty = { link = "@property" },
    CmpItemKindOperator = { link = "@operator" },
    CmpItemKindReference = { link = "@variable.parameter.reference" },
    CmpItemKindUnit = { link = "@variable.member" },
    CmpItemKindValue = { link = "@variable.member" },
    CmpItemKindField = { link = "@variable.member" },
    CmpItemKindEnum = { link = "@variable.member" },
    CmpItemKindKeyword = { link = "@keyword" },
    CmpItemKindSnippet = { link = "@markup" },
    CmpItemKindColor = { link = "DevIconCss" },
    CmpItemKindFile = { link = "TSURI" },
    CmpItemKindFolder = { link = "TSURI" },
    CmpItemKindEvent = { link = "@constant" },
    CmpItemKindEnumMember = { link = "@variable.member" },
    CmpItemKindConstant = { link = "@constant" },
    CmpItemKindStruct = { link = "@structure" },
    CmpItemKindTypeParameter = { link = "@variable.parameter" },


    -- Telescope
    TelescopePromptBorder = { fg = c.green, },
    TelescopeResultsBorder = { fg = c.green, },
    TelescopePreviewBorder = { fg = c.green, },
    TelescopeSelection = { fg = c.white, bg = c.selection, },
    TelescopeMultiSelection = { fg = c.orange, bg = c.selection, },
    TelescopeNormal = { fg = c.fg, bg = c.bg, },
    TelescopeMatching = { fg = c.green, },
    TelescopePromptPrefix = { fg = c.orange, },
    TelescopeResultsDiffDelete = { fg = c.red },
    TelescopeResultsDiffChange = { fg = c.yellow },
    TelescopeResultsDiffAdd = { fg = c.green },


    -- NvimTree
    NvimTreeNormal = { fg = c.fg, bg = c.menu, },
    NvimTreeVertSplit = { fg = c.bg, bg = c.bg, },
    NvimTreeRootFolder = { fg = c.fg, bold = true, },
    NvimTreeGitDirty = { fg = c.yellow, },
    NvimTreeGitNew = { fg = c.bright_green, },
    NvimTreeImageFile = { fg = c.spring_green, },
    NvimTreeFolderIcon = { fg = c.green, },
    -- NvimTreeFolderIcon = { fg = c.orange, },
    NvimTreeIndentMarker = { fg = c.nontext, },
    NvimTreeEmptyFolderName = { fg = c.comment, },
    NvimTreeFolderName = { fg = c.fg, },
    NvimTreeSpecialFile = { fg = c.bright_green, underline = true, },
    NvimTreeOpenedFolderName = { fg = c.fg, },
    NvimTreeCursorLine = { bg = c.selection, },
    NvimTreeIn = { bg = c.selection, },

      -- NeoTree
      -- NeoTreeNormal = { fg = c.fg, bg = c.menu, },
      -- NeoTreeNormalNC = { fg = c.fg, bg = c.menu, },
      -- NeoTreeDirectoryName = { fg = c.fg },
      -- NeoTreeGitUnstaged = { fg = c.bright_magenta },
      -- NeoTreeGitModified = { fg = c.bright_magenta },
      -- NeoTreeGitUntracked = { fg = c.bright_green },
      -- NeoTreeDirectoryIcon = { fg = c.orange },
      -- NeoTreeIndentMarker = { fg = c.nontext },
      -- NeoTreeDotfile = { fg = c.comment },

  }
end

return {
  setup = setup,
}
