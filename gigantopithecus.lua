mobs:register_mob("livingfloatlands:gigantopithecus", {
	stepheight = 3,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	reach = 3,
	damage = 11,
	hp_min = 85,
	hp_max = 120,
	armor = 100,
	collisionbox = {-0.8, -0.01, -0.8, 0.8, 1.6, 0.8},
	visual = "mesh",
	mesh = "Gigantopithecus.b3d",
	textures = {
		{"texturegigantopithecus.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "livingfloatlands_gigantopithecus2",
		attack = "livingfloatlands_gigantopithecus",
                distance = 20,
	},
	walk_velocity = 2,
	run_velocity = 3,
        walk_chance = 20,
	runaway = false,
	jump = false,
	jump_height = 3,
	pushable = true,
	follow = {"default:apple", "farming:potato", "farming:melon_slice", "farming:cucumber", "farming:cabbage", "farming:lettuce", "farming:bread", "ethereal:banana_single"},
	view_range = 10,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	        {name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 50,
		stand_start = 350,
		stand_end = 450,
		walk_speed = 75,
		walk_start = 0,
		walk_end = 100,
		punch_speed = 100,
		punch_start = 150,
		punch_end = 250,

		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})


if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:grove_dirt", "ethereal:bamboo_dirt", "default:dirt_with_grass", "default:dirt_with_rainforest_litter"}
end

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "livingfloatlands:gigantopithecus",
	nodes = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter"},
	neighbors = spawn_by,
	min_light = 0,
	interval = 60,
	active_object_count = 3,
	chance = 8000, -- 15000
	min_height = 1000,
	max_height = 5000,
})
end

mobs:register_egg("livingfloatlands:gigantopithecus", ("Gigantopithecus"), "agigantopithecus.png")


mobs:alias_mob("livingfloatlands:gigantopithecus", "livingfloatlands:gigantopithecus") -- compatibility

