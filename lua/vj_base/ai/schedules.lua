require("vj_ai_schedule")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SCHEDULE_FACE(faceType, customFunc)
	-- Types: TASK_FACE_TARGET | TASK_FACE_ENEMY | TASK_FACE_PLAYER | TASK_FACE_LASTPOSITION | TASK_FACE_SAVEPOSITION | TASK_FACE_PATH | TASK_FACE_HINTNODE | TASK_FACE_IDEAL | TASK_FACE_REASONABLE
	if (self.MovementType == VJ_MOVETYPE_STATIONARY && !self.CanTurnWhileStationary) or self.IsVJBaseSNPC_Tank then return end
	local schedule = vj_ai_schedule.New("SCHEDULE_FACE")
	schedule:EngTask(faceType or "TASK_FACE_TARGET", 0)
	if (customFunc) then customFunc(schedule) end
	self:StartSchedule(schedule)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SCHEDULE_GOTO_POSITION(moveType, customFunc)
	if self.MovementType == VJ_MOVETYPE_AERIAL or self.MovementType == VJ_MOVETYPE_AQUATIC then
		self:AA_MoveTo(self:GetLastPosition(), true, (moveType == "TASK_RUN_PATH" and "Alert") or "Calm")
		return
	end
	local schedule = vj_ai_schedule.New("SCHEDULE_GOTO_POSITION")
	//schedule:EngTask("TASK_SET_TOLERANCE_DISTANCE", 48) -- Will cause the NPC not move at all in many cases!
	//schedule:EngTask("TASK_SET_ROUTE_SEARCH_TIME", 3)
	schedule:EngTask("TASK_GET_PATH_TO_LASTPOSITION", 0)
	schedule:EngTask(moveType or "TASK_RUN_PATH", 0)
	schedule:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
	if (customFunc) then customFunc(schedule) end
	self:StartSchedule(schedule)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SCHEDULE_GOTO_TARGET(moveType, customFunc)
	if self.MovementType == VJ_MOVETYPE_AERIAL or self.MovementType == VJ_MOVETYPE_AQUATIC then
		self:AA_MoveTo(self:GetTarget(), true, (moveType == "TASK_RUN_PATH" and "Alert") or "Calm")
		return
	end
	local schedule = vj_ai_schedule.New("SCHEDULE_GOTO_TARGET")
	schedule:EngTask("TASK_GET_PATH_TO_TARGET", 0)
	schedule:EngTask(moveType or "TASK_RUN_PATH", 0)
	schedule:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
	schedule:EngTask("TASK_FACE_TARGET", 1)
	if (customFunc) then customFunc(schedule) end
	self:StartSchedule(schedule)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SCHEDULE_COVER_ENEMY(moveType, customFunc)
	if self.MovementType == VJ_MOVETYPE_AERIAL or self.MovementType == VJ_MOVETYPE_AQUATIC then self:AA_IdleWander() return end
	moveType = moveType or "TASK_RUN_PATH"
	local schedule = vj_ai_schedule.New("SCHEDULE_COVER_ENEMY")
	schedule:EngTask("TASK_FIND_COVER_FROM_ORIGIN", 0)
	schedule:EngTask(moveType or "TASK_RUN_PATH", 0)
	schedule:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
	schedule.RunCode_OnFail = function()
		//print("Cover from enemy failed!")
		local schedFail = vj_ai_schedule.New("SCHEDULE_COVER_ENEMY_FAIL")
		schedFail:EngTask("TASK_SET_ROUTE_SEARCH_TIME", 2)
		schedFail:EngTask("TASK_GET_PATH_TO_RANDOM_NODE", 500)
		schedFail:EngTask(moveType or "TASK_RUN_PATH", 0)
		schedFail:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
		if (customFunc) then customFunc(schedFail) end
		self:StartSchedule(schedFail)
	end
	if (customFunc) then customFunc(schedule) end
	self:StartSchedule(schedule)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SCHEDULE_COVER_ORIGIN(moveType, customFunc)
	if self.MovementType == VJ_MOVETYPE_AERIAL or self.MovementType == VJ_MOVETYPE_AQUATIC then self:AA_IdleWander() return end
	moveType = moveType or "TASK_RUN_PATH"
	local schedule = vj_ai_schedule.New("SCHEDULE_COVER_ORIGIN")
	schedule:EngTask("TASK_FIND_COVER_FROM_ORIGIN", 0)
	schedule:EngTask(moveType or "TASK_RUN_PATH", 0)
	schedule:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
	schedule.RunCode_OnFail = function()
		local schedFail = vj_ai_schedule.New("SCHEDULE_COVER_ORIGIN_FAIL")
		schedFail:EngTask("TASK_SET_ROUTE_SEARCH_TIME", 2)
		schedFail:EngTask("TASK_GET_PATH_TO_RANDOM_NODE", 500)
		schedFail:EngTask(moveType or "TASK_RUN_PATH", 0)
		schedFail:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
		if (customFunc) then customFunc(schedFail) end
		self:StartSchedule(schedFail)
	end
	if (customFunc) then customFunc(schedule) end
	self:StartSchedule(schedule)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local schedule_wander = vj_ai_schedule.New("SCHEDULE_IDLE_WANDER")
	//schedule_wander:EngTask("TASK_SET_ROUTE_SEARCH_TIME", 0)
	//schedule_wander:EngTask("TASK_GET_PATH_TO_LASTPOSITION", 0)
	schedule_wander:EngTask("TASK_GET_PATH_TO_RANDOM_NODE", 350)
	schedule_wander:EngTask("TASK_WALK_PATH", 0)
	schedule_wander:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
	schedule_wander.ResetOnFail = true
	schedule_wander.CanBeInterrupted = true
