local opt = vim.opt
local g = vim.g
local o = vim.o

-- Neovide
if g.neovide then
    -- Otherwise it will always launch as maximized window on hyprland
    g.neovide_remember_window_size = false
    g.neovide_fullscreen = false
    g.neovide_hide_mouse_when_typing = false
    g.neovide_refresh_rate = 60

    g.neovide_cursor_animate_command_line = true
    g.neovide_cursor_animate_in_insert_mode = true

    g.neovide_cursor_vfx_mode = "railgun"
    g.neovide_cursor_vfx_particle_lifetime = 5.0
    g.neovide_cursor_vfx_particle_density = 14.0
    g.neovide_cursor_vfx_particle_speed = 12.0

    g.neovide_transparency = 0.7

    o.guifont = "Maple Mono SC NF"
end
