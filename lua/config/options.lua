-- Options that differ from or extend LazyVim's defaults

vim.opt.colorcolumn = "80"
vim.opt.showbreak = ">>"
vim.opt.breakindentopt = "shift:2,min:40,sbr"
vim.opt.timeoutlen = 100 -- LazyVim default is 300; keep snappy which-key

-- Neovide
if vim.g.neovide then
	vim.g.neovide_remember_window_size = false
	vim.g.neovide_fullscreen = false
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_cursor_animate_command_line = true
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_cursor_vfx_particle_density = 14.0
	vim.g.neovide_cursor_vfx_particle_speed = 12.0
	vim.g.neovide_opacity = 0.85
	vim.o.guifont = "Maple Mono NF CN:h13"
end
