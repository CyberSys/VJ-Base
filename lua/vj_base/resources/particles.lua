/*--------------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ VJ Base ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
VJ.AddParticle("particles/vj_blood.pcf", {
	-- Blood pools
	"vj_blood_pool_blue",
	"vj_blood_pool_blue_small",
	"vj_blood_pool_blue_tiny",
	"vj_blood_pool_green",
	"vj_blood_pool_green_small",
	"vj_blood_pool_green_tiny",
	"vj_blood_pool_oil",
	"vj_blood_pool_oil_small",
	"vj_blood_pool_oil_tiny",
	"vj_blood_pool_orange",
	"vj_blood_pool_orange_small",
	"vj_blood_pool_orange_tiny",
	"vj_blood_pool_purple",
	"vj_blood_pool_purple_small",
	"vj_blood_pool_purple_tiny",
	"vj_blood_pool_red",
	"vj_blood_pool_red_small",
	"vj_blood_pool_red_tiny",
	"vj_blood_pool_white",
	"vj_blood_pool_white_small",
	"vj_blood_pool_white_tiny",
	"vj_blood_pool_yellow",
	"vj_blood_pool_yellow_small",
	"vj_blood_pool_yellow_tiny",
	-- Blood impacts
	"vj_blood_impact_oil",
	"vj_blood_impact_blue",
	"vj_blood_impact_green",
	"vj_blood_impact_orange",
	"vj_blood_impact_purple",
	"vj_blood_impact_red",
	"vj_blood_impact_white",
	"vj_blood_impact_yellow",
})
VJ.AddParticle("particles/vj_explosions.pcf", {
	"vj_explosion1",
	"vj_explosion2",
	"vj_explosion3",
	"vj_explosionfire1",
	"vj_explosionfire2",
	"vj_explosionfire3",
	"vj_explosionfire4",
	"vj_explosionfire5",
	"vj_explosionflash1",
	"vj_explosionflash2",
	"vj_explosionspark1",
	"vj_explosionspark2",
	"vj_explosionspark3",
	"vj_explosionspark4",
	"vj_explosion_shockwave1",
	"vj_explosion_shockwave2",
	"vj_explosion_smoke1",
	"vj_explosion_smoke2",
	"vj_explosion_smoke_spike",
	"vj_explosion_rocks1",
	"vj_explosion_rocks2",
	"vj_explosion_debris",
	"vj_explosion_dirt",
})
VJ.AddParticle("particles/vj_environment.pcf", {
	-- Aurora
	"vj_aurora_shockwave",
	"vj_aurora_shockwave_ring",
	"vj_aurora_shockwave_trails",
	"vj_aurora_floaters",
	-- Smoke
	"vj_smoke1",
	"vj_smoke2",
	-- Steam
	"vj_steam",
	"vj_steam_narrow",
	"vj_steam_narrow_continuous",
	"vj_steam_small",
	"vj_steam_small_full",
	"vj_steam_medium",
	"vj_steam_medium_full",
	"vj_steam_drops",
	"vj_steam_puff",
	"vj_steam_puff2",
})
VJ.AddParticle("particles/vj_projectiles.pcf", {
	"vj_impact_dirty",
	-- Acid Spits
	"vj_acid_idle",
	"vj_acid_impact1",
	"vj_acid_impact1_floaters",
	"vj_acid_impact1_gas",
	"vj_acid_impact1_splat",
	"vj_acid_impact1_small",
	"vj_acid_impact1_small_splat",
	"vj_acid_impact2",
	"vj_acid_impact2_juice",
	"vj_acid_impact2_trails",
	"vj_acid_impact2_splat",
	"vj_acid_impact3",
	"vj_acid_impact3_splat",
	"vj_acid_impact3_floaters",
	"vj_acid_impact3_gas",
	"vj_acid_impact3_slime",
	"vj_acid_impact3_slime_small",
	"vj_acid_impact3_trails",
	-- Rockets
	"vj_rocket_idle1",
	"vj_rocket_idle1_smoke",
	"vj_rocket_idle1_flare",
	"vj_rocket_idle2",
	"vj_rocket_idle2_smoke1",
	"vj_rocket_idle2_smoke2",
	"vj_rocket_idle2_fire",
	"vj_rocket_idle2_flare",
	"vj_rocket_idle2_glow",
	-- Fireball
	"vj_fireball_idle",
	"vj_fireball_idle_fire",
	"vj_fireball_idle_glow",
	"vj_fireball_idle_smoke",
})
VJ.AddParticle("particles/vj_weapons.pcf", {
    "vj_rifle_smoke",
    "vj_rifle_smoke_dark",
    "vj_rifle_sparks1",
    "vj_rifle_sparks2",
    -- Regular
    "vj_rifle_full",
    "vj_rifle_glow",
    "vj_rifle_glow_large",
    "vj_rifle_inner",
    "vj_rifle_side",
    "vj_rifle_side_glow",
    "vj_rifle_smoke_flash",
    "vj_rifle_top",
    "vj_rifle_top_glow",
    "vj_rifle_top_left_glow",
    -- Blue Regular
    "vj_rifle_full_blue",
    "vj_rifle_glow_blue",
    "vj_rifle_glow_large_blue",
    "vj_rifle_inner_blue",
    "vj_rifle_side_blue",
    "vj_rifle_side_glow_blue",
    "vj_rifle_smoke_flash_blue",
    "vj_rifle_top_blue",
    "vj_rifle_top_glow_blue",
    "vj_rifle_top_left_glow_blue",
    -- Blaster (Star Wars)
    "vj_muzzle_blaster_red",
    "vj_muzzle_blaster_blue",
	-- Black Mesa Source Turret fire
	"vj_bms_turret_full",
	"vj_bms_turret_muzzle_core",
	"vj_bms_turret_muzzle_glow",
	"vj_bms_turret_muzzle_smoke",
	"vj_bms_turret_muzzle_sparks",
	"vj_bms_turret_muzzle_sparks2",
})
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Half Life 2 Episode 2 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
VJ.AddParticle("particles/fire_01.pcf", {
	"burning_engine_01",
	"burning_engine_fire",
	"burning_gib_01",
	"burning_gib_01_drag",
	"burning_gib_01_follower1",
	"burning_gib_01_follower2",
	"burning_gib_01b",
	"burning_wood_01",
	"burning_wood_01b",
	"burning_wood_01c",
	"embers_large_01",
	"embers_large_02",
	"embers_medium_01",
	"embers_medium_03",
	"embers_small_01",
	"env_embers_large",
	"env_embers_medium",
	"env_embers_medium_spread",
	"env_embers_small",
	"env_embers_small_spread",
	"env_embers_tiny",
	"env_fire_large",
	"env_fire_tiny_smoke",
	"explosion_huge",
	"explosion_huge_b",
	"explosion_silo",
	"fire_jet_01",
	"fire_jet_01_flame",
	"fire_large_01",
	"fire_large_02",
	"fire_large_02_filler",
	"fire_large_02_fillerb",
	"fire_large_base",
	"fire_medium_01",
	"fire_medium_01_glow",
	"fire_medium_02",
	"fire_medium_02_nosmoke",
	"fire_medium_heatwave",
	"fire_small_01",
	"fire_small_02",
	"fire_small_03",
	"fire_small_base",
	"fire_small_flameouts",
	"fire_verysmall_01",
	"smoke_burning_engine_01",
	"smoke_exhaust_01",
	"smoke_exhaust_01a",
	"smoke_exhaust_01b",
	"smoke_gib_01",
	"smoke_large_01",
	"smoke_large_01b",
	"smoke_large_02",
	"smoke_large_02b",
	"smoke_medium_01",
	"smoke_medium_02",
	"smoke_medium_02 Version #2",
	"smoke_medium_02b",
	"smoke_medium_02b Version #2",
	"smoke_medium_02c",
	"smoke_medium_02d",
	"smoke_small_01",
	"smoke_small_01b",
})
VJ.AddParticle("particles/weapon_fx.pcf", {
	"explosion_turret_break",
	"explosion_turret_fizzle",
	"explosion_turret_break_b",
	"explosion_turret_break_chunks",
	"explosion_turret_break_embers",
	"explosion_turret_break_fire",
	"explosion_turret_break_fire_over",
	"explosion_turret_break_flash",
	"explosion_turret_break_pre_flash",
	"explosion_turret_break_pre_smoke",
	"explosion_turret_break_pre_smoke Version #2",
	"explosion_turret_break_pre_sparks",
	"explosion_turret_break_sparks",
	"Weapon_Combine_Ion_Cannon",
	"Weapon_Combine_Ion_Cannon_Beam",
	"Weapon_Combine_Ion_Cannon_Black",
	"Weapon_Combine_Ion_Cannon_Explosion",
	"Weapon_Combine_Ion_Cannon_Exlposion_c",
	"Weapon_Combine_Ion_Cannon_Explosion_e",
	"Weapon_Combine_Ion_Cannon_i",
	"Weapon_Combine_Ion_Cannon_Intake",
	"Weapon_Combine_Ion_Cannon_Intake_b",
})