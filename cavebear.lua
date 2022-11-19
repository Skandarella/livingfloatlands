mobs:register_mob("livingfloatlands:cavebear", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 10,
	hp_min = 95,
	hp_max = 120,
	armor = 100,
	collisionbox = {-0.6, -0.01, -0.6, 1, 1.5, 0.6},
	visual = "mesh",
	mesh = "Cavebear.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturecavebear.png"},
	},
	sounds = {
		random = "livingfloatlands_cavebear",
		attack = "livingfloatlands_cavebear",
	},
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 2.5,
	runaway = false,
	jump = false,
        jump_height = 6,
	stepheight = 3,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 30,
		stand_start = 0,
		stand_end = 100,
		walk_speed = 60,
		walk_start = 100,
		walk_end = 200,
		punch_speed = 60,
		punch_start = 250,
		punch_end = 350,
		-- 50-70 is slide/water idle
	},

	follow = {
		"ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs:meat_raw", "animalworld:rabbit_raw", "animalworld:pork_raw", "water_life:meat_raw", "animalworld:chicken_raw", "default:apple", "farming:potato", "ethereal:banana_bread", "farming:melon_slice", "farming:carrot", "farming:seed_rice", "farming:corn", "livingfloatlands:ornithischiaraw", "livingfloatlands:sauropodraw", "livingfloatlands:theropodraw", "livingfloatlands:roasted_pine_nuts", "livingfloatlands:coldsteppe_pine3_sapling", "livingfloatlands:coldsteppe_pine2_sapling", "livingfloatlands:coldsteppe_pine_sapling", "livingfloatlands:coldsteppe_bulbous_chervil_root" 
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
	spawn_on = {"default:dirt_with_coniferous_litter"}
end

if not mobs.custom_spawn_livingfloatlands then
mobs:spawn({
	name = "livingfloatlands:smilodon",
	nodes = {"livingfloatlands:coldsteppe_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 1,
	min_height = 5,
	max_height = 31000,

})
end

mobs:register_egg("livingfloatlands:cavebear", ("Cave Bear"), "acavebear.png")
