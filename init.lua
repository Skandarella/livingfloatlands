
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local S = minetest.get_translator and minetest.get_translator("livingfloatlands") or
		dofile(path .. "intllib.lua")

mobs.intllib = S


-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_animal = true
	input:close()
	input = nil
end


-- Animals
dofile(path .. "carnotaurus.lua") -- 
dofile(path .. "nigersaurus.lua") -- 
dofile(path .. "deinotherium.lua") -- 
dofile(path .. "mammooth.lua") -- 
dofile(path .. "gastornis.lua") -- 
dofile(path .. "woollyrhino.lua") -- 
dofile(path .. "velociraptor.lua") -- 
dofile(path .. "triceratops.lua") -- 
dofile(path .. "smilodon.lua") -- 
dofile(path .. "parasaurolophus.lua") -- 
dofile(path .. "gigantopithecus.lua") -- 
dofile(path .. "wildhorse.lua") -- 
dofile(path .. "entelodon.lua") -- 
dofile(path .. "oviraptor.lua") -- 
dofile(path .. "stegosaurus.lua") -- 
dofile(path .. "ankylosaurus.lua") -- 
dofile(path .. "lycaenops.lua") -- 
dofile(path .. "tyrannosaurus.lua") -- 
dofile(path .. "cavebear.lua") -- 
dofile(path .. "rhamphorhynchus.lua") -- 
dofile(path .. "hunger.lua") -- 



-- Load custom spawning
if mobs.custom_spawn_animal then
	dofile(path .. "spawn.lua")
end



print (S("[MOD] Mobs Redo Animals loaded"))
