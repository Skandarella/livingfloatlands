mobs:register_mob("livingfloatlands:stegosaurus", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	attack_animals = false,
	group_attack = true,
	reach = 5,
        damage = 16,
	hp_min = 250,
	hp_max = 350,
	armor = 100,
	collisionbox = {-1.8, -0.01, -1.0, 0.6, 1.5, 1.0},
	visual = "mesh",
	mesh = "Stegosaurus.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturestegosaurus.png"},
	},
	sounds = {
		random = "livingfloatlands_stegosaurus",
		attack = "default_punch.ogg",
                distance = 16,
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3,
        walk_chance = 20,
	runaway = false,
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
		speed_normal = 25,
		stand_start = 0,
		stand_end = 100,
		walk_speed = 50,
		walk_start = 100,
		walk_end = 200,
		punch_speed = 100,
		punch_start = 250,
		punch_end = 350,
		-- 50-70 is slide/water idle
	},

	follow = {
		"default:grass_3", "default:dry_grass_3", "ethereal:dry_shrub", "farming:lettuce", "farming:seed_wheat", "default:junglegrass"
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
	spawn_on = {"ethereal:prairie_dirt", "ethereal:grove_dirt", "default:dirt_with_coniferous_litter", "default:dirt_with_grass", "default:dirt_with_rainforest_litter"}
end

if not mobs.custom_spawn_livingfloatlands then
mobs:spawn({
	name = "livingfloatlands:stegosaurus",
	nodes = {"default:dirt_with_coniferous_litter", "default:dirt_with_grass", "default:dirt_with_rainforest_litter"},
	min_light = 0,
	interval = 60,
	active_object_count = 2,
	chance = 8000, -- 15000
	min_height = 1000,
	max_height = 5000,

})
end

mobs:register_egg("livingfloatlands:stegosaurus", ("Stegosaurus"), "astegosaurus.png")
