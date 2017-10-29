--
-- trigger_mesecons
--
-- A simple Minetest mod that allows the trigger mod to power mesecons machines.
--
-- Most mesecons machines do not require this, they can be used directly with
--  triggers.
--
-- MIT License
-- 
-- Copyright © 2017 by luk3yx
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.


-- Define the emitter node
mesecon.register_node("trigger_mesecons:emitter", {
    description = "Trigger: Mesecons Emitter",
    sounds = default.node_sound_stone_defaults(),
    on_trigger = function(pos, node, value)
        if value then
            minetest.set_node(pos, {name = "trigger_mesecons:emitter_on"})
            mesecon.receptor_on(pos, mesecon.rules.alldirs)
        else
            minetest.set_node(pos, {name = "trigger_mesecons:emitter_off"})
            mesecon.receptor_off(pos, mesecon.rules.alldirs)
        end
    end,
}, {
    groups = {oddly_breakable_by_hand = 1},
    tiles = {"trigger_texture.png^[colorize:#cc0a^mesecons_wire_inv.png"},
    mesecons = {receptor = {
        rules = mesecon.rules.alldirs,
        state = mesecon.state.off,
    }},
}, {
    groups = {oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
    tiles = {"(trigger_texture.png^mesecons_wire_inv.png)^[colorize:#ff0a"},
    mesecons = {receptor = {
        rules = mesecon.rules.alldirs,
        state = mesecon.state.on,
    }},
})

-- For easier typing
minetest.register_alias("trigger_mesecons:emitter", "trigger_mesecons:emitter_off")

-- For whatever reason, these may become useful in the future.
minetest.register_alias("trigger:mesecons_emitter", "trigger_mesecons:emitter_off")
minetest.register_alias("trigger:mesecons_emitter_off", "trigger_mesecons:emitter_off")
minetest.register_alias("trigger:mesecons_emitter_on", "trigger_mesecons:emitter_on")