--
function ENT:SCHEDULE_IDLE_WANDER()
	if self.MovementType == VJ_MOVETYPE_AERIAL or self.MovementType == VJ_MOVETYPE_AQUATIC then self:AA_IdleWander() return end
	self:StartSchedule(schedule_wander)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SCHEDULE_IDLE_STAND()
	if self:IsMoving() or (self.NextIdleTime > CurTime()) or (self.AA_CurrentMoveTime > CurTime()) or self:GetNavType() == NAV_JUMP or self:GetNavType() == NAV_CLIMB then return end
	if (self.MovementType == VJ_MOVETYPE_AERIAL or self.MovementType == VJ_MOVETYPE_AQUATIC) && self:BusyWithActivity() then return end // self:GetVelocity():Length() > 0
	self:MaintainIdleAnimation(self:GetIdealActivity() != ACT_IDLE)
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TASK_VJ_PLAY_ACTIVITY(taskStatus, data)
	if taskStatus == TASKSTATUS_NEW then
		//print("TASK_VJ_PLAY_ACTIVITY: Start!", data.duration)
		local playbackRate = data.playbackRate or self.TruePlaybackRate -- Since setting a new animation resets the playback rate, make sure to capture it before anything!
		self:ResetIdealActivity(data.animation)
		self:SetActivity(data.animation) -- Avoids "MaintainActivity" from selecting another sequence from the activity (if it has multiple sequences tied to it)
		self:SetPlaybackRate(playbackRate, true)
		if !isnumber(data.duration) then
			data.duration = self:SequenceDuration(self:GetIdealSequence()) / playbackRate
		end
		data.animEndTime = CurTime() + data.duration
		//self:AutoMovement(self:GetAnimTimeInterval()) -- Causes extra walk frame to be applied, especially when switching from movement to animation
	else
		//self:AutoMovement(self:GetAnimTimeInterval())
		if (CurTime() > data.animEndTime) or (self:IsSequenceFinished() && self:GetSequence() == self:GetIdealSequence()) then
			//print("TASK_VJ_PLAY_ACTIVITY: Stop!")
			if data.playbackRate then self:SetPlaybackRate(self.TruePlaybackRate, true) end
			self:TaskComplete()
			return
		else
			//print("TASK_VJ_PLAY_ACTIVITY: Run!")
			if data.playbackRate then self:SetPlaybackRate(data.playbackRate, true) end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TASK_VJ_PLAY_SEQUENCE(taskStatus, data)
	if taskStatus == TASKSTATUS_NEW then
		//print("TASK_VJ_PLAY_SEQUENCE: Start!", data.duration)
		local playbackRate = data.playbackRate or self.TruePlaybackRate -- Since setting a new animation resets the playback rate, make sure to capture it before anything!
		data.seqID = self:VJ_PlaySequence(data.animation)
		self:SetPlaybackRate(playbackRate, true)
		data.animEndTime = CurTime() + data.duration
	else
		if (CurTime() > data.animEndTime) or (self:IsSequenceFinished()) or (data.seqID != self:GetSequence()) then
			//print("TASK_VJ_PLAY_SEQUENCE: Stop!")
			if data.playbackRate then self:SetPlaybackRate(self.TruePlaybackRate, true) end
			self:TaskComplete()
			return
		else
			//print("TASK_VJ_PLAY_SEQUENCE: Run!")
			if data.playbackRate then self:SetPlaybackRate(data.playbackRate, true) end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RunAI() -- Called from the engine every 0.1 seconds
	if self:GetState() == VJ_STATE_FREEZE or self:IsEFlagSet(EFL_IS_BEING_LIFTED_BY_BARNACLE) then self:MaintainActivity() return end
	if self:IsRunningBehavior() or self:DoingEngineSchedule() then return true end -- true = Run "MaintainSchedule" in engine
	//self:SetArrivalActivity(ACT_COWER)
	//self:SetArrivalSpeed(1000)
	
	-- Apply walk frames to both activities and sequences
	-- Parts of it replicate TASK_PLAY_SEQUENCE - https://github.com/ValveSoftware/source-sdk-2013/blob/master/mp/src/game/server/ai_basenpc_schedule.cpp#L3312
	if !self:IsSequenceFinished() && !self:IsMoving() && ((self:GetSequence() == self:GetIdealSequence()) or (self:GetActivity() == ACT_DO_NOT_DISTURB)) && self:GetSequenceMoveDist(self:GetSequence()) > 0 && self.MovementType != VJ_MOVETYPE_AERIAL && self.MovementType != VJ_MOVETYPE_AQUATIC then
		self:AutoMovement(self:GetAnimTimeInterval())
	end
	
	local curSched = self.CurrentSchedule
	
	-- If we are currently running a schedule then run it otherwise call SelectSchedule to decide what to do next
	if curSched then
		-- Handle movement animations
			-- 1. Make sure the movement activity is the current activity
			-- 2. Compare the current movement sequence to the current ideal sequence, if they don't match then the movement activity may be outdated depending on the next check!
			-- 3. Compare their activities and continue if they don't match! A single activity can have multiple sequences tied to it, without this check it will cause it to bug out!
			-- 4. Force the ideal sequence to be the actual movement activity's sequence (including translated)
			-- This is needed because:
				-- 1. Often times translating alone will NOT update the movement animation!
				-- 2. Half of the time, the engine will NOT even call the translate function!
		if self:IsMoving() then
			local moveAct = self:GetMovementActivity()
			if self:GetActivity() == moveAct then
				self:SetMovementActivity(moveAct) -- Force update the movement sequence, aka "m_sequence" in the engine
				local moveSeq = self:GetMovementSequence()
				local idealSeq = self:GetIdealSequence()
				if moveSeq != idealSeq && self:GetSequenceActivity(moveSeq) != self:GetSequenceActivity(idealSeq) then
					self:SetIdealSequence(moveSeq)
				end
			end
		end
		
		self:DoSchedule(curSched)
		if curSched.CanBeInterrupted or (self:IsScheduleFinished(curSched)) or (curSched.HasMovement && !self:IsMoving()) then
			self:SelectSchedule()
		end
	else
		self:SelectSchedule()
	end
	
	//if !self.VJ_PlayingSequence then -- No longer needed for sequences as it is handled by ACT_DO_NOT_DISTURB
	self:MaintainActivity()
	//end
