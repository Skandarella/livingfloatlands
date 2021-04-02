mobs:register_mob("livingfloatlands:lycaenops", {
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 10,
	hp_min = 25,
	hp_max = 65,
	armor = 100,
	collisionbox = {-0.6, -0.01, -0.6, 0.6, 0.95, 0.6},
	visual = "mesh",
	mesh = "Lycaenops.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturelycaenops.png"},
	},
	sounds = {
		random = "livingfloatlands_lycaenops2",
		attack = "livingfloatlands_lycaenops",
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3,
	runaway = false,
	jump = false,
        jump_height = 6,
	stepheight = 2,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
		{name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
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
		"animalworld:rawfish", "mobs:meat_raw", "animalworld:rabbit_raw", "animalworld:chicken_raw", "water_life:meat_raw", "livingfloatlands:ornithischiaraw", "livingfloatlands:sauropodraw", "livingfloatlands:theropodraw"
	},
	view_range = 8,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:gray_dirt", "dry:dry_dirt", "default:dirt_with_grass", "default:dry_dirt_with_dry_grass", "default:dirt_with_coniferous_litter"}
end

if not mobs.custom_spawn_livingfloatlands then
mobs:spawn({
	name = "livingfloatlands:lycaenops",
	nodes = {"default:dirt_with_grass", "default:dry_dirt_with_dry_grass", "default:dirt_with_coniferous_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 1000,
	max_height = 5000,

})
end

mobs:register_egg("livingfloatlands:lycaenops", ("Lycaenops"), "alycaenops.png")
