local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

cmd('syntax on')

opt.compatible = false
opt.number = true
opt.relativenumber = true

opt.wrap = false

opt.tabstop=4
opt.softtabstop=4
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth=4
opt.numberwidth=2

opt.incsearch = true
opt.hlsearch = false
opt.splitbelow = true
opt.splitright = true
opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true

g.mapleader=","
