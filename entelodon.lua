mobs:register_mob("livingfloatlands:entelodon", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	group_attack = true,
	reach = 3,
        damage = 13,
	hp_min = 100,
	hp_max = 150,
	armor = 100,
	collisionbox = {-1, -0.01, -1, 1, 1.8, 1},
	visual = "mesh",
	mesh = "Entelodon.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureentelodon.png"},
	},
	sounds = {
		random = "livingfloatlands_entelodon2",
		attack = "livingfloatlands_entelodon",
	},
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 3,
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
	fear_height = 3,
        pathfinding = true,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		walk_speed = 75,
		walk_start = 100,
		walk_end = 200,
		punch_speed = 100,
		punch_start = 250,
		punch_end = 350,
		-- 50-70 is slide/water idle
	},

	follow = {
		"ethereal:banana_single", "farming:corn_cob", "farming:cabbage",
		"default:apple", "farming:cabbage", "farming:carrot", "farming:cucumber", "farming:grapes", "farming:pineapple", "ethereal:orange", "ethereal:coconut", "ethereal:coconut_slice", "mobs:meat_raw", "animalworld:rabbit_raw", "animalworld:pork_raw", "water_life:meat_raw", "animalworld:chicken_raw", "livingfloatlands:ornithischiaraw", "livingfloatlands:sauropodraw", "livingfloatlands:theropodraw"
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
	spawn_on = {"ethereal:prairie_dirt", "ethereal:dry_dirt", "default:desert_sand", "default:dry_dirt_with_dry_grass"}
end

if not mobs.custom_spawn_livingfloatlands then
mobs:spawn({
	name = "livingfloatlands:entelodon",
	nodes = {"default:desert_sand", "default:dry_dirt_with_dry_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 1000,
	max_height = 5000,
	day_toggle = true,
})
end

mobs:register_egg("livingfloatlands:entelodon", ("Entelodon"), "aentelodon.png")
