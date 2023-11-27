local Plug = vim.fn['plug#']
local cmd = vim.cmd
local g = vim.g

vim.call('plug#begin', '~/.config/nvim/plugged')
    
--  Theme
    Plug('folke/tokyonight.nvim')
    Plug 'tribela/vim-transparent'

--  Statusbar
    Plug('itchyny/lightline.vim')
    
--  Color preview
    Plug('norcalli/nvim-colorizer.lua')

--  Terminal
    Plug('akinsho/toggleterm.nvim', {tag = '*'})

    Plug('nvim-colorizer.lua')

--  Comment
--  Plug 'preservim/nerdcommenter'

--  Telescope
--  Plug('nvim-lua/plenary.nvim')
--  Plug('nvim-telescope/telescope.nvim', { 'tag': '0.1.2' })
--  Plug('nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })

--  nvim-cmp 
    Plug('neovim/nvim-lspconfig')
    Plug('hrsh7th/cmp-nvim-lsp')
    Plug('hrsh7th/cmp-buffer')
    Plug('hrsh7th/cmp-path')
    Plug('hrsh7th/cmp-cmdline')
    Plug('hrsh7th/nvim-cmp')

--  For vsnip users.
    Plug('hrsh7th/cmp-vsnip')
    Plug('hrsh7th/vim-vsnip')
--
--  For luasnip users.
--  Plug('L3MON4D3/LuaSnip')
--  Plug('saadparwaiz1/cmp_luasnip')
--
--  For ultisnips users.
--  Plug('SirVer/ultisnips')
--  Plug('quangnguyen30192/cmp-nvim-ultisnips')
--
--  For snippy users.
--  Plug('dcampos/nvim-snippy')
--  Plug('dcampos/cmp-snippy')

vim.call('plug#end')

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
  -- { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
capabilities = capabilities
}

require 'colorizer'.setup()

cmd[[
    colorscheme tokyonight-night
]]

-- highlight SpellBad ctermfg=white ctermbg=red guifg=white guibg=red'
