mobs:register_mob("livingfloatlands:smilodon", {
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 13,
	hp_min = 75,
	hp_max = 95,
	armor = 100,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.95, 0.5},
	visual = "mesh",
	mesh = "Smilodon.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturesmilodon.png"},
	},
	sounds = {
		random = "livingfloatlands_smilodon2",
		attack = "livingfloatlands_smilodon",
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
	runaway = false,
	jump = true,
        jump_height = 6,
	stepheight = 2,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 75,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 250,
		punch_end = 350,
		-- 50-70 is slide/water idle
	},

	follow = {
		"ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs:meat_raw", "animalworld:rabbit_raw", "animalworld:pork_raw", "water_life:meat_raw", "animalworld:chicken_raw", "livingfloatlands:ornithischiaraw", "livingfloatlands:sauropodraw", "livingfloatlands:theropodraw"
	},
	view_range = 15,

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
	name = "livingfloatlands:smilodon",
	nodes = {"default:permafrost_with_moss", "default:dirt_with_snow", "default:snow"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 1000,
	max_height = 5000,

})
end

mobs:register_egg("livingfloatlands:smilodon", ("Smilodon"), "asmilodon.png")
