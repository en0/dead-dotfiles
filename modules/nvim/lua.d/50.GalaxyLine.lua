-- require'nvim-web-devicons'.setup()

local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#282c34',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#608B4E',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#569CD6',
  red = '#D16969'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.purple,
                          i = colors.green,
                          v = colors.blue,
                          [''] = colors.blue,
                          V = colors.blue,
                          c = colors.purple,
                          no = colors.magenta,
                          s = colors.orange,
                          S = colors.orange,
                          [''] = colors.orange,
                          ic = colors.yellow,
                          R = colors.red,
                          Rv = colors.red,
                          cv = colors.red,
                          ce=colors.red,
                          r = colors.cyan,
                          rm = colors.cyan,
                          ['r?'] = colors.cyan,
                          ['!']  = colors.red,
                          t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
      return '   NeoVim '
    end,
    separator = ' ',
    separator_highlight = {colors.yellow,function()
      if not buffer_not_empty() then
        return colors.bg
      end
      return colors.bg
    end},
    highlight = {colors.grey,colors.bg,'bold'},
  },
}

gls.left[2]= {
  FileIcon = {
    provider = {'FileIcon'},
    separator = '',
    separator_highlight = {colors.bg,colors.bg},
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  }
}

gls.left[3]= {
  FileName = {
    provider = {'FileName'},
    separator = '',
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.grey,colors.bg}
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[4] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg},
    condition = checkwidth,
  }
}

gls.left[5] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
    condition = checkwidth,
  }
}

gls.left[6] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '   ',
    highlight = {colors.blue,colors.bg},
    condition = checkwidth
  }
}

gls.left[7] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '   ',
    highlight = {colors.orange,colors.bg},
    condition = checkwidth
  }
}

gls.right[1] = {
  GitBranch = {
    provider = {function() return ' ' end, 'GitBranch'},
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg},
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.bg},
  }
}

gls.right[2]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' | ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}

gls.right[3] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.bg},
  },
}
gls.right[4] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' |',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}
gls.right[5] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow,colors.purple},
  }
}

gls.short_line_left[1] = {
  LeftEnd = {
    provider = function() return ' ' end,
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.purple,colors.bg}
  }
}
