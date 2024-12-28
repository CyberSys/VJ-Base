IncludeCS("ai_translations.lua")

SWEP.IsVJBaseWeapon = true
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Core & Information ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//SWEP.Base = "weapon_base"
SWEP.PrintName = "VJ Weapon Base"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"
//SWEP.Spawnable = false
//SWEP.AdminOnly = false
SWEP.MadeForNPCsOnly = false -- Is this weapon meant to be for NPCs only?
SWEP.ReplacementWeapon = nil -- When picked up by a player it gives them a replacement weapon | Useful for NPC-only weapons
	-- String = Replaces the weapon if it's a valid class name
	-- Table = Replaces the weapon by going in order of the table until a valid class name is given
SWEP.HoldType = "ar2"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ View Model ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.UseHands = false -- Should this weapon use Garry's Mod hands? (The model must support it!)
SWEP.ViewModelFlip = false -- Flip the model? Usually used for CS:S models
SWEP.ViewModelFOV = 55 -- Player FOV for the view model
SWEP.BobScale = 1.5 -- Bob effect when moving
SWEP.SwayScale = 1 -- Default is 1, The scale of the viewmodel sway
SWEP.CSMuzzleFlashes = false -- Recommended to enable for Counter Strike: Source models
SWEP.DrawAmmo = true -- Draw regular Garry's Mod HUD?
SWEP.DrawCrosshair = true -- Draw Crosshair?
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ World Model ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.WorldModel_UseCustomPosition = false -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(0, 0, 0)
SWEP.WorldModel_CustomPositionOrigin = Vector(0, 0, 0)
SWEP.WorldModel_CustomPositionBone = "ValveBiped.Bip01_R_Hand" -- The bone it will use as the main point (Owner's bone)
SWEP.WorldModel_Invisible = false -- Should the world model be invisible?
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ NPC Only ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Set this to false to disable the timer automatically running the firing code, this allows for event-based NPCs to fire at their own pace:
SWEP.NPC_NextPrimaryFire = 0.11 -- RPM of the weapon in seconds | Calculation: 60 / RPM
	-- Note: Melee weapons automatically change this number!
SWEP.NPC_TimeUntilFire = 0 -- How much time until the bullet/projectile is fired?
SWEP.NPC_TimeUntilFireExtraTimers = {} -- Extra timers, which will make the gun fire again! | The seconds are counted after the self.NPC_TimeUntilFire!
SWEP.NPC_CustomSpread = 1 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_BulletSpawnAttachment = "" -- The attachment that the bullet spawns on, leave empty for base to decide!
SWEP.NPC_CanBePickedUp = true -- Can this weapon be picked up by NPCs? (Ex: Rebels)
SWEP.NPC_StandingOnly = false -- If true, the weapon can only be fired if the NPC is standing still
	-- ====== Firing Control ====== --
SWEP.NPC_FiringDistanceScale = 1 -- Changes how far the NPC can fire | 1 = No change, x < 1 = closer, x > 1 = farther
SWEP.NPC_FiringDistanceMax = 100000 -- Maximum firing distance | Clamped at the maximum sight distance of the NPC
SWEP.NPC_FiringCone = 0.9 -- NPC can only fire when their target is within the cone (between -1 & 1) | -1 = 360° | 0 = 180 | 1 = Can fire when directly aiming at the target (nearly impossible)
	-- ====== Reload ====== --
SWEP.NPC_HasReloadSound = true -- Should it play a sound when the base detects the SNPC playing a reload animation?
SWEP.NPC_ReloadSound = {} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_ReloadSoundLevel = 60 -- How far does the sound go?
	-- ====== Before Fire Sound ====== --
	-- NOTE: This only works with VJ Human NPCs!
SWEP.NPC_BeforeFireSound = {} -- Plays a sound before the firing code is ran, usually in the beginning of the animation
SWEP.NPC_BeforeFireSoundLevel = 70 -- How far does the sound go?
SWEP.NPC_BeforeFireSoundPitch = VJ.SET(90, 100) -- How much time until the secondary fire can be used again?
	-- ====== Extra Firing Sound ====== --
SWEP.NPC_ExtraFireSound = {} -- Plays an extra sound after it fires (Example: Bolt action sound)
SWEP.NPC_ExtraFireSoundTime = 0.4 -- How much time until it plays the sound (After Firing)?
SWEP.NPC_ExtraFireSoundLevel = 70 -- How far does the sound go?
SWEP.NPC_ExtraFireSoundPitch = VJ.SET(90, 100) -- How much time until the secondary fire can be used again?
	-- ====== Secondary Fire ====== --
SWEP.NPC_HasSecondaryFire = false -- Can the weapon have a secondary fire?
SWEP.NPC_SecondaryFireEnt = "obj_vj_grenade_rifle" -- The entity to fire, this only applies if self:NPC_SecondaryFire() has NOT been overridden!
SWEP.NPC_SecondaryFireChance = 3 -- Chance that the secondary fire is used | 1 = always
SWEP.NPC_SecondaryFireNext = VJ.SET(12, 15) -- How much time until the secondary fire can be used again?
SWEP.NPC_SecondaryFireDistance = 1000 -- How close does the owner's enemy have to be for it to fire?
SWEP.NPC_HasSecondaryFireSound = true -- Can the secondary fire sound be played?
SWEP.NPC_SecondaryFireSound = {} -- The sound it plays when the secondary fire is used
SWEP.NPC_SecondaryFireSoundLevel = 90 -- The sound level to use for the secondary firing sound
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Player Only ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Inventory-Related ====== --
SWEP.Slot = 2 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6)
SWEP.SlotPos = 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.Weight = 30 -- Decides whether we should switch from/to this
SWEP.AutoSwitchTo = false -- Auto switch to this weapon when it's picked up
SWEP.AutoSwitchFrom = false -- Auto switch weapon when the owner picks up a better weapon
SWEP.DrawWeaponInfoBox = true -- Should the information box show in the weapon selection menu?
SWEP.BounceWeaponIcon = true -- Should the icon bounce in the weapon selection menu?
	-- ====== Deployment ====== --
SWEP.AnimTbl_Deploy = ACT_VM_DRAW
SWEP.HasDeploySound = true -- Does the weapon have a deploy sound?
SWEP.DeploySound = {} -- Sound played when the weapon is deployed
	-- ====== Idle ====== --
SWEP.HasIdleAnimation = true -- Does it have a idle animation?
SWEP.AnimTbl_Idle = ACT_VM_IDLE
	-- ====== Reload ====== --
SWEP.HasReloadSound = false -- Does it have a reload sound? Remember even if this is set to false, the animation sound will still play!
SWEP.ReloadSound = {}
SWEP.AnimTbl_Reload = ACT_VM_RELOAD
SWEP.Reload_TimeUntilAmmoIsSet = 1 -- Time until ammo is set to the weapon
	-- ====== Secondary Fire ====== --
