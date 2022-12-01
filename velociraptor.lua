mobs:register_mob("livingfloatlands:velociraptor", {
stepheight = 2,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 9,
	hp_min = 60,
	hp_max = 80,
	armor = 100,
	collisionbox = {-0.7, -0.01, -0.4, 0.7, 0.7, 0.4},
	visual = "mesh",
	mesh = "Velociraptor.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturevelociraptor.png"},
	},
	sounds = {
		random = "livingfloatlands_velociraptor2",
		attack = "livingfloatlands_velociraptor",
	},
	makes_footstep_sound = true,
	walk_velocity = 3,
	run_velocity = 6,
        walk_chance = 20,
	runaway = false,
	jump = true,
        jump_height = 10,
	drops = {
		{name = "livingfloatlands:theropodraw", chance = 1, min = 1, max = 1},
		{name = "livingfloatlands:dinosaur_feather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 60,
		stand_start = 0,
		stand_end = 100,
		walk_speed = 100,
		walk_start = 100,
		walk_end = 200,
		run_speed = 200,
		run_start = 100,
		run_end = 200,
		punch_speed = 100,
		punch_start = 250,
		punch_end = 350,
		-- 50-70 is slide/water idle
	},

	follow = {
		"ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs:meat_raw", "animalworld:rabbit_raw", "animalworld:pork_raw", "water_life:meat_raw", "animalworld:chicken_raw", "livingfloatlands:ornithischiaraw", "livingfloatlands:sauropodraw", "livingfloatlands:theropodraw"
	},
	view_range = 10,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:prairie_dirt", "ethereal:dry_dirt", "default:desert_sand", "default:desert_sandstone", "default:sandstone"}
end

if not mobs.custom_spawn_livingfloatlands then
mobs:spawn({
	name = "livingfloatlands:velociraptor",
	nodes = {"livingfloatlands:paleodesert_litter"},
	min_light = 0,
	interval = 60,
	active_object_count = 2,
	chance = 8000, -- 15000
	min_height = 1000,
	max_height = 31000,

})
end

mobs:register_egg("livingfloatlands:velociraptor", ("Velociraptor"), "avelociraptor.png")
