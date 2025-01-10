AddCSLuaFile("shared.lua")
include("shared.lua")
include("vj_base/ai/base_tank.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Core Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.StartHealth = 200
ENT.MovementType = VJ_MOVETYPE_PHYSICS -- How the NPC moves around
ENT.ForceDamageFromBosses = true -- Should the NPC get damaged by bosses regardless if it's not supposed to by skipping immunity checks, etc. | Bosses are attackers tagged with "VJ_ID_Boss"
ENT.DeathDelayTime = 2 -- Time until the NPC spawns the corpse, removes itself, etc.
ENT.AlertFriendsOnDeath = true -- Should the NPC's allies get alerted while it's dying? | Its allies will also need to have this variable set to true!
	-- ====== Sound Paths ====== --
ENT.SoundTbl_Breath = "vj_base/vehicles/armored/engine_idle.wav"
ENT.SoundTbl_Death = "VJ.Explosion"

ENT.AlertSoundLevel = 70
ENT.IdleSoundLevel = 70
ENT.CombatIdleSoundLevel = 70
ENT.BreathSoundLevel = 80
ENT.DeathSoundLevel = 100

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 100
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Tank Base Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.Tank_GunnerENT = "" -- The SNPC that will be the gunner (The head of the tank)
ENT.Tank_AngleDiffuseNumber = 180 -- Used if the forward direction of the y-axis isn't correct on the model
	-- ====== Sight Variables ====== --
ENT.Tank_SeeClose = 1000 -- If the enemy is closer than this number, than move by either running over them or moving away for the gunner to fire
ENT.Tank_SeeFar = 6000 -- If the enemy is higher than this number, than move towards the enemy
ENT.Tank_DistRanOver = 500 -- If the enemy is within self.Tank_SeeClose & this number & not high up, then run over them!
	-- ====== Movement Variables ====== --
ENT.Tank_TurningSpeed = 1.5 -- How fast the chassis moves as it's driving
ENT.Tank_DrivingSpeed = 100 -- How fast the tank drives
	-- ====== Collision Variables ====== --
	-- Used when the NPC is spawned
ENT.Tank_CollisionBoundSize = 90
ENT.Tank_CollisionBoundUp = 100
ENT.Tank_CollisionBoundDown = -10
	-- ====== Death Variables ====== --
ENT.Tank_DeathSoldierModels = {} -- The corpses it will spawn on death (Example: A soldier) | false = Don't spawn anything
ENT.Tank_DeathSoldierChance = 3 -- The chance that the soldier spawns | 1 = always
ENT.Tank_DeathDecal = {"Scorch"} -- The decal that it places on the ground when it dies
	-- ====== Sound Variables ====== --
ENT.Tank_SoundTbl_DrivingEngine = {}
ENT.Tank_SoundTbl_Track = {}
ENT.Tank_SoundTbl_RunOver = {}

ENT.Tank_DefaultSoundTbl_DrivingEngine = "vj_base/vehicles/armored/engine_drive.wav"
ENT.Tank_DefaultSoundTbl_Track = "vj_base/vehicles/armored/tracks1.wav"
ENT.Tank_DefaultSoundTbl_RunOver = {"vj_base/gib/bone_snap1.wav", "vj_base/gib/bone_snap2.wav", "vj_base/gib/bone_snap3.wav"}

//util.AddNetworkString("vj_tank_base_spawneffects")
//util.AddNetworkString("vj_tank_base_moveeffects")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Customization Functions ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Use the functions below to customize certain parts of the base or to add new custom systems
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_Init() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_GunnerSpawnPosition()
	return self:GetPos()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_OnThink() end -- Return true to disable the default base code
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_OnRunOver(ent) end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetNearDeathSparkPositions()
	local randPos = math.random(1, 2)
	if randPos == 1 then
		self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*100 + self:GetUp()*60)
	elseif randPos == 2 then
		self.Spark1:SetLocalPos(self:GetPos() + self:GetForward()*-100 + self:GetUp()*60)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_OnInitialDeath(dmginfo, hitgroup) end -- Return true to disable the default base code
