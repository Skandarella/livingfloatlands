mobs:register_mob("livingfloatlands:nigersaurus", {
stepheight = 1,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 6,
        damage = 20,
	hp_min = 100,
	hp_max = 400,
	armor = 100,
	collisionbox = {-1.2, -0.01, -0.9, 1.2, 1.5, 0.9},
	visual = "mesh",
	mesh = "Nigersaurus.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturenigersaurus.png"},
	},
	sounds = {
		random = "livingfloatlands_nigersaurus",
		damage = "livingfloatlands_nigersaurus2",
                distance = 15,
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3,
        walk_chance = 20,
	runaway = false,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor"},
	jump = true,
        jump_height = 6,
	drops = {
		{name = "livingfloatlands:sauropodraw", chance = 1, min = 1, max = 1},
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

	follow = {"default:dry_shrub ", "default:grass_1", "ethereal:dry_shrub", "farming:seed_wheat", "farming:seed_rye", "default:junglegrass", "default:apple", "farming:cabbage", "farming:carrot", "farming:cucumber", "farming:grapes", "farming:pineapple", "ethereal:orange", "ethereal:coconut", "ethereal:coconut_slice"},
	view_range = 25,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:grove_dirt", "ethereal:bamboo_dirt", "default:dirt_with_coniferous_litter"}
end

if not mobs.custom_spawn_livingfloatlands then
mobs:spawn({
	name = "livingfloatlands:nigersaurus",
	nodes = {"default:dirt_with_coniferous_litter"},
	min_light = 0,
	interval = 60,
	active_object_count = 4,
	chance = 8000, -- 15000
	min_height = 1000,
	max_height = 5000,

})
end

mobs:register_egg("livingfloatlands:nigersaurus", ("Nigersaurus"), "anigersaurus.png")

-- raw Sauropod
minetest.register_craftitem(":livingfloatlands:sauropodraw", {
	description = ("Raw Sauropod Meat"),
	inventory_image = "livingfloatlands_sauropodraw.png",
	on_use = minetest.item_eat(3),
	groups = {food_meat_raw = 1, flammable = 2},
})

-- cooked Sauropod
minetest.register_craftitem(":livingfloatlands:sauropodcooked", {
	description = ("Cooked Sauropod Meat"),
	inventory_image = "livingfloatlands_sauropodcooked.png",
	on_use = minetest.item_eat(5),
	groups = {food_meat = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "livingfloatlands:sauropodcooked",
	recipe = "livingfloatlands:sauropodraw",
	cooktime = 30,
})


