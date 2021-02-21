mobs:register_mob("livingfloatlands:mammooth", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	attack_animals = false,
	group_attack = true,
	reach = 3,
        damage = 16,
	hp_min = 100,
	hp_max = 180,
	armor = 100,
	collisionbox = {-1.2, -0.01, -1.2, 1.2, 1.5, 1.2},
	visual = "mesh",
	mesh = "Mammooth.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturemammooth.png"},
	},
	sounds = {
		random = "livingfloatlands_mammooth",
		attack = "livingfloatlands_mammooth",
                distance = 15,
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
	runaway = false,
	jump = false,
        jump_height = 6,
	stepheight = 1,
	drops = {
		{name = "livingfloatlands:largemammalraw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
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
		"default:apple", "farming:cabbage", "farming:carrot", "farming:cucumber", "farming:grapes", "farming:pineapple", "ethereal:orange", "ethereal:coconut", "ethereal:coconut_slice"
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
	spawn_on = {"ethereal:crystal_dirt", "ethereal:gray_dirt", "default:permafrost_with_moss", "default:dirt_with_snow", "default:snow"}
end

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "livingfloatlands:mammooth",
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

mobs:register_egg("livingfloatlands:mammooth", ("Mammooth"), "amammooth.png")
