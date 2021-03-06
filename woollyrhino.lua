mobs:register_mob("livingfloatlands:woollyrhino", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	attack_animals = false,
	group_attack = true,
	reach = 3,
        damage = 14,
	hp_min = 90,
	hp_max = 140,
	armor = 100,
	collisionbox = {-1.2, -0.01, -0.8, 1.2, 1.5, 0.8},
	visual = "mesh",
	mesh = "Woollyrhino.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturewoollyrhino.png"},
	},
	sounds = {
		random = "livingfloatlands_woollyrhino",
		attack = "livingfloatlands_woollyrhino2",
                distance = 13,
	},
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 3,
        walk_chance = 20,
	runaway = false,
	jump = true,
        jump_height = 6,
	stepheight = 1,
	drops = {
		{name = "livingfloatlands:largemammalraw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
        pathfinding = true,
	animation = {
		speed_normal = 50,
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
		"default:apple", "farming:cabbage", "farming:carrot", "farming:cucumber", "farming:grapes", "farming:pineapple", "ethereal:orange", "ethereal:coconut", "ethereal:coconut_slice", "default:grass_3", "default:dry_grass_3", "ethereal:dry_shrub", "farming:lettuce", "farming:seed_wheat", "default:junglegrass"
	},
	view_range = 10,
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
	spawn_on = {"ethereal:mushroom_dirt", "ethereal:crystal_dirt", "default:permafrost_with_moss", "default:dirt_with_snow", "default:snow"}
end

if not mobs.custom_spawn_livingfloatlands then
mobs:spawn({
	name = "livingfloatlands:woollyrhino",
	nodes = {"default:permafrost_with_moss", "default:dirt_with_snow", "default:snow"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 4,
	min_height = 1000,
	max_height = 5000,
	day_toggle = true,
})
end

mobs:register_egg("livingfloatlands:woollyrhino", ("Woolly Rhino"), "awoollyrhino.png")
