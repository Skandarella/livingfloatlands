mobs:register_mob("livingfloatlands:deinotherium", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	attack_animals = false,
	attack_monsters = true,
	reach = 4,
        damage = 20,
	hp_min = 175,
	hp_max = 320,
	armor = 100,
	collisionbox = {-2, -0.01, -1, 1, 1.7, 1},
	visual = "mesh",
	mesh = "Deinotherium.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturedeinotherium.png"},
	},
	sounds = {
		random = "livingfloatlands_deinotherium",
		attack = "livingfloatlands_deinotherium2",
                distance = 15,
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
	runaway = false,
	jump = false,
        jump_height = 6,
	stepheight = 2,
	drops = {
		{name = "livingfloatlands:largemammalraw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
        pathfinding = true,
	animation = {
		speed_normal = 70,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 250,
		punch_end = 350,
		-- 50-70 is slide/water idle
	},

	follow = {
		"ethereal:banana_single", "farming:corn_cob", "farming:cabbage",
		"default:apple", "farming:cabbage", "farming:carrot", "farming:cucumber", "farming:grapes", "farming:pineapple", "ethereal:orange", "ethereal:coconut", "ethereal:coconut_slice", "livingfloatlands:paleojungle_clubmoss_fruit", "livingfloatlands:giantforest_oaknut", "livingfloatlands:paleojungle_ferngrass"
	},
	view_range = 12,
	replace_rate = 10,
	replace_what = {"farming:soil", "farming:soil_wet"},
	replace_with = "default:dirt",
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:prairie_dirt", "ethereal:grove_dirt", "default:dirt_with_grass"}
end

if not mobs.custom_spawn_livingfloatlands then
mobs:spawn({
	name = "livingfloatlands:deinotherium",
	nodes = {"livingfloatlands:giantforest_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 0,
	max_height = 31000,
	day_toggle = true,
})
end

mobs:register_egg("livingfloatlands:deinotherium", ("Deinotherium"), "adeinotherium.png")


-- raw Ornithischia
minetest.register_craftitem(":livingfloatlands:largemammalraw", {
	description = ("Raw meat of a large Mammal"),
	inventory_image = "livingfloatlands_largemammalraw.png",
	on_use = minetest.item_eat(3),
	groups = {food_meat_raw = 1, flammable = 2},
})

-- cooked Ornithischia
minetest.register_craftitem(":livingfloatlands:largemammalcooked", {
	description = ("Cooked meat of a large Mammal"),
	inventory_image = "livingfloatlands_largemammalcooked.png",
	on_use = minetest.item_eat(5),
	groups = {food_meat = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "livingfloatlands:largemammalcooked",
	recipe = "livingfloatlands:largemammalraw",
	cooktime = 40,
})