SWEP.Secondary.Automatic = false -- Should the weapon continue firing as long as the attack button is held down?
SWEP.Secondary.Ammo = "none" -- Ammo type
SWEP.Secondary.TakeAmmo = 1 -- How much ammo should it take on each shot?
SWEP.Secondary.ClipSize = 0 -- Max amount of rounds per clip
SWEP.Secondary.DefaultClip = 5 -- Default number of bullets in a clip | It will give this amount on initial pickup
	-- To let the base automatically detect the animation duration, set this to false:
SWEP.Secondary.Delay = false -- Time until it can shoot again
SWEP.AnimTbl_SecondaryFire = ACT_VM_SECONDARYATTACK
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Dry Fire ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Examples: Under water, out of ammo
SWEP.HasDryFireSound = true -- Should it play a sound when it's out of ammo?
SWEP.DryFireSound = {} -- The sound that it plays when the weapon is out of ammo
SWEP.DryFireSoundLevel = 50 -- Dry fire sound level
SWEP.DryFireSoundPitch = VJ.SET(90, 100) -- Dry fire sound pitch
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Primary Fire ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.DisableBulletCode = false -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Damage = 5
SWEP.Primary.PlayerDamage = "Same" -- For players only | "Same" = Same as self.Primary.Damage | "Double" = Double the self.Primary.Damage | number = Overrides self.Primary.Damage
SWEP.Primary.Automatic = true -- Should the weapon continue firing as long as the attack button is held down?
SWEP.Primary.AllowInWater = false -- Can it be fired in water?
SWEP.Primary.NumberOfShots = 1 -- How many shots per attack?
SWEP.Primary.Force = 5 -- Force applied on the object the bullet hits
SWEP.Primary.Recoil = 0.3 -- How much recoil does the player get?
SWEP.Primary.Cone = 7 -- How accurate is the bullet? (Players)
SWEP.Primary.Delay = 0.1 -- Time until it can shoot again
SWEP.Primary.Tracer = 1 -- Show tracer for every x bullets
SWEP.Primary.TracerType = "Tracer" -- Tracer type (Examples: AR2)
SWEP.Primary.TakeAmmo = 1 -- How much ammo should it take from the clip after each shot? | 0 = Unlimited clip
SWEP.Primary.Ammo = "SMG1" -- Ammo type
SWEP.Primary.ClipSize = 30 -- Max amount of rounds per clip
SWEP.Primary.PickUpAmmoAmount = "Default" -- How much ammo should the player get the gun is picked up? | "Default" = 3 Clips
SWEP.AnimTbl_PrimaryFire = ACT_VM_PRIMARYATTACK
	-- ====== Sound ====== --
SWEP.Primary.Sound = {}
SWEP.Primary.SoundLevel = 80
SWEP.Primary.SoundPitch	= VJ.SET(90, 110)
SWEP.Primary.SoundVolume = 1
SWEP.Primary.DistantSound = {}
SWEP.Primary.HasDistantSound = true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSoundLevel = 140
SWEP.Primary.DistantSoundPitch = VJ.SET(90, 110)
SWEP.Primary.DistantSoundVolume = 1
	-- ====== Effect ====== --
SWEP.PrimaryEffects_MuzzleFlash = true
SWEP.PrimaryEffects_MuzzleParticles = {"vj_rifle_full"}
SWEP.PrimaryEffects_MuzzleParticlesAsOne = false -- Should all the particles spawn together instead of picking only one?
SWEP.PrimaryEffects_MuzzleAttachment = "muzzle"
SWEP.PrimaryEffects_SpawnShells = true
SWEP.PrimaryEffects_ShellAttachment = "shell"
SWEP.PrimaryEffects_ShellType = "RifleShellEject" -- Pistol = "ShellEject" | Rifle = "RifleShellEject" | Shotgun = "ShotgunShellEject"
SWEP.PrimaryEffects_SpawnDynamicLight = true
SWEP.PrimaryEffects_DynamicLightBrightness = 4
SWEP.PrimaryEffects_DynamicLightDistance = 120
SWEP.PrimaryEffects_DynamicLightColor = Color(255, 150, 60)
	-- ====== Melee ====== --
