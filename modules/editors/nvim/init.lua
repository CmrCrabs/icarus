vim.o.number = true
vim.o.wrap = false
vim.g.mapleader = " "
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.termguicolors = true

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>r', ':restart<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>wq', ':wqa<CR>')
vim.keymap.set('n', '<C-w>', ':bd<CR>')

vim.pack.add({
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/goolord/alpha-nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvchad/nvim-colorizer.lua" },
  { src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://github.com/l3mon4d3/luasnip" },
  { src = "https://github.com/windwp/nvim-autopairs" },
})

require "kanagawa".setup({
  transparent = true,
  terminalColors = true,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  }
})
vim.cmd("colorscheme kanagawa-dragon")

require "luasnip".setup()
require "nvim-autopairs".setup()
require("colorizer").setup()
require("mini.pick").setup()
require("ibl").setup()


require("bufferline").setup()
vim.cmd [[
    hi BufferLineFill guibg=NONE ctermbg=NONE
    hi BufferLineBackground guibg=NONE ctermbg=NONE
    hi BufferLineSeparator guibg=NONE ctermbg=NONE
    hi BufferLineSeparatorVisible guibg=NONE ctermbg=NONE
    hi BufferLineSeparatorSelected guibg=NONE ctermbg=NONE
    hi BufferLineIndicatorSelected guibg=NONE ctermbg=NONE
]]

vim.keymap.set('n', "<S-h>", ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', "<S-l>", ':BufferLineCycleNext<CR>')

vim.lsp.enable({
  "lua_ls",
  "rust_analyzer",
  "nixd",
  "ts_ls",
  "omnisharp",
  "haskell-language-server"
})
local lspconfig = require("lspconfig")

lspconfig.nixd.setup({
  settings = {
    nixd = {
      formatting = {
        command = { "alejandra", "-" },
      },
    },
  },
})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, {})

require("nvim-treesitter").setup({
  "lua",
  "javascript",
  "html",
  "nix",
  "bash",
  "json",
  "typst",
  "markdown",
  "python",
  "toml",
  "tsx",
  "typescript",
  "rust",
  "haskell",
})

require("blink.cmp").setup({
  snippets = { preset = "luasnip" },
  signature = { enabled = true },
  fuzzy = { implementation = "lua" },
  appearance = { nerd_font_variant = "normal", },
  keymap = {
    preset        = "super-tab",
    ["<Tab>"]     = { "select_and_accept" },
    ["<S-Tab>"]   = { "select_prev" },
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
  },
  completion = { documentation = { auto_show = true } }
})

require("lualine").setup({
  sections = {
    lualine_a = { { 'mode', separator = { right = "▓▒░" } } },
    lualine_b = { 'filename', 'branch', 'diff' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype' },
    lualine_z = { { 'location', separator = { left = "░▒▓" } } }
  },
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
})
local lualine_sections = { 'b', 'c', 'x', 'y' }
local lualine_modes = { 'normal', 'insert', 'visual', 'replace', 'command', 'inactive' }

for _, section in ipairs(lualine_sections) do
  for _, mode in ipairs(lualine_modes) do
    vim.cmd(string.format("hi Lualine_%s_%s guibg=NONE", section, mode))
  end
end

require("nvim-tree").setup()
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>f', function()
  MiniPick.builtin.files({
    tool = 'rg',
    args = {
      '--files',
      '--glob', '!Library/',
      '--glob', '!Applications/',
    },
  })
end)


vim.keymap.set('n', '<leader>/', ':Pick grep_live<CR>')

require("alpha").setup(require 'alpha.themes.startify'.config)
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  "                 _..--+~/@-~--.                         ",
  '             _-=~      (  .   "}                        ',
  '          _-~     _.--=.\\ \\""""                       ',
  "        _~      _-       \\ \\_\\                       ",
  "       =      _=          '--'                          ",
  "      '      =                             .            ",
  "     :      :       ____                   '=_. ___     ",
  "___  |      ;                            ____ '~--.~.   ",
  "     ;      ;                               _____  } |  ",
  "  ___=       \\ ___ __     __..-...__           ___/__/_",
  "     :        =_     _.-~~          ~~--.__             ",
  "_____ \\         ~-+-~                   ___~=_______   ",
  "     ~@#~~ == ...______ __ ___ _--~~--_                 ",
  "                                                        ",
  "                      n e o v i m                       ",
}
dashboard.section.header.opts.hl = "DashboardHeader"
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#C8C093", bold = true })


dashboard.section.buttons.val = {
  dashboard.button("f", "Files", "<cmd>lua require('mini.pick').builtin.files({ " ..
    "tool = 'rg', " ..
    "args = { '--files', '--glob', '!Library/', '--glob', '!Applications/' } " ..
    "})<CR>"),
  dashboard.button("e", "Tree", ":NvimTreeToggle<CR>"),
  dashboard.button("/", "Search", ":Pick grep_live<CR>"),
  dashboard.button("q", "Exit", ":qa<CR>"),
}
alpha.setup(dashboard.opts)