end
---------------------------------------------------------------------------------------------------------------------------------------------
--[[---------------------------------------------------------
	Called whenever a task fails
		- failCode = 
-----------------------------------------------------------]]
function ENT:OnTaskFailed(failCode, failString)
	//print("OnTaskFailed: ", failCode, failString)
	local curSched = self.CurrentSchedule
	if curSched then
		//print("Do run fail")
		-- Give it a very small delay to let the engine set its values before we continue
		timer.Simple(0.05, function()
			if IsValid(self) then
				local curSched2 = self.CurrentSchedule
				if curSched2 && curSched == curSched2 then -- Make sure the schedule hasn't changed!
					curSched = curSched2
					if curSched.ResetOnFail == true then
						curSched.FailureHandled = true
						self:StopMoving()
						//self:SelectSchedule()
						//self:ClearCondition(COND_TASK_FAILED) -- Won't do anything, engine will set COND_TASK_FAILED right after
					end
					if failCode != 14 then -- Skip this part for "FAIL_NO_ROUTE_ILLEGAL" to allow things like player model movement to work
						self:ClearGoal() -- Otherwise we may get stuck in movement (if schedule had a movement!)
						self:NextTask(curSched) -- Attempt to move on to the next task!
					end
					-- Handle "RunCode_OnFail"
					if !curSched.AlreadyRanCode_OnFail && curSched.RunCode_OnFail != nil then
						curSched.AlreadyRanCode_OnFail = true
						curSched.RunCode_OnFail(failCode, failString)
					end
				end
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMovementFailed()
	//print("VJ Base: Movement Failed! "..self:GetName())
	-- Now handled in `OnTaskFailed`
	/*local curSchedule = self.CurrentSchedule
	if curSchedule != nil then
		if self:DoRunCode_OnFail(curSchedule) == true then
			self:ClearCondition(COND_TASK_FAILED)
		end
		if curSchedule.ResetOnFail == true then
			curSched.FailureHandled = true
			self:ClearCondition(COND_TASK_FAILED)
			self:StopMoving()
			//self:SelectSchedule()
		end
	end*/
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMovementComplete()
	//print("Movement completed!")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnStateChange(oldState, newState)
	//print("OnStateChange - ", self, ": ", oldState, newState)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StartSchedule(schedule)
	if self.MovementType == VJ_MOVETYPE_STATIONARY && schedule.HasMovement then return end -- It's stationary therefore it should not move!
	-- Certain states should ONLY do animation schedules!
	if !schedule.IsPlayActivity then
		local curState = self:GetState()
		if curState == VJ_STATE_ONLY_ANIMATION or curState == VJ_STATE_ONLY_ANIMATION_CONSTANT or curState == VJ_STATE_ONLY_ANIMATION_NOATTACK then return end
	end
	local curSched = self.CurrentSchedule
	if curSched then
		-- If it's the same task AND it's opening a door OR doing a move wait then cancel the new schedule!
		if schedule.Name == curSched.Name && (IsValid(self:GetInternalVariable("m_hOpeningDoor")) or self:GetInternalVariable("m_flMoveWaitFinished") > 0) then
			return
		end
		-- Clean up any schedule it may have been doing
		if !self.Dead then
			self:ScheduleFinished(curSched)
		end
	end
	self:ClearCondition(COND_TASK_FAILED)
	//print("StartSchedule:", schedule.Name)
	
	-- This stops movements from running if another NPC is stuck in it
	-- Pros:
		-- Successfully reduces lag when many NPCs are stuck in each other
	-- Cons:
		-- When using "BOUNDS_HITBOXES" for "SetSurroundingBoundsType", NPCs often end up inside each other, and this check causes movements to not run (NPCs end up freezing)
		-- Needed very rarely, not worth running a trace hull and table has value check for every movement task
	/*if schedule.HasMovement == true then
		local tr_addVec = Vector(0, 0, 2)
		local tr = util.TraceHull({
			start = self:GetPos(),
			endpos = self:GetPos(),
			mins = self:OBBMins() + tr_addVec,
			maxs = self:OBBMaxs() + tr_addVec,
			filter = self
		})
		if IsValid(tr.Entity) && tr.Entity:IsNPC() && !VJ.HasValue(self.EntitiesToNoCollide, tr.Entity:GetClass()) then
			self:DoRunCode_OnFail(schedule)
			return
		end
	end*/
	
	-- No longer needed, `TranslateActivity` handles it now
	//if schedule.CanShootWhenMoving == true && self.CurrentWeaponAnimation != nil && IsValid(self:GetEnemy()) then
		//self:DoWeaponAttackMovementCode(true, (schedule.MoveType == 0 and 1) or 0) -- Send 1 if the current task is walking!
		//self:SetArrivalActivity(self.CurrentWeaponAnimation)
	//end
	
	-- Handle facing data sent by "FaceData"
		-- Type = Type of facing it should do | Target = The vector/ent to face (Not required for enemy facing!)
	local turnData = schedule.FaceData
	if turnData then
		local faceType = turnData.Type
		if !self.CanTurnWhileMoving or !faceType then
			turnData = nil
		else
			local turnTarget = turnData.Target
			self:ResetTurnTarget()
			self.TurnData.Type = faceType
			self.TurnData.Target = isvector(turnTarget) and self:GetFaceAngle((turnTarget - self:GetPos()):Angle()) or turnTarget
			self.TurnData.IsSchedule = true
			self.TurnData.LastYaw = 1 -- So it doesn't face movement direction between move schedules, but should it be kept??
		end
	end
	
	-- Conditions that the NPC will ignore as long as this schedule is active, these will reset after schedule is finished!
	-- if you don't want it to reset on schedule finish then set & remove the conditions yourself outside of the schedule
	if schedule.IgnoreConditions then
		self:SetIgnoreConditions(schedule.IgnoreConditions)
	end
	
	-- Clear certain systems that should be notified that we have moved
	if schedule.HasMovement then
		self.LastHiddenZoneT = 0
		if self.LastAnimationType != VJ.ANIM_TYPE_GESTURE then -- Movements shouldn't interrupt gestures
			self.LastAnimationSeed = 0
		end
	end
	
	//if self.VJ_DEBUG then PrintTable(schedule) end
	self.CurrentSchedule = schedule
	self.CurrentScheduleName = schedule.Name
	self.CurrentTaskID = 1
	self:SetTask(schedule:GetTask(1))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoSchedule(schedule)
	if self:TaskFinished() then self:NextTask(schedule) end
	if self.CurrentTask then self:RunTask(self.CurrentTask) end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StopCurrentSchedule()
	local schedule = self.CurrentSchedule
	//print("StopCurrentSchedule", schedule)
	if schedule then
		timer.Remove("timer_act_stopattacks"..self:EntIndex())
		self.NextIdleTime = 0
		self.NextChaseTime = 0
		self.AnimLockTime = 0
		self:ClearSchedule()
		self:ClearGoal()
		self:ScheduleFinished(schedule)
		//self:SelectSchedule()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ScheduleFinished(schedule)
	//print("ScheduleFinished", schedule)
	if schedule then
		-- Handle "RunCode_OnFinish"
		if !schedule.AlreadyRanCode_OnFinish && schedule.RunCode_OnFinish != nil then
			schedule.AlreadyRanCode_OnFinish = true
			schedule.RunCode_OnFinish()
		end
		-- Handle COND_TASK_FAILED, unless we have handled the failure case, we should keep the failure condition forever until it's handled or new schedule is ran
		if schedule.FailureHandled then
			self:ClearCondition(COND_TASK_FAILED)
		end
		-- Reset facing data if its based on a schedule!
		if self.TurnData.IsSchedule then
			self:ResetTurnTarget()
		end
		-- Clear ignored conditions from this schedule
		if schedule.IgnoreConditions then
			self:RemoveIgnoreConditions(schedule.IgnoreConditions)
		end
	end
	self.CurrentSchedule = nil
	self.CurrentScheduleName = nil
	self.CurrentTask = nil
	self.CurrentTaskID = nil
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetTask(task)
	self.CurrentTask = task
	self.CurrentTaskComplete = false
	self.TaskStartTime = CurTime()
	self:StartTask(self.CurrentTask)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:NextTask(schedule)
	//print("Running NextTask")
	self.CurrentTaskID = self.CurrentTaskID + 1
	if (self.CurrentTaskID > schedule:NumTasks()) then -- If this was the last task then finish up
		self:ScheduleFinished(schedule)
		return
	end
	self:SetTask(schedule:GetTask(self.CurrentTaskID)) -- Switch to the next task
end
---------------------------------------------------------------------------------------------------------------------------------------------
--[[---------------------------------------------------------
	Called every time a task is completed before moving onto to the next task
-----------------------------------------------------------]]
function ENT:OnTaskComplete()
	self.CurrentTaskComplete = true
end
---------------------------------------------------------------------------------------------------------------------------------------------
--[[---------------------------------------------------------
	Whether or not the current task is finished
	Returns
		- boolean, true = task is finished
-----------------------------------------------------------]]
function ENT:TaskFinished()
	return self.CurrentTaskComplete
end
---------------------------------------------------------------------------------------------------------------------------------------------
--[[---------------------------------------------------------
	Whether or not the current schedule is fully finished | Used internally by the base
		- schedule = The schedule to check for, should always be given "self.CurrentSchedule"!
	Returns
		- boolean, true = Schedule is finished
-----------------------------------------------------------]]
function ENT:IsScheduleFinished(schedule)
	return self.CurrentTaskComplete && (!self.CurrentTaskID or self.CurrentTaskID >= schedule:NumTasks())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StartTask(task) task:Start(self) end
function ENT:RunTask(task) task:Run(self) end
function ENT:TaskTime() return CurTime() - self.TaskStartTime end
-- Engine tasks / schedules ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StartEngineTask(iTaskID, taskData) end
function ENT:RunEngineTask(iTaskID, taskData) end
function ENT:StartEngineSchedule(scheduleID) self:ScheduleFinished() self.bDoingEngineSchedule = true end
function ENT:EngineScheduleFinish() self.bDoingEngineSchedule = nil end
function ENT:DoingEngineSchedule() return self.bDoingEngineSchedule end