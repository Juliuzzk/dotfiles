-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt -- Opciones globales/buffer/ventana

-- Establece la cantidad de espacios para una tabulación
opt.shiftwidth = 4
-- Establece el ancho de una tabulación
opt.tabstop = 4
-- Transparencia del menú emergente de completado automático (0-100)
opt.pumblend = 0
-- Transparencia de las ventanas flotantes (0-100)
opt.winblend = 0
-- Desactiva los números de línea relativa
opt.relativenumber = false