SWEP.IsMeleeWeapon = false -- Should this weapon be a melee weapon?
SWEP.MeleeWeaponDistance = 60 -- If it's this close, it will attack
SWEP.MeleeWeaponSound_Hit = "physics/flesh/flesh_impact_bullet1.wav" -- Sound it plays when it hits something
SWEP.MeleeWeaponSound_Miss = "weapons/iceaxe/iceaxe_swing1.wav" -- Sound it plays when it misses (Doesn't hit anything)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Customization Functions ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Use the functions below to customize certain parts of the base or to add new custom systems
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init() end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnEquip(newOwner) end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDeploy() end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnThink() end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnGetBulletPos() end -- Return a position to override the bullet spawn position
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDrawWorldModel() return true end -- Return false to not draw the world model | This is client side only!
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnAnimEvent(pos, ang, event, options) end -- return true to disable the effect | For more info check here: https://wiki.facepunch.com/gmod/WEAPON:FireAnimationEvent
---------------------------------------------------------------------------------------------------------------------------------------------
--[[
Called whenever the weapon's primary attack is attempted to fire

=-=-=| PARAMETERS |=-=-=
	1. status [string] : Type of update that is occurring, holds one of the following states:
		-> "Initial" : Before the weapon fires its primary, this can be used to override the base code
				PARAMETERS
					2. statusData [nil]
				RETURNS
					-> [boolean] : return "true" to override the base primary attack
		-> "PostFire" : Right after the primary fire is used
				PARAMETERS
					2. statusData [nil]
				RETURNS
					-> nil
		-> "MeleeHit" : Called when the primary attack is melee and its hits an entity
				PARAMETERS
					2. statusData [entity] : The entity that got hit
				RETURNS
					-> nil
	2. statusData [nil | entity] : Depends on `status` value, refer to it for more details

=-=-=| RETURNS |=-=-=
	-> [nil | bool] : Depends on `status` value, refer to it for more details
--]]
function SWEP:OnPrimaryAttack(status, statusData) end
---------------------------------------------------------------------------------------------------------------------------------------------
-- More info: https://wiki.facepunch.com/gmod/Structures/Bullet#Callback
-- Can also give it the return table as seen in the link above
function SWEP:OnPrimaryAttack_BulletCallback(attacker, tr, dmginfo) end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_SecondaryFire_BeforeTimer(eneEnt, fireTime) end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_SecondaryFire()
	-- Override this function if you want to make your own secondary attack!
	local owner = self:GetOwner()
	local spawnPos = self:GetBulletPos()
	local projectile = ents.Create(self.NPC_SecondaryFireEnt)
	projectile:SetPos(spawnPos)
	projectile:SetAngles(owner:GetAngles())
	projectile:SetOwner(owner)
	projectile:Spawn()
	projectile:Activate()
	local phys = projectile:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		if phys:IsGravityEnabled() then
			phys:SetVelocity(VJ.CalculateTrajectory(owner, owner:GetEnemy(), "Curve", projectile:GetPos(), 1, 1))
		else
			phys:SetVelocity(VJ.CalculateTrajectory(owner, owner:GetEnemy(), "Line", projectile:GetPos(), 1, 2000))
		end
		projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnSecondaryAttack() end -- Players only! | Return true to override base code
---------------------------------------------------------------------------------------------------------------------------------------------
--[[
Called whenever the weapon is reloaded

=-=-=| PARAMETERS |=-=-=
	1. status [string] : Type of update that is occurring, holds one of the following states:
		-> "Start" : When the weapon reload starts before anything is set such as the animation or clip
				RETURNS
					-> nil
		-> "Finish" : Right after the flinch reload animation has finished | Only called for players and VJ Humans!
				RETURNS
					-> [boolean] : return "true" to override the base code including setting the clip and removing reserve ammo

=-=-=| RETURNS |=-=-=
	-> [nil | bool] : Depends on `status` value, refer to it for more details
--]]
function SWEP:OnReload(status) end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnHolster(newWep) return true end -- Return false to disallow the weapon from switching
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnRemove() end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ ///// WARNING: Don't touch anything below this line! \\\\\ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.RenderGroup = RENDERGROUP_OPAQUE

SWEP.Reloading = false
SWEP.NextReloadT = 0
SWEP.NextIdleT = 0
SWEP.InitHasIdleAnimation = false
SWEP.Primary.DefaultClip = 0
SWEP.NextNPCDrySoundT = 0
SWEP.NPC_NextPrimaryFireT = 0
SWEP.NPC_AnimationSet = VJ.ANIM_SET_CUSTOM
SWEP.NPC_SecondaryFireNextT = 0
SWEP.LastOwner = NULL
SWEP.InitTime = 0 -- Holds the CurTime that it was spawned at, used to make sure spawned weapons can be given to the player without needing to press USE on it

local cv_muszzleflash = GetConVar("vj_wep_nomuszzleflash")
local cv_dynamiclight = GetConVar("vj_wep_nomuszzleflash_dynamiclight")
local cv_bulletshells = GetConVar("vj_wep_nobulletshells")
---------------------------------------------------------------------------------------------------------------------------------------------
local oldShells = {VJ_Weapon_PistolShell1 = "ShellEject", VJ_Weapon_RifleShell1 = "RifleShellEject", VJ_Weapon_ShotgunShell1 = "ShotgunShellEject"} -- !!!!!!!!!!!!!! DO NOT USE THESE VALUES !!!!!!!!!!!!!! [Backwards Compatibility!]
--
function SWEP:Initialize()
	self.InitTime = CurTime()
	self.PrimaryEffects_ShellType = oldShells[self.PrimaryEffects_ShellType] or self.PrimaryEffects_ShellType -- !!!!!!!!!!!!!! DO NOT USE THESE VALUES !!!!!!!!!!!!!! [Backwards Compatibility!]
	self:SetHoldType(self.HoldType)
	if self.HasIdleAnimation == true then self.InitHasIdleAnimation = true end
	self.NPC_SecondaryFireNextT = CurTime() + math.Rand(self.NPC_SecondaryFireNext.a, self.NPC_SecondaryFireNext.b)
	self:Init()
	
	-- !!!!!!!!!!!!!! DO NOT USE !!!!!!!!!!!!!! [Backwards Compatibility!]
	if self.CustomOnInitialize then self:CustomOnInitialize() end
	if self.CustomOnThink then self.OnThink = function() self:CustomOnThink() end end
	if self.CustomOnInitialize then self:CustomOnInitialize() end
	if self.CustomOnEquip then self.OnEquip = function(_, newOwner) self:CustomOnEquip(newOwner) end end
	if self.CustomOnDeploy then self.OnDeploy = function() self:CustomOnDeploy() end end
	if self.CustomBulletSpawnPosition then self.OnGetBulletPos = function() return self:CustomBulletSpawnPosition() end end
	if self.CustomOnDrawWorldModel then self.OnDrawWorldModel = function() return self:CustomOnDrawWorldModel() end end
	if self.CustomOnFireAnimationEvent then self.OnAnimEvent = function(_, pos, ang, event, options) return self:CustomOnFireAnimationEvent(pos, ang, event, options) end end
	if self.CustomOnHolster then self.OnHolster = function(_, newWep) return self:CustomOnHolster(newWep) end end
	if self.CustomOnReload or self.CustomOnReload_Finish then
		self.OnReload = function(_, status)
			if status == "Start" && self.CustomOnReload then
				self:CustomOnReload()
			elseif status == "Finish" && self.CustomOnReload_Finish then
				return !self:CustomOnReload_Finish()
			end
		end
	end
	if self.CustomOnPrimaryAttack_BeforeShoot or self.CustomOnPrimaryAttack_AfterShoot or self.CustomOnPrimaryAttack_MeleeHit then
		self.OnPrimaryAttack = function(_, status, statusData)
			if status == "Initial" && self.CustomOnPrimaryAttack_BeforeShoot then
				return self:CustomOnPrimaryAttack_BeforeShoot()
			elseif status == "PostFire" && self.CustomOnPrimaryAttack_AfterShoot then
				self:CustomOnPrimaryAttack_AfterShoot()
			elseif status == "MeleeHit" && self.CustomOnPrimaryAttack_MeleeHit then
				self:CustomOnPrimaryAttack_MeleeHit(statusData)
			end
		end
	end
	if self.CustomOnPrimaryAttack_BulletCallback then self.OnPrimaryAttack_BulletCallback = function(_, attacker, tr, dmginfo) return self:CustomOnPrimaryAttack_BulletCallback(attacker, tr, dmginfo) end end
	if self.CustomOnSecondaryAttack then self.OnSecondaryAttack = function() return !self:CustomOnSecondaryAttack() end end
	--
	
	//if SERVER then
		//self:SetWeaponHoldType(self.HoldType)
		//self:SetNPCMinBurst(10)
		//self:SetNPCMaxBurst(20)
		//self:SetNPCFireRate(10)
	//end
	self:SetDefaultValues(self.HoldType)
	//self:SetKeyValue("spawnflags", bit.bor(SF_WEAPON_NO_PLAYER_PICKUP))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:GetCapabilities()
	return bit.bor(CAP_WEAPON_RANGE_ATTACK1, CAP_INNATE_RANGE_ATTACK1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:SetDefaultValues(holdType)
	if holdType == "pistol" then
		if VJ.PICK(self.DeploySound) == false then self.DeploySound = "VJ.Weapon.Draw_Pistol" end
		if VJ.PICK(self.DryFireSound) == false then self.DryFireSound = "vj_base/weapons/dryfire_pistol.wav" end
		if VJ.PICK(self.NPC_ReloadSound) == false then self.NPC_ReloadSound = "vj_base/weapons/reload_pistol.wav" end
	elseif holdType == "revolver" then
		if VJ.PICK(self.DeploySound) == false then self.DeploySound = "VJ.Weapon.Draw_Pistol" end
		if VJ.PICK(self.DryFireSound) == false then self.DryFireSound = "vj_base/weapons/dryfire_revolver.wav" end
		if VJ.PICK(self.NPC_ReloadSound) == false then self.NPC_ReloadSound = "vj_base/weapons/reload_revolver.wav" end
	elseif holdType == "shotgun" or holdType == "crossbow" then
		if VJ.PICK(self.DeploySound) == false then self.DeploySound = "VJ.Weapon.Draw_Rifle" end
		if VJ.PICK(self.DryFireSound) == false then self.DryFireSound = "vj_base/weapons/dryfire_rifle.wav" end
		if VJ.PICK(self.NPC_ReloadSound) == false then self.NPC_ReloadSound = "vj_base/weapons/reload_shotgun.wav" end
	elseif holdType == "rpg" then
		if VJ.PICK(self.DeploySound) == false then self.DeploySound = "VJ.Weapon.Draw_Rifle" end
		if VJ.PICK(self.DryFireSound) == false then self.DryFireSound = "vj_base/weapons/dryfire_rifle.wav" end
		if VJ.PICK(self.NPC_ReloadSound) == false then self.NPC_ReloadSound = "vj_base/weapons/reload_rpg.wav" end
	elseif holdType == "melee" or holdType == "melee2" or holdType == "knife" then
		self.DeploySound = "VJ.Weapon.Draw_Rifle"
		self.HasDryFireSound = false
		self.NPC_HasReloadSound = false
	else -- "smg", "ar2" and any other that didn't match
		if VJ.PICK(self.DeploySound) == false then self.DeploySound = "VJ.Weapon.Draw_Rifle" end
		if VJ.PICK(self.DryFireSound) == false then self.DryFireSound = "vj_base/weapons/dryfire_rifle.wav" end
		if VJ.PICK(self.NPC_ReloadSound) == false then self.NPC_ReloadSound = "vj_base/weapons/reload_rifle.wav" end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Equip(newOwner)
	-- Do NOT set the clip if this is simply a weapon switch (Specifically for VJ NPCs)
	if self.LastOwner == NULL then
		self:SetClip1(self.Primary.ClipSize)
	end
	if newOwner:IsPlayer() then
		local replacementWep = self.ReplacementWeapon
		if replacementWep then
			if isstring(replacementWep) then replacementWep = {replacementWep} end
			for _, weapon in ipairs(replacementWep) do
				-- Go in order until a weapon is valid
				if IsValid(newOwner:Give(weapon)) then
					self:Remove()
					return
				elseif newOwner:HasWeapon(weapon) then -- Failed to give weapon, check if it already has it!
					local actualWeapon = newOwner:GetWeapon(weapon)
					local ammoType = actualWeapon:GetPrimaryAmmoType()
					if ammoType != -1 then -- Give a clip of the replacement weapon
						newOwner:GiveAmmo(actualWeapon:GetMaxClip1(), ammoType)
					end
					self:Remove()
					return
				end
			end
		end
		if !self.IsMeleeWeapon then
			if self.Primary.PickUpAmmoAmount == "Default" then
				newOwner:GiveAmmo(self.Primary.ClipSize * 2, self.Primary.Ammo)
			elseif isnumber(self.Primary.PickUpAmmoAmount) then
				newOwner:GiveAmmo(self.Primary.PickUpAmmoAmount, self.Primary.Ammo)
			end
		end
		//newOwner:RemoveAmmo(self.Primary.DefaultClip,self.Primary.Ammo)
		if self.MadeForNPCsOnly == true then
			newOwner:PrintMessage(HUD_PRINTTALK, self.PrintName.." removed! It's made for NPCs only!")
			self:Remove()
		end
	elseif newOwner:IsNPC() then
		hook.Add("Think", self, self.NPC_ServerNextFire)
		if newOwner.IsVJBaseSNPC then
			if newOwner.IsVJBaseSNPC_Human then
				newOwner.Weapon_OriginalFiringDistanceFar = newOwner.Weapon_OriginalFiringDistanceFar or newOwner.Weapon_FiringDistanceFar
				if self.IsMeleeWeapon then
					newOwner.Weapon_FiringDistanceFar = self.MeleeWeaponDistance
				else
					newOwner.Weapon_FiringDistanceFar = math.Clamp(newOwner.Weapon_OriginalFiringDistanceFar * self.NPC_FiringDistanceScale, newOwner.Weapon_FiringDistanceClose, self.NPC_FiringDistanceMax)
				end
			end
		else -- For non-VJ NPCs
			if VJ.AnimExists(newOwner,ACT_WALK_AIM_PISTOL) == true && VJ.AnimExists(newOwner,ACT_RUN_AIM_PISTOL) == true && VJ.AnimExists(newOwner,ACT_POLICE_HARASS1) == true then
				self.NPC_AnimationSet = VJ.ANIM_SET_METROCOP
			elseif VJ.AnimExists(newOwner,"cheer1") == true && VJ.AnimExists(newOwner,"wave_smg1") == true && VJ.AnimExists(newOwner,ACT_BUSY_SIT_GROUND) == true then
				self.NPC_AnimationSet = VJ.ANIM_SET_REBEL
			elseif VJ.AnimExists(newOwner,"signal_takecover") == true && VJ.AnimExists(newOwner,"grenthrow") == true && VJ.AnimExists(newOwner,"bugbait_hit") == true then
				self.NPC_AnimationSet = VJ.ANIM_SET_COMBINE
			end
			if newOwner:GetClass() == "npc_citizen" then newOwner:Fire("DisableWeaponPickup") end -- If it's a citizen, disable them picking up weapons from the ground
			newOwner:SetKeyValue("spawnflags", "256") -- Long Visibility Shooting since HL2 NPCs are blind
		end
	end
	self:OnEquip(newOwner)
	self.LastOwner = newOwner
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:EquipAmmo(ply)
	if ply:IsPlayer() then
		ply:GiveAmmo(self.Primary.ClipSize, self.Primary.Ammo)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Deploy()
	if self.InitHasIdleAnimation == true then self.HasIdleAnimation = true end
	local owner = self:GetOwner()
	self:OnDeploy()
	if owner:IsNPC() then
		hook.Add("Think", self, self.NPC_ServerNextFire)
	elseif owner:IsPlayer() then
		if self.HasDeploySound == true then
			local deploySD = VJ.PICK(self.DeploySound)
			if deploySD then
				self:EmitSound(deploySD, 50, math.random(90, 100))
			end
		end
		local curTime = CurTime()
		local anim = VJ.PICK(self.AnimTbl_Deploy)
		local animTime = VJ.AnimDuration(owner:GetViewModel(), anim)
		self:SendWeaponAnim(anim)
		self:SetNextPrimaryFire(curTime + animTime)
		self:SetNextSecondaryFire(curTime + animTime)
		self.NextIdleT = curTime + animTime
		self.NextReloadT = curTime + animTime
	end
	return true -- Or else the player won't be able to get the weapon!
end
---------------------------------------------------------------------------------------------------------------------------------------------
local commonAttachmentNames = {
    muzzle = true,
    muzzleA = true,
    muzzle_flash = true,
    muzzle_flash1 = true,
    muzzle_flash2 = true,
    ["ValveBiped.muzzle"] = true
}
--
function SWEP:GetBulletPos()
	local owner = self:GetOwner()
	if !IsValid(owner) then return self:GetPos() end -- Fail safe
	if owner:IsPlayer() then return owner:GetShootPos() end -- Players always use "GetShootPos"!
	
	-- Custom Position
	local customPos = self:OnGetBulletPos()
	if customPos then
		return customPos
	end
	
	-- Attachment
	local bulletAttach = self.NPC_BulletSpawnAttachment
	if bulletAttach != "" then
		local attach = self:LookupAttachment(bulletAttach)
		if attach != 0 && attach != -1 then
			return self:GetAttachment(attach).Pos
		end
	end
	
	-- Try to find a common attachment
	local attachments = self:GetAttachments()
	for i = 1, #attachments do
		local attachmentName = attachments[i].name
		if commonAttachmentNames[attachmentName] then
			return self:GetAttachment(self:LookupAttachment(attachmentName)).Pos
		end
	end
	
	-- Try to find a common bone
	local bone = owner:LookupBone("ValveBiped.Bip01_R_Hand")
	if bone then
		return owner:GetBonePosition(bone)
	end
	
	-- Everything else has failed, post a warning and use eye position!
	print("WARNING: "..self:GetClass().." doesn't have a custom position or attachment or bone for bullet spawn! Using EyePos!")
	return owner:EyePos()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Think() -- NOTE: This only runs for players not NPCs!
	self:OnThink()
	if SERVER then
		self:MaintainWorldModel()
		self:DoIdleAnimation()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_ServerNextFire()
	if !IsValid(self) then return end
	local owner = self:GetOwner()
	if !IsValid(owner) or !owner:IsNPC() or owner:GetActiveWeapon() != self then return end
	
	self:MaintainWorldModel()
	self:OnThink()
	
	if self.NPC_NextPrimaryFire && CurTime() > self.NPC_NextPrimaryFireT && self:NPC_CanFire() then
		self:NPCShoot_Primary()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_CanFire()
	local owner = self:GetOwner()
	if IsValid(owner) && owner:IsNPC() then
		local ene = owner:GetEnemy()
		if (owner.IsVJBaseSNPC_Human && IsValid(ene) && !owner:CanFireWeapon(true, true)) or (self.NPC_StandingOnly && owner:IsMoving()) then
			return false
		end
		if (owner.IsVJBaseSNPC_Human && owner.DoingWeaponAttack && (VJ.IsCurrentAnimation(owner, owner.CurrentWeaponAnimation) or (!owner.DoingWeaponAttack_Standing))) or (!owner.IsVJBaseSNPC_Human) then
			-- For VJ Humans only, ammo check
			if owner.IsVJBaseSNPC_Human && owner.Weapon_CanReload && self:Clip1() <= 0 then -- No ammo!
				if owner.VJ_IsBeingControlled then owner.VJ_TheController:PrintMessage(HUD_PRINTCENTER, "Press R to reload!") end
				if !self.IsMeleeWeapon && self.HasDryFireSound && CurTime() > self.NextNPCDrySoundT then
					local sdTbl = VJ.PICK(self.DryFireSound)
					if sdTbl != false then owner:EmitSound(sdTbl, 80, math.random(self.DryFireSoundPitch.a, self.DryFireSoundPitch.b), 1, CHAN_AUTO, 0, 0, VJ_RecipientFilter) end
					if self.NPC_NextPrimaryFire != false then
						self.NextNPCDrySoundT = CurTime() + self.NPC_NextPrimaryFire
					end
				end
				return false
			end
			if IsValid(ene) && ((!owner.VJ_IsBeingControlled) or (owner.VJ_IsBeingControlled && owner.VJ_TheController:KeyDown(IN_ATTACK2))) then
				-- Check to make sure the enemy is within the firing cone!
				local spawnPos = self:GetPos() //self:GetBulletPos() -- Because "GetBulletPos" is VERY costly sadly =(
				local aimPos = owner.IsVJBaseSNPC and owner:GetAimPosition(ene, spawnPos, 0) or ene:BodyTarget(spawnPos)
				local aimDir = aimPos - spawnPos
				local sightDir = owner:GetInternalVariable("m_latchedHeadDirection") // owner:GetForward() -- Owner's sight direction
				aimDir.z = 0
				aimDir:Normalize()
				sightDir.z = 0
				sightDir:Normalize()
				//print(sightDir:Dot(aimDir))
				//debugoverlay.Line(spawnPos, spawnPos + aimDir * 10000, 2, Color(255, 0, 0), true) -- Red: Direction to enemy
				//debugoverlay.Line(spawnPos, spawnPos + sightDir * 10000, 2, Color(0, 255, 0), true) -- Green: Aim direction
				return sightDir:Dot(aimDir) > self.NPC_FiringCone
			end
		end
	end
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPCShoot_Primary()
	local owner = self:GetOwner()
	if !IsValid(owner) then return end
	local ene = owner:GetEnemy()
	if !owner.VJ_IsBeingControlled && (!IsValid(ene) or (!owner:Visible(ene))) then return end
	if owner.IsVJBaseSNPC then
		owner:UpdatePoseParamTracking()
	end
	
	-- Secondary Fire
	if self.NPC_HasSecondaryFire && owner.CanUseSecondaryOnWeaponAttack && CurTime() > self.NPC_SecondaryFireNextT && ene:GetPos():Distance(owner:GetPos()) <= self.NPC_SecondaryFireDistance then
		if math.random(1, self.NPC_SecondaryFireChance) == 1 then
			local anim, animDur = owner:PlayAnim(VJ.PICK(owner.AnimTbl_WeaponAttackSecondary), true, false, true)
			local fireTime = (anim == ACT_INVALID and 0) or owner.WeaponAttackSecondaryTimeUntilFire or animDur
				-- If no animation was found then fireTime is 0, otherwise if "WeaponAttackSecondaryTimeUntilFire" is false then use animation time
			self:NPC_SecondaryFire_BeforeTimer(ene, fireTime)
			timer.Simple(fireTime, function()
				if IsValid(self) && IsValid(owner) && IsValid(owner:GetEnemy()) && CurTime() > self.NPC_SecondaryFireNextT && (anim == ACT_INVALID or (anim && VJ.IsCurrentAnimation(owner, anim))) then -- ONLY check for cur anim IF it even had one!
					self:NPC_SecondaryFire()
					if self.NPC_HasSecondaryFireSound then
						local fireSd = VJ.PICK(self.NPC_SecondaryFireSound)
						if fireSd != false then
							self:EmitSound(fireSd, self.NPC_SecondaryFireSoundLevel, math.random(90, 110), 1, CHAN_WEAPON, 0, 0, VJ_RecipientFilter)
						end
					end
					self.NPC_SecondaryFireNextT = CurTime() + math.Rand(self.NPC_SecondaryFireNext.a, self.NPC_SecondaryFireNext.b)
				end
			end)
			return
		else
			self.NPC_SecondaryFireNextT = CurTime() + math.Rand(self.NPC_SecondaryFireNext.a, self.NPC_SecondaryFireNext.b)
		end
	end
	
	-- Primary Fire
	timer.Simple(self.NPC_TimeUntilFire, function()
		if IsValid(self) && IsValid(owner) && self:NPC_CanFire() && CurTime() > self.NPC_NextPrimaryFireT then
			self:PrimaryAttack()
			if self.NPC_NextPrimaryFire != false then -- Support for animation events
				self.NPC_NextPrimaryFireT = CurTime() + self.NPC_NextPrimaryFire
				for _, tv in ipairs(self.NPC_TimeUntilFireExtraTimers) do
					timer.Simple(tv, function() if IsValid(self) && IsValid(owner) && self:NPC_CanFire() then self:PrimaryAttack() end end)
				end
			end
			if owner.IsVJBaseSNPC then owner.Weapon_TimeSinceLastShot = CurTime() end
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttack(UseAlt)
	//if self:GetOwner():KeyDown(IN_RELOAD) then return end
	//self:GetOwner():SetFOV(45, 0.3)
	//if !IsFirstTimePredicted() then return end
	
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	local owner = self:GetOwner()
	local isNPC = owner:IsNPC()
	local isPly = owner:IsPlayer()
	
	if self.Reloading or self:GetNextSecondaryFire() > CurTime() then return end
	if isNPC && !owner.VJ_IsBeingControlled && !IsValid(owner:GetEnemy()) then return end -- If the NPC owner isn't being controlled and doesn't have an enemy, then return end
	if self.IsMeleeWeapon == false && ((isPly && self.Primary.AllowInWater == false && owner:WaterLevel() == 3) or (self:Clip1() <= 0)) then
		if SERVER then
			owner:EmitSound(VJ.PICK(self.DryFireSound), self.DryFireSoundLevel, math.random(self.DryFireSoundPitch.a, self.DryFireSoundPitch.b))
		end
		return
	end
	if (!self:CanPrimaryAttack()) then return end
	if self:OnPrimaryAttack("Initial") == true then return end
	
	if isNPC && owner.IsVJBaseSNPC then
		timer.Simple(self.NPC_ExtraFireSoundTime, function()
			if IsValid(self) && IsValid(owner) then
				VJ.EmitSound(owner, self.NPC_ExtraFireSound, self.NPC_ExtraFireSoundLevel, math.Rand(self.NPC_ExtraFireSoundPitch.a, self.NPC_ExtraFireSoundPitch.b))
			end
		end)
	end
	
	-- Firing Sounds
	if SERVER then
		local fireSd = VJ.PICK(self.Primary.Sound)
		if fireSd != false then
			self:EmitSound(fireSd, self.Primary.SoundLevel, math.random(self.Primary.SoundPitch.a, self.Primary.SoundPitch.b), self.Primary.SoundVolume, CHAN_WEAPON, 0, 0, VJ_RecipientFilter)
			//EmitSound(fireSd, owner:GetPos(), owner:EntIndex(), CHAN_WEAPON, 1, 140, 0, 100, 0, filter)
			//sound.Play(fireSd, owner:GetPos(), self.Primary.SoundLevel, math.random(self.Primary.SoundPitch.a, self.Primary.SoundPitch.b), self.Primary.SoundVolume)
		end
		if self.Primary.HasDistantSound then
			local fireFarSd = VJ.PICK(self.Primary.DistantSound)
			if fireFarSd != false then
				-- Use "CHAN_AUTO" instead of "CHAN_WEAPON" otherwise it will override primary firing sound because it's also "CHAN_WEAPON"
				self:EmitSound(fireFarSd, self.Primary.DistantSoundLevel, math.random(self.Primary.DistantSoundPitch.a, self.Primary.DistantSoundPitch.b), self.Primary.DistantSoundVolume, CHAN_AUTO, 0, 0, VJ_RecipientFilter)
			end
		end
	end
	
	-- Firing Gesture
	if owner.IsVJBaseSNPC_Human && owner.DisableWeaponFiringGesture != true then
		owner:PlayAnim(owner:TranslateActivity(VJ.PICK(owner.AnimTbl_WeaponAttackFiringGesture)), false, false, false, 0, {AlwaysUseGesture=true})
	end
	
	-- MELEE WEAPON
	if self.IsMeleeWeapon then
		local meleeHitEnt = false
		for _,v in ipairs(ents.FindInSphere(owner:GetPos(), self.MeleeWeaponDistance + 20)) do
			if (v.IsVJBaseBullseye && v.VJ_IsBeingControlled) or (v:IsPlayer() && v.VJTag_IsControllingNPC == true) then continue end -- If it's a bullseye and is controlled OR it's a player controlling then don't damage!
			if (isPly && v:EntIndex() != owner:EntIndex()) or (isNPC && (v:IsNPC() or (v:IsPlayer() && v:Alive() && !VJ_CVAR_IGNOREPLAYERS) or v:IsNextBot()) && (owner:Disposition(v) != D_LI) && (v != owner) && (v:GetClass() != owner:GetClass()) or (v:GetClass() == "prop_physics") or v.VJTag_IsAttackable == true or v.VJTag_IsDamageable == true && (owner:GetForward():Dot((v:GetPos() - owner:GetPos()):GetNormalized()) > math.cos(math.rad(owner.MeleeAttackDamageAngleRadius)))) then
				local dmginfo = DamageInfo()
				dmginfo:SetDamage(isNPC and owner:ScaleByDifficulty(self.Primary.Damage) or self.Primary.Damage)
				if v:IsNPC() or v:IsPlayer() then dmginfo:SetDamageForce(owner:GetForward() * ((dmginfo:GetDamage() + 100) * 70)) end
				dmginfo:SetInflictor(owner)
				dmginfo:SetAttacker(owner)
				dmginfo:SetDamageType(DMG_CLUB)
				VJ.DamageSpecialEnts(owner, v, dmginfo)
				v:TakeDamageInfo(dmginfo, owner)
				if v:IsPlayer() then
					v:ViewPunch(Angle(math.random(-1, 1)*10, math.random(-1, 1)*10, math.random(-1, 1)*10))
				end
				self:OnPrimaryAttack("MeleeHit", v)
				meleeHitEnt = true
			end
		end
		if meleeHitEnt then
			local meleeSd = VJ.PICK(self.MeleeWeaponSound_Hit)
			if meleeSd != false then
				self:EmitSound(meleeSd, 70, math.random(90, 100), 1, CHAN_AUTO, 0, 0, VJ_RecipientFilter)
			end
		else
			if owner.IsVJBaseSNPC == true then owner:CustomOnMeleeAttack_Miss() end
			local meleeSd = VJ.PICK(self.MeleeWeaponSound_Miss)
			if meleeSd != false then
				self:EmitSound(meleeSd, 70, math.random(90, 100), 1, CHAN_AUTO, 0, 0, VJ_RecipientFilter)
			end
		end
	-- REGULAR WEAPON (NON-MELEE)
	else
		if !self.Primary.DisableBulletCode then
			local bullet = {}
				bullet.Num = self.Primary.NumberOfShots
				bullet.Tracer = self.Primary.Tracer
				bullet.TracerName = self.Primary.TracerType
				bullet.Force = self.Primary.Force
				bullet.AmmoType = self.Primary.Ammo
				
				-- Bullet spawn position & spread & damage
				if isPly then
					bullet.Spread = Vector((self.Primary.Cone / 60) / 4, (self.Primary.Cone / 60) / 4, 0)
					bullet.Src = owner:GetShootPos()
					bullet.Dir = owner:GetAimVector()
					local plyDmg = self.Primary.PlayerDamage
					if plyDmg == "Same" then
						bullet.Damage = self.Primary.Damage
					elseif plyDmg == "Double" then
						bullet.Damage = self.Primary.Damage * 2
					elseif isnumber(plyDmg) then
						bullet.Damage = plyDmg
					end
				elseif owner.IsVJBaseSNPC then
					local ene = owner:GetEnemy()
					local spawnPos = self:GetBulletPos()
					local aimPos = owner:GetAimPosition(ene, spawnPos, 0)
					local spread = owner:CalcAimSpread(ene, aimPos, self.NPC_CustomSpread or 1) // owner:GetPos():Distance(owner.VJ_TheController:GetEyeTrace().HitPos) -- Was used when NPC was being controlled
					bullet.Spread = Vector(spread, spread, 0)
					bullet.Dir = (aimPos - spawnPos):GetNormal()
					bullet.Src = spawnPos
					bullet.Damage = owner:ScaleByDifficulty(self.Primary.Damage)
				else
					local spawnPos = self:GetBulletPos()
					bullet.Spread = Vector(0.05, 0.05, 0)
					bullet.Dir = (owner:GetEnemy():BodyTarget(spawnPos) - spawnPos):GetNormal()
					bullet.Src = spawnPos
					bullet.Damage = self.Primary.Damage
				end
				
				-- Callback
				bullet.Callback = function(attacker, tr, dmginfo)
					return self:OnPrimaryAttack_BulletCallback(attacker, tr, dmginfo)
					/*local laserhit = EffectData()
					laserhit:SetOrigin(tr.HitPos)
					laserhit:SetNormal(tr.HitNormal)
					laserhit:SetScale(25)
					util.Effect("AR2Impact", laserhit)
					tr.HitPos:Ignite(8,0)*/
				end
			owner:FireBullets(bullet)
		end
		if cv_muszzleflash:GetInt() == 0 then owner:MuzzleFlash() end
	end
	
	if !self.IsMeleeWeapon then -- Melee weapons shouldn't consume ammo!
		if isPly then -- "TakePrimaryAmmo" calls "Ammo1" and "RemoveAmmo" which do NOT exist in NPCs!
			self:TakePrimaryAmmo(self.Primary.TakeAmmo)
		else
			self:SetClip1(self:Clip1() - self.Primary.TakeAmmo)
		end
	end
	
	self:PrimaryAttackEffects(owner)
	
	if isPly then
		//self:ShootEffects("ToolTracer") -- Deprecated
		owner:ViewPunch(Angle(-self.Primary.Recoil, 0, 0))
		owner:SetAnimation(PLAYER_ATTACK1)
		local anim = VJ.PICK(self.AnimTbl_PrimaryFire)
		local animTime = VJ.AnimDuration(owner:GetViewModel(), anim)
		self:SendWeaponAnim(anim)
		self.NextIdleT = CurTime() + animTime
		self.NextReloadT = CurTime() + animTime
	end
	self:OnPrimaryAttack("PostFire")
	//self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
	if self.IsMeleeWeapon == true then return end
	if self.CustomOnPrimaryAttackEffects && self:CustomOnPrimaryAttackEffects(owner) == false then return end -- !!!!!!!!!!!!!! DO NOT USE !!!!!!!!!!!!!! [Backwards Compatibility!]
	owner = owner or self:GetOwner()
	
	if cv_muszzleflash:GetInt() == 0 then
		-- MUZZLE FLASH
		if self.PrimaryEffects_MuzzleFlash == true then
			local muzzleAttach = self.PrimaryEffects_MuzzleAttachment
			if !isnumber(muzzleAttach) then muzzleAttach = self:LookupAttachment(muzzleAttach) end
			-- Players
			if owner:IsPlayer() && owner:GetViewModel() != nil then
				local muzzleFlashEffect = EffectData()
				muzzleFlashEffect:SetOrigin(owner:GetShootPos())
				muzzleFlashEffect:SetEntity(self)
				muzzleFlashEffect:SetStart(owner:GetShootPos())
				muzzleFlashEffect:SetNormal(owner:GetAimVector())
				muzzleFlashEffect:SetAttachment(muzzleAttach)
				util.Effect("VJ_Weapon_PlayerMuzzle", muzzleFlashEffect)
			else -- NPCs
				if self.PrimaryEffects_MuzzleParticlesAsOne == true then -- Combine all of the particles in the table!
					for _, v in ipairs(self.PrimaryEffects_MuzzleParticles) do
						ParticleEffectAttach(v, PATTACH_POINT_FOLLOW, self, muzzleAttach)
					end
				else
					ParticleEffectAttach(VJ.PICK(self.PrimaryEffects_MuzzleParticles), PATTACH_POINT_FOLLOW, self, muzzleAttach)
				end
			end
		end
		
		-- MUZZLE DYNAMIC LIGHT
		if SERVER && self.PrimaryEffects_SpawnDynamicLight == true && cv_dynamiclight:GetInt() == 0 then
			local muzzleLight = ents.Create("light_dynamic")
			muzzleLight:SetKeyValue("brightness", self.PrimaryEffects_DynamicLightBrightness)
			muzzleLight:SetKeyValue("distance", self.PrimaryEffects_DynamicLightDistance)
			if owner:IsPlayer() then muzzleLight:SetLocalPos(owner:GetShootPos() + self:GetForward()*40 + self:GetUp()*-10) else muzzleLight:SetLocalPos(self:GetBulletPos()) end
			muzzleLight:SetLocalAngles(self:GetAngles())
			muzzleLight:Fire("Color", self.PrimaryEffects_DynamicLightColor.r.." "..self.PrimaryEffects_DynamicLightColor.g.." "..self.PrimaryEffects_DynamicLightColor.b)
			//muzzleLight:SetParent(self)
			muzzleLight:Spawn()
			muzzleLight:Activate()
			muzzleLight:Fire("TurnOn", "", 0)
			muzzleLight:Fire("Kill", "", 0.07)
			self:DeleteOnRemove(muzzleLight)
		end
	end

	-- SHELL CASING
	if !owner:IsPlayer() && self.PrimaryEffects_SpawnShells == true && cv_bulletshells:GetInt() == 0 then
		local shellAttach = self.PrimaryEffects_ShellAttachment
		if !isnumber(shellAttach) then shellAttach = self:LookupAttachment(shellAttach) end
		shellAttach = self:GetAttachment(shellAttach)
		if !shellAttach then -- No attachment found, so just use some default pos & ang
			shellAttach = {Pos = owner:GetShootPos(), Ang = self:GetAngles()}
		end
		local effectData = EffectData()
		effectData:SetEntity(self)
		effectData:SetOrigin(shellAttach.Pos)
		effectData:SetAngles(shellAttach.Ang)
		util.Effect(self.PrimaryEffects_ShellType, effectData, true, true)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CanSecondaryAttack()
	return self:Clip2() > 0 && self:GetNextSecondaryFire() < CurTime() && self.Secondary.Ammo != "none"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:SecondaryAttack()
	if self:Ammo2() <= 0 or self.Reloading then return end // !self:CanSecondaryAttack()
	if self:OnSecondaryAttack() == true then return end
	
	local owner = self:GetOwner()
	self:TakeSecondaryAmmo(self.Secondary.TakeAmmo)
	owner:SetAnimation(PLAYER_ATTACK1)
	local anim = VJ.PICK(self.AnimTbl_SecondaryFire)
	local animTime = VJ.AnimDuration(owner:GetViewModel(), anim)
	self:SendWeaponAnim(anim)
	self.NextIdleT = CurTime() + animTime
	self.NextReloadT = CurTime() + animTime
	
	self:SetNextSecondaryFire(CurTime() + (self.Secondary.Delay == false and animTime or self.Secondary.Delay))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:DoIdleAnimation()
	if !self.HasIdleAnimation or CurTime() < self.NextIdleT then return end
	local owner = self:GetOwner()
	if IsValid(owner) then
		owner:SetAnimation(PLAYER_IDLE)
		local anim = VJ.PICK(self.AnimTbl_Idle)
		local animTime = VJ.AnimDuration(owner:GetViewModel(), anim)
		self:SendWeaponAnim(anim)
		self.NextIdleT = CurTime() + animTime
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:TranslateActivity(act)
	local owner = self:GetOwner()
	if (owner:IsNPC()) then
		if owner.IsVJBaseSNPC then
			local wepT = owner.AnimationTranslations[act]
			if (wepT) then
				if istable(wepT) then
					return VJ.PICK(wepT)
				end
				return wepT
			end
		elseif (self.ActivityTranslateAI[act]) then -- For non-VJ NPCs
			return self.ActivityTranslateAI[act]
		end
		return -1
	end
	
	-- For non-NPCs
	if self.ActivityTranslate[act] != nil then
		return self.ActivityTranslate[act]
	end
	return -1
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:FireAnimationEvent(pos, ang, event, options)
	if self:OnAnimEvent(pos, ang, event, options) == true then
		return true
	elseif event == 22 or event == 6001 then
		return true
	elseif cv_muszzleflash:GetInt() == 1 && (event == 21 or event == 5001 or event == 5003) then
		return true
	elseif cv_bulletshells:GetInt() == 1 && event == 20 then
		return true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Reload()
	if !IsValid(self) then return end
	local owner = self:GetOwner()
	if !IsValid(owner) or !owner:IsPlayer() or !owner:Alive() or owner:GetAmmoCount(self.Primary.Ammo) == 0 or self.Reloading or CurTime() < self.NextReloadT then return end // or !owner:KeyDown(IN_RELOAD)
	if self:Clip1() < self.Primary.ClipSize then
		self.Reloading = true
		self:OnReload("Start")
		if SERVER && self.HasReloadSound == true then
			local reloadSD = VJ.PICK(self.ReloadSound)
			if reloadSD then
				owner:EmitSound(reloadSD, 50, math.random(90, 100))
			end
		end
		-- Handle clip
		timer.Simple(self.Reload_TimeUntilAmmoIsSet, function()
			if IsValid(self) && self:OnReload("Finish") != true then
				local ammoUsed = math.Clamp(self.Primary.ClipSize - self:Clip1(), 0, owner:GetAmmoCount(self:GetPrimaryAmmoType())) -- Amount of ammo that it will use (Take from the reserve)
				owner:RemoveAmmo(ammoUsed, self.Primary.Ammo)
				self:SetClip1(self:Clip1() + ammoUsed)
			end
		end)
		-- Handle animation
		owner:SetAnimation(PLAYER_RELOAD)
		local anim = VJ.PICK(self.AnimTbl_Reload)
		local animTime = VJ.AnimDuration(owner:GetViewModel(), anim)
		self:SendWeaponAnim(anim)
		self.NextIdleT = CurTime() + animTime
		timer.Simple(animTime, function()
			if IsValid(self) then
				self.Reloading = false
			end
		end)
		return true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
	local owner = self:GetOwner()
	owner.NextThrowGrenadeT = owner.NextThrowGrenadeT + 2
	self:OnReload("Start")
	if self.NPC_HasReloadSound then VJ.EmitSound(owner, self.NPC_ReloadSound, self.NPC_ReloadSoundLevel) end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Holster(newWep)
	//if CLIENT then return end
	if self == newWep or self.Reloading then return end
	hook.Remove("Think", self) -- Otherwise "NPC_ServerNextFire" will just keep running!
	self.HasIdleAnimation = false
	//self:SendWeaponAnim(ACT_VM_HOLSTER)
	return self:OnHolster(newWep)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDrop()
	hook.Remove("Think", self) -- Otherwise "NPC_ServerNextFire" will just keep running!
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CanBePickedUpByNPCs()
	return self.NPC_CanBePickedUp
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnRemove()
	self:StopParticles()
	self:CustomOnRemove()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:GetWeaponCustomPosition(owner)
	local boneID = owner:LookupBone(self.WorldModel_CustomPositionBone)
	if !boneID then return false end
	local customPos = self.WorldModel_CustomPositionOrigin
	local customAng = self.WorldModel_CustomPositionAngle
	local pos, ang = owner:GetBonePosition(boneID)
	ang:RotateAroundAxis(ang:Right(), customAng.x)
	ang:RotateAroundAxis(ang:Up(), customAng.y)
	ang:RotateAroundAxis(ang:Forward(), customAng.z)
	pos = pos + (customPos.x * ang:Right() + customPos.y * ang:Forward() + customPos.z * ang:Up())
	return pos, ang
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:MaintainWorldModel()
	if self:GetNW2Bool("VJ_WorldModel_Invisible") != self.WorldModel_Invisible then
		self:SetNW2Bool("VJ_WorldModel_Invisible", self.WorldModel_Invisible)
	end
	
	local owner = self:GetOwner()
	if IsValid(owner) && self.WorldModel_UseCustomPosition then
		local wepPos, wepAng = self:GetWeaponCustomPosition(owner)
		if wepPos then
			self:SetPos(wepPos)
			self:SetAngles(wepAng)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
	function SWEP:DrawWorldModel()
		local drawMdl = true
		if !self:OnDrawWorldModel() or self:GetNW2Bool("VJ_WorldModel_Invisible") or self.WorldModel_Invisible then drawMdl = false end
		
		if self.WorldModel_UseCustomPosition then
			local owner = self:GetOwner()
			if IsValid(owner) then
				if owner:IsPlayer() && owner:InVehicle() then return end
				local wepPos, wepAng = self:GetWeaponCustomPosition(owner)
				if wepPos then
					self:SetRenderOrigin(wepPos)
					self:SetRenderAngles(wepAng)
					self:FrameAdvance(FrameTime())
					self:SetupBones()
				end
			else
				self:SetRenderOrigin(nil)
				self:SetRenderAngles(nil)
			end
		end
		if drawMdl then self:DrawModel() end
	end
end