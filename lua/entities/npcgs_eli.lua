
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Dr. Vance"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then
	function ENT:Initialize()

		if GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_weapondrop") and GetConVarNumber("npcg_weapondrop") != 0 then	self.weaponNum = 8192	else	self.weaponNum = 0	end
		if GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end
		
		self.kvNum = 0
		
		self.ent1 = ents.Create("npc_eli")
		self.ent1:SetPos(self:GetPos())
		self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent1:Spawn()
		self.ent1:Activate()
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		
		if GetConVarNumber( "npcg_squad_human" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "HumanSquad" )
		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 )	
		end

		if	GetConVarNumber("npcg_accuracy_rebel") >= 4	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber("npcg_accuracy_rebel") == 3	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_rebel") == 2	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_rebel") == 1	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
		else
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
		end

		timer.Simple(0, function()
			undo.Create( self.PrintName )
				if self.ent1:IsValid() then undo.AddEntity(self.ent1) end
				undo.SetCustomUndoText("Undone " .. self.PrintName )
				undo.SetPlayer(self.Owner)
			undo.Finish()
			self:Remove()
		end)
	end
end