---------------------------------------------------------------------------------------------------------------------------------------------
--[[
Called when the tank is about to spawn death soldier model, death effects, and death sounds

=-=-=| PARAMETERS |=-=-=
	1. dmginfo [object] = CTakeDamageInfo object
	2. hitgroup [number] = The hitgroup that it hit
	3. corpseEnt [entity] = The corpse entity of the tank
	4. status [string] : Type of update that is occurring, holds one of the following states:
		-> "Override" : Right before anything is create, can be used to override the entire function
				USAGE EXAMPLES -> Add extra gib pieces | Add extra blast
				PARAMETERS
					5. statusData [nil]
				RETURNS
					-> [nil | bool] : Returning true will NOT let the base code execute, effectively overriding it entirely
		-> "Soldier" : The soldier corpse that it created
				USAGE EXAMPLES -> Set a skin or bodygroup
				PARAMETERS
					5. statusData [entity] : Soldier corpse entity
				RETURNS
					-> [nil]
		-> "Effects" : Right before it's about to spawn the death effects
				USAGE EXAMPLES -> Add extra effects | Override the base effects entirely
				PARAMETERS
					5. statusData [nil]
				RETURNS
					-> [nil | bool] : Returning true will NOT let the base effects be created
	5. statusData [nil | entity] : Depends on `status` value, refer to it for more details

=-=-=| RETURNS |=-=-=
	-> [nil | bool] : Depends on `status` value, refer to it for more details
--]]
function ENT:Tank_OnDeathCorpse(dmginfo, hitgroup, corpseEnt, status, statusData) end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StartSpawnEffects()
	/* Example:
	net.Start("vj_tank_base_spawneffects")
	net.WriteEntity(self)
	net.Broadcast()
	*/
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StartMoveEffects()
	/* Example:
	net.Start("vj_tank_base_moveeffects")
	net.WriteEntity(self)
	net.Broadcast()
	*/
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ ///// WARNING: Don't touch anything below this line! \\\\\ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.Tank_IsMoving = false
ENT.Tank_Status = 1
ENT.Tank_NextLowHealthSparkT = 0
ENT.Tank_NextRunOverSoundT = 0
local runoverException = {npc_antlionguard=true,npc_turret_ceiling=true,monster_gargantua=true,monster_bigmomma=true,monster_nihilanth=true,npc_strider=true,npc_combine_camera=true,npc_helicopter=true,npc_combinegunship=true,npc_combinedropship=true,npc_rollermine=true}
local defAng = Angle(0, 0, 0)

