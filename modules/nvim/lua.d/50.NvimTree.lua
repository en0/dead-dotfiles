require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = { '.git', 'node_modules', '.cache', '__pycache__', 'venv', '.venv', 'docker_venv' }
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = {}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {}
    }
  },
  renderer = {
    add_trailing = true,
    root_folder_modifier = ':~',
    highlight_git = true,
    indent_markers = { enable = true },
    special_files = { 'README.md', 'Makefile', 'MAKEFILE' },
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "ﰴ",
          untracked = "",
          deleted = "",
          ignored = "﯏"
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        --lsp = {
          --hint = "",
          --info = "",
          --warning = "",
          --error = "",
        --}
      }
    }
  }
}
