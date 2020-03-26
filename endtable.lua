-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
  dofile(minetest.get_modpath("intllib").."/intllib.lua")
  S = intllib.Getter(minetest.get_current_modname())
else
  S = function ( s ) return s end
end

if minetest.get_modpath("mcl_sounds") then
    default=mcl_sounds
end

minetest.register_node("lrfurn:endtable", {
	description = S("End Table"),
	drawtype = "nodebox",
	tiles = {"lrfurn_coffeetable_back.png", "lrfurn_coffeetable_back.png",  "lrfurn_coffeetable_back.png",  "lrfurn_coffeetable_back.png",  "lrfurn_coffeetable_back.png",  "lrfurn_coffeetable_back.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	stack_max = 1,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
					--legs
					{-0.375, -0.5, -0.375, -0.3125, -0.0625, -0.3125},
					{0.3125, -0.5, -0.375, 0.375, -0.0625, -0.3125},
					{-0.375, -0.5, 0.3125, -0.3125, -0.0625, 0.375},
					{0.3125, -0.5, 0.3125, 0.375, -0.0625, 0.375},
					
					--tabletop
					{-0.4375, -0.0625, -0.4375, 0.4375, 0, 0.4375},	
				}
	},
	selection_box = {
		type = "fixed",
		fixed = {
					{-0.4375, -0.5, -0.4375, 0.4375, 0.0, 0.4375},
				}
	},
})

if minetest.get_modpath("mcl_core") then
    minetest.register_craft({
        output = "lrfurn:endtable",
        recipe = {
            {"", "", "", },
            {"mcl_stairs:slab_wood", "mcl_stairs:slab_wood", "", },
            {"mcl_core:stick", "mcl_core:stick", "", }
        }
    })

    minetest.register_craft({
        output = "lrfurn:endtable",
        recipe = {
            {"", "", "", },
            {"mcl_core:stick", "mcl_core:stick", "", },
            {"mcl_core:stick", "mcl_core:stick", "", }
        }
    })

    minetest.register_craft({
        output = "lrfurn:endtable",
        recipe = {
            {"", "", "", },
            {"group:wood_slab", "group:wood_slab", "", },
            {"mcl_core:stick", "mcl_core:stick", "", }
        }
    })
else
    minetest.register_craft({
        output = "lrfurn:endtable",
        recipe = {
            {"", "", "", },
            {"stairs:slab_wood", "stairs:slab_wood", "", },
            {"default:stick", "default:stick", "", }
        }
    })

    minetest.register_craft({
        output = "lrfurn:endtable",
        recipe = {
            {"", "", "", },
            {"moreblocks:slab_wood", "moreblocks:slab_wood", "", },
            {"default:stick", "default:stick", "", }
        }
    })

    minetest.register_craft({
        output = "lrfurn:endtable",
        recipe = {
            {"", "", "", },
            {"group:wood_slab", "group:wood_slab", "", },
            {"default:stick", "default:stick", "", }
        }
    })
end
if minetest.setting_get("log_mods") then
	minetest.log("action", "endtable loaded")
end
