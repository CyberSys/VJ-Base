if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "9mm Pistol"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base"
	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if (CLIENT) then
SWEP.Slot						= 1 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos					= 1 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.SwayScale 					= 4 -- Default is 1, The scale of the viewmodel sway
SWEP.UseHands					= true
end
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_EnableDontUseRegulate 	= false -- Used for VJ Base SNPCs, if enabled the SNPC will remove use regulate
SWEP.NPC_NextPrimaryFire 		= 0.25 -- Next time it can use primary fire
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel					= "models/weapons/c_pistol.mdl"
SWEP.WorldModel					= "models/weapons/w_pistol.mdl"
SWEP.HoldType 					= "pistol"
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= false
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 8 -- Damage
SWEP.Primary.PlayerDamage		= 1 -- Put 1 to make it the same as above
SWEP.Primary.UseNegativePlayerDamage = false -- Should it use a negative number for the player damage?
SWEP.Primary.NumberOfShots		= 1 -- How many shots per attack?
SWEP.Primary.ClipSize			= 18 -- Max amount of bullets per clip
SWEP.Primary.DefaultClip		= 54 -- How much ammo do you get when you first pick up the weapon?
SWEP.Primary.Cone				= 7 -- How accurate is the bullet? (Players)
SWEP.Primary.Delay				= 0.25 -- Time until it can shoot again
SWEP.Primary.Tracer				= 1
SWEP.Primary.TakeAmmo			= 1 -- How much ammo should it take on each shot?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Ammo				= "Pistol" -- Ammo type
SWEP.Primary.Sound				= "Weapon_Pistol.Single"
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= "Weapon_Pistol.NPC_Single"
SWEP.Primary.AllowFireInWater	= true -- If true, you will be able to use primary fire in water
	-- Deployment Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DelayOnDeploy 				= 0.4 -- Time until it can shoot again after deploying the weapon
SWEP.DeploySound				= "weapons/draw_pistol.wav" -- Sound played when the weapon is deployed
	-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasReloadSound				= true -- Does it have a reload sound? Remember even if this is set to false, the animation sound will still play!
SWEP.ReloadSound				= "weapons/pistol/pistol_reload1.wav"
SWEP.Reload_TimeUntilAmmoIsSet	= 1 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 1.4 -- How much time until the player can play idle animation, shoot, etc.
	-- Idle Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasIdleAnimation			= true -- Does it have a idle animation?
SWEP.AnimTbl_Idle				= {ACT_VM_IDLE}
SWEP.NextIdle_Deploy			= 0.5 -- How much time until it plays the idle animation after the weapon gets deployed
SWEP.NextIdle_PrimaryAttack		= 0.13 -- How much time until it plays the idle animation after attacking(Primary)
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects()
	local vjeffectmuz = EffectData()
	vjeffectmuz:SetOrigin(self.Owner:GetShootPos())
	vjeffectmuz:SetEntity(self.Weapon)
	vjeffectmuz:SetStart(self.Owner:GetShootPos())
	vjeffectmuz:SetNormal(self.Owner:GetAimVector())
	vjeffectmuz:SetAttachment(1)
	vjeffectmuz:SetMagnitude(0)
	util.Effect("VJ_Weapon_RifleMuzzle1",vjeffectmuz)
	
	if GetConVarNumber("vj_wep_nobulletshells") == 0 then
	if !self.Owner:IsPlayer() then
	local vjeffect = EffectData()
	vjeffect:SetEntity(self.Weapon)
	vjeffect:SetOrigin(self.Owner:GetShootPos())
	vjeffect:SetNormal(self.Owner:GetAimVector())
	vjeffect:SetAttachment(1)
	util.Effect("VJ_Weapon_PistolShell1",vjeffect) end
	end

	if (SERVER) then
	if GetConVarNumber("vj_wep_nomuszzleflash") == 0 then
	local FireLight1 = ents.Create("light_dynamic")
	FireLight1:SetKeyValue("brightness", "2")
	if self.Owner:IsPlayer() then
	FireLight1:SetKeyValue("distance", "200") else FireLight1:SetKeyValue("distance", "150") end
	FireLight1:SetLocalPos(self.Owner:GetShootPos() +self:GetForward()*40 + self:GetUp()*-40)
	FireLight1:SetLocalAngles(self:GetAngles())
	FireLight1:Fire("Color", "255 150 60")
	FireLight1:SetParent(self)
	FireLight1:Spawn()
	FireLight1:Activate()
	FireLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(FireLight1)
	timer.Simple(0.07,function() if self:IsValid() then FireLight1:Remove() end end)
	end
 end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:FireAnimationEvent(pos,ang,event,options)
	/*local vjeffect = EffectData()
	vjeffect:SetEntity(self.Weapon)
	vjeffect:SetOrigin(self.Owner:GetShootPos())
	vjeffect:SetNormal(self.Owner:GetAimVector())
	vjeffect:SetAttachment(2)
	util.Effect("VJ_Weapon_RifleShell1",vjeffect)*/

	if GetConVarNumber("vj_wep_nobulletshells") == 1 then
	if event == 6001 then 
		return true end 
	end
	
	if GetConVarNumber("vj_wep_nomuszzleflash") == 1 then
	if event == 21 then 
		return true end 
	end
end