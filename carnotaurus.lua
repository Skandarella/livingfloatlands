mobs:register_mob("livingfloatlands:carnotaurus", {
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 6,
        damage = 20,
	hp_min = 100,
	hp_max = 350,
	armor = 100,
	collisionbox = {-1.2, -0.01, -0.9, 1.2, 1.5, 0.9},
	visual = "mesh",
	mesh = "Carnotaurus.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturecarnotaurus.png"},
	},
	sounds = {
		random = "livingfloatlands_carnotaurus",
		attack = "livingfloatlands_carnotaurus2",
                distance = 20,
	},
	makes_footstep_sound = true,
	walk_velocity = 3,
	run_velocity = 6,
        walk_chance = 20,
	runaway = false,
	jump = false,
        jump_height = 6,
	stepheight = 1,
	drops = {
		{name = "livingfloatlands:theropodraw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
        pathfinding = true,
	animation = {
		speed_normal = 30,
		stand_start = 250,
		stand_end = 350,
		walk_speed = 50,
		walk_start = 0,
		walk_end = 100,
		run_speed = 80,
		run_start = 0,
		run_end = 100,
		punch_speed = 100,
		punch_start = 100,
		punch_end = 200,
		-- 50-70 is slide/water idle
	},

	follow = {
		"ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs:meat_raw", "animalworld:rabbit_raw", "animalworld:pork_raw", "water_life:meat_raw", "animalworld:chicken_raw", "livingfloatlands:ornithischiaraw", "livingfloatlands:sauropodraw", "livingfloatlands:theropodraw"
	},
	view_range = 20,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:prairie_dirt", "ethereal:dry_dirt", "default:dry_dirt_with_dry_grass"}
end

if not mobs.custom_spawn_livingfloatlands then
mobs:spawn({
	name = "livingfloatlands:carnotaurus",
	nodes = {"default:dry_dirt_with_dry_grass"},
	min_light = 0,
	interval = 60,
	active_object_count = 2,
	chance = 8000, -- 15000
	min_height = 1000,
	max_height = 5000,

})
end

mobs:register_egg("livingfloatlands:carnotaurus", ("Carnotaurus"), "acarnotaurus.png")

-- raw Theropod
minetest.register_craftitem(":livingfloatlands:theropodraw", {
	description = ("Raw Theropod Meat"),
	inventory_image = "livingfloatlands_theropodraw.png",
	on_use = minetest.item_eat(3),
	groups = {food_meat_raw = 1, flammable = 2},
})

-- cooked Theropod
minetest.register_craftitem(":livingfloatlands:theropodcooked", {
	description = ("Cooked Theropod Meat"),
	inventory_image = "livingfloatlands_theropodcooked.png",
	on_use = minetest.item_eat(5),
	groups = {food_meat = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "livingfloatlands:theropodcooked",
	recipe = "livingfloatlands:theropodraw",
	cooktime = 40,
})



