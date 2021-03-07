mobs:register_mob("livingfloatlands:parasaurolophus", {
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = false,
	reach = 6,
        damage = 20,
	hp_min = 350,
	hp_max = 450,
	armor = 100,
	collisionbox = {-1.2, -0.01, -1.0, 1.2, 1.5, 1.0},
	visual = "mesh",
	mesh = "Parasaurolophus.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureparasaurolophus.png"},
	},
	sounds = {
		random = "livingfloatlands_parasaurolophus",
		damage = "livingfloatlands_parasaurolophus2",
                distance = 25,
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
        walk_chance = 20,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor"},
	jump = false,
        jump_height = 6,
	stepheight = 1,
	drops = {
		{name = "livingfloatlands:ornithischiaraw", chance = 1, min = 1, max = 1},
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
		walk_speed = 50,
		walk_start = 100,
		walk_end = 200,
		-- 50-70 is slide/water idle
	},

	follow = {
		"default:dry_shrub ", "default:grass_1", "ethereal:dry_shrub", "farming:seed_wheat", "farming:seed_rye", "default:junglegrass", "default:apple", "farming:cabbage", "farming:carrot", "farming:cucumber", "farming:grapes", "farming:pineapple", "ethereal:orange", "ethereal:coconut", "ethereal:coconut_slice"
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
	spawn_on = {"ethereal:prairie_dirt", "ethereal:grove_dirt", "default:dirt_with_coniferous_litter"}
end

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "livingfloatlands:parasaurolophus",
	nodes = {"default:dirt_with_coniferous_litter"},
	min_light = 0,
	interval = 60,
	active_object_count = 3,
	chance = 8000, -- 15000
	min_height = 1000,
	max_height = 5000,

})
end

mobs:register_egg("livingfloatlands:parasaurolophus", ("Parasaurolophus"), "aparasaurolophus.png")