local cv_nomelee = GetConVar("vj_npc_melee")
local cv_noidleparticle = GetConVar("vj_npc_reduce_vfx")
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetPhysicsDamageScale(0) -- Take no physics damage
	self.DeathAnimationCodeRan = true -- So corpse doesn't fly away on death (Take this out if not using death explosion sequence)
	self:Tank_Init()
	if self.CustomInitialize_CustomTank then self:CustomInitialize_CustomTank() end -- !!!!!!!!!!!!!! DO NOT USE !!!!!!!!!!!!!! [Backwards Compatibility!]
	self:PhysicsInit(SOLID_VPHYSICS) // SOLID_BBOX
	//self:SetSolid(SOLID_VPHYSICS)
	self:SetAngles(self:GetAngles() + Angle(0, -self.Tank_AngleDiffuseNumber, 0))
	//self:SetPos(self:GetPos()+Vector(0,0,90))
	self:SetCollisionBounds(Vector(self.Tank_CollisionBoundSize, self.Tank_CollisionBoundSize, self.Tank_CollisionBoundUp), Vector(-self.Tank_CollisionBoundSize, -self.Tank_CollisionBoundSize, self.Tank_CollisionBoundDown))

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		phys:SetMass(30000)
	end
	
	-- Create the gunner NPC
	local gunner = ents.Create(self.Tank_GunnerENT)
	if IsValid(gunner) then
		gunner:SetPos(self:Tank_GunnerSpawnPosition())
		gunner:SetAngles(self:GetAngles())
		gunner:SetOwner(self)
		gunner:SetParent(self)
		gunner.VJ_NPC_Class = self.VJ_NPC_Class
		gunner:Spawn()
		gunner:Activate()
		self.Gunner = gunner
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnTouch(ent)
	if !VJ_CVAR_AI_ENABLED then return end
	if self.Tank_Status == 0 then
		self:Tank_RunOver(ent)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_RunOver(ent)
	if !self.Tank_IsMoving or !IsValid(ent) or (cv_nomelee:GetInt() == 0 /*or self.HasMeleeAttack == false*/) or (ent.IsVJBaseBullseye && ent.VJ_IsBeingControlled) then return end
	if self:Disposition(ent) == D_HT && ent:Health() > 0 && ((ent:IsNPC() && !runoverException[ent:GetClass()]) or (ent:IsPlayer() && !VJ_CVAR_IGNOREPLAYERS) or ent:IsNextBot()) && !ent.VJ_ID_Boss && !ent.VJ_ID_Vehicle && !ent.VJ_ID_Aircraft then
		self:Tank_OnRunOver(ent)
		self:Tank_Sound_RunOver()
		ent:TakeDamage(self:ScaleByDifficulty(8), self, self)
		VJ.DamageSpecialEnts(self, ent, nil)
		ent:SetVelocity(ent:GetForward()*-200)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	if self:Tank_OnThink() != true then
		if cv_noidleparticle:GetInt() == 1 then return end
		timer.Simple(0.1, function()
			if IsValid(self) && !self.Dead then
				self:StartSpawnEffects()
			end
		end)

		if self:Health() < (self.StartHealth*0.30) && CurTime() > self.Tank_NextLowHealthSparkT then
			//ParticleEffectAttach("vj_rocket_idle2_smoke2", PATTACH_ABSORIGIN_FOLLOW, self, 0)

			self.Spark1 = ents.Create("env_spark")
			self.Spark1:SetKeyValue("MaxDelay",0.01)
			self.Spark1:SetKeyValue("Magnitude","8")
			self.Spark1:SetKeyValue("Spark Trail Length","3")
			self:GetNearDeathSparkPositions()
			self.Spark1:SetAngles(self:GetAngles())
			//self.Spark1:Fire("LightColor", "255 255 255")
			self.Spark1:SetParent(self)
			self.Spark1:Spawn()
			self.Spark1:Activate()
			self.Spark1:Fire("StartSpark", "", 0)
			self.Spark1:Fire("kill", "", 0.1)
			self:DeleteOnRemove(self.Spark1)

			/*local effectData = EffectData()
			effectData:SetOrigin(self:GetPos() +self:GetUp()*60 +self:GetForward()*100)
			effectData:SetNormal(Vector(0, 0, 0))
			effectData:SetMagnitude(5)
			effectData:SetScale(0.1)
			effectData:SetRadius(10)
			util.Effect("Sparks",effectData)*/
			self.Tank_NextLowHealthSparkT = CurTime() + math.random(4, 6)
		end

		/*if self:Health() <= 150 then
		self.FireEffect = ents.Create("env_fire_trail")
		self.FireEffect:SetPos(self:GetPos()+self:GetUp()*100)
		self.FireEffect:Spawn()
		self.FireEffect:SetParent(self)
		end*/
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec80z = Vector(0, 0, 80)
local NPC_FACE_NONE = VJ.NPC_FACE_NONE
--
function ENT:OnThinkActive()
	if self.Dead then return end
	self.TurnData.Type = NPC_FACE_NONE -- This effectively makes it never face anything through Lua
	
	for _, v in ipairs(ents.FindInSphere(self:GetPos(), 100)) do
		self:Tank_RunOver(v)
	end

	local tr = util.TraceEntity({start = self:GetPos(), endpos = self:GetPos() + self:GetUp()*-5, filter = self}, self)
	if (tr.Hit) then // HitWorld
		local phys = self:GetPhysicsObject()
		if IsValid(phys) && phys:GetVelocity():Length() > 10 && self.Tank_Status == 0 then -- Moving
			self.Tank_IsMoving = true
			self:Tank_Sound_Moving()
			self:StartMoveEffects()
		else -- Not moving
			VJ.STOPSOUND(self.CurrentTankMovingSound)
			VJ.STOPSOUND(self.CurrentTankTrackSound)
			self.Tank_IsMoving = false
		end
	end
	if (!tr.Hit) then -- Not moving
		VJ.STOPSOUND(self.CurrentTankMovingSound)
		VJ.STOPSOUND(self.CurrentTankTrackSound)
		self.Tank_IsMoving = false
	end

	self:SelectSchedule()
	
	if self.Tank_Status == 0 && tr.Hit then
		local ene = self:GetEnemy()
		if IsValid(ene) then
			local phys = self:GetPhysicsObject()
			if IsValid(phys) then
				local angEne = (ene:GetPos() - self:GetPos() + vec80z):Angle()
				local angDiffuse = self:Tank_AngleDiffuse(angEne.y, self:GetAngles().y + self.Tank_AngleDiffuseNumber)
				local heightRatio = (ene:GetPos().z - self:GetPos().z) / self:GetPos():Distance(Vector(ene:GetPos().x, ene:GetPos().y, self:GetPos().z))
				-- If the enemy's height isn't very high AND the enemy is ( within run over distance OR far away), then move towards the enemy!
				-- OR
				-- If the enemy is very high up, then move away from it to help the gunner fire!
				if (heightRatio < 0.15 && ((self.LatestEnemyDistance < self.Tank_DistRanOver) or (self.LatestEnemyDistance > self.Tank_SeeFar))) or (heightRatio > 0.15) then
					if angDiffuse > 15 then
						self:SetLocalAngles(self:GetLocalAngles() + Angle(0, self.Tank_TurningSpeed, 0))
						phys:SetAngles(self:GetAngles())
					elseif angDiffuse < -15 then
						self:SetLocalAngles(self:GetLocalAngles() + Angle(0, -self.Tank_TurningSpeed, 0))
						phys:SetAngles(self:GetAngles())
					end
					local moveVel = self:GetForward()
					moveVel:Rotate(Angle(0, self.Tank_AngleDiffuseNumber, 0))
					if heightRatio > 0.15 then -- Move away!
						phys:SetVelocity(moveVel:GetNormal()*-self.Tank_DrivingSpeed)
					else -- Move towards!
						phys:SetVelocity(moveVel:GetNormal()*self.Tank_DrivingSpeed)
					end
				end
			end
		else
			self.Tank_Status = 1
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SelectSchedule()
	if self:Health() <= 0 or self.Dead then return end

	self:IdleSoundCode()
	self:MaintainIdleBehavior()
	
	if IsValid(self:GetEnemy()) then
		if self.VJ_IsBeingControlled then
			if self.VJ_TheController:KeyDown(IN_FORWARD) then
				self.Tank_Status = 0
			else
				self.Tank_Status = 1
			end
		else
			if (self.LatestEnemyDistance < self.Tank_SeeFar && self.LatestEnemyDistance > self.Tank_SeeClose) or self.IsGuard then -- If between this two numbers, stay still
				self.Tank_Status = 1
			else
				self.Tank_Status = 0
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" && dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) or dmginfo:IsDamageType(DMG_CLUB) then
		if dmginfo:GetDamage() >= 30 && !dmginfo:GetAttacker().VJ_ID_Boss then
			dmginfo:SetDamage(dmginfo:GetDamage() / 2)
		else
			dmginfo:SetDamage(0)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Initial" then
		if IsValid(self.Gunner) then
			self.Gunner.Dead = true
			if self:IsOnFire() then self.Gunner:Ignite(math.Rand(8, 10), 0) end
		end
		
		if self:Tank_OnInitialDeath(dmginfo, hitgroup) != true then
			for i=0, 1.5, 0.5 do
				timer.Simple(i, function()
					if IsValid(self) then
						local myPos = self:GetPos()
						VJ.EmitSound(self, "VJ.Explosion")
						util.BlastDamage(self, self, myPos, 200, 40)
						util.ScreenShake(myPos, 100, 200, 1, 2500)
						if self.HasGibOnDeathEffects then ParticleEffect("vj_explosion2", myPos, defAng) end
					end
				end)
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec500z = Vector(0, 0, 500)
local colorGray = Color(90, 90, 90)
--
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
	-- Spawn the gunner corpse
	if IsValid(self.Gunner) then
		self.Gunner.SavedDmgInfo = self.SavedDmgInfo
		local gunCorpse = self.Gunner:CreateDeathCorpse(dmginfo, hitgroup)
		if IsValid(gunCorpse) then corpseEnt.ChildEnts[#corpseEnt.ChildEnts + 1] = gunCorpse end
	end
	
	if self:Tank_OnDeathCorpse(dmginfo, hitgroup, corpseEnt, "Override") != true then
		local myPos = self:GetPos()
		VJ.EmitSound(self, "VJ.Explosion")
		util.BlastDamage(self, self, myPos, 400, 40)
		util.ScreenShake(myPos, 100, 200, 1, 2500)
		local tr = util.TraceLine({
			start = myPos + self:GetUp() * 4,
			endpos = myPos - vec500z,
			filter = self
		})
		util.Decal(VJ.PICK(self.Tank_DeathDecal), tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		
		-- Create soldier corpse
		if math.random(1, self.Tank_DeathSoldierChance) == 1 then
			local soldierMDL = VJ.PICK(self.Tank_DeathSoldierModels)
			if soldierMDL != false then
				self:CreateExtraDeathCorpse("prop_ragdoll", soldierMDL, {Pos=myPos + self:GetUp()*90 + self:GetRight()*-30, Vel=Vector(math.Rand(-600, 600), math.Rand(-600, 600), 500)}, function(ent)
					ent:Ignite(math.Rand(8, 10), 0)
					ent:SetColor(colorGray)
					self:Tank_OnDeathCorpse(dmginfo, hitgroup, corpseEnt, "Soldier", ent)
				end)
			end
		end

		-- Effects / Particles
		if self.HasGibOnDeathEffects && self:Tank_OnDeathCorpse(dmginfo, hitgroup, corpseEnt, "Effects") != true then
			ParticleEffect("vj_explosion3", myPos, defAng)
			ParticleEffect("vj_explosion2", myPos + self:GetForward()*-130, defAng)
			ParticleEffect("vj_explosion2", myPos + self:GetForward()*130, defAng)
			ParticleEffectAttach("smoke_burning_engine_01", PATTACH_ABSORIGIN_FOLLOW, corpseEnt, 0)
			local effectData = EffectData()
			effectData:SetOrigin(myPos)
			util.Effect("VJ_Medium_Explosion1", effectData)
			effectData:SetScale(800)
			util.Effect("ThumperDust", effectData)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	VJ.STOPSOUND(self.CurrentTankMovingSound)
	VJ.STOPSOUND(self.CurrentTankTrackSound)
	if IsValid(self.Gunner) then
		self.Gunner:Remove()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_Sound_Moving()
	if self.HasSounds == false or self.HasFootStepSound == false then return end
	
	local sdtbl1 = VJ.PICK(self.Tank_SoundTbl_DrivingEngine)
	if sdtbl1 == false then sdtbl1 = VJ.PICK(self.Tank_DefaultSoundTbl_DrivingEngine) end -- Default table
	self.CurrentTankMovingSound = VJ.CreateSound(self, sdtbl1, 80, 100)
	//self.Tank_NextRunOverSoundT = CurTime() + 0.2
	
	local sdtbl2 = VJ.PICK(self.Tank_SoundTbl_Track)
	if sdtbl2 == false then sdtbl2 = VJ.PICK(self.Tank_DefaultSoundTbl_Track) end -- Default table
	self.CurrentTankTrackSound = VJ.CreateSound(self, sdtbl2, 70, 100)
	//self.Tank_NextRunOverSoundT = CurTime() + 0.2
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_Sound_RunOver()
	if self.HasSounds == false or CurTime() < self.Tank_NextRunOverSoundT then return end
	
	local sdtbl = VJ.PICK(self.Tank_SoundTbl_RunOver)
	if sdtbl == false then sdtbl = VJ.PICK(self.Tank_DefaultSoundTbl_RunOver) end -- Default table
	self:EmitSound(sdtbl, 80, math.random(80, 100))
	self.Tank_NextRunOverSoundT = CurTime() + 0.2
end