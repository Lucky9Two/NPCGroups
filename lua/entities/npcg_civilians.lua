
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Civilians"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then
	function ENT:Initialize()

		if ConVarExists("npcg_ignorepushing") and GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_weapondrop") and GetConVarNumber("npcg_weapondrop") != 0 then	self.weaponNum = 8192	else	self.weaponNum = 0	end
		if ConVarExists("npcg_fade_corpse") and GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if ConVarExists("npcg_longvision") and GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end
		if ConVarExists("npcg_random_rebels") and GetConVarNumber("npcg_random_rebels") != 0 then	self.randomModel = 1	else	self.randomModel = 0	end

		self.kvNum = 0
		
		self.ent1 = ents.Create("npc_citizen")
		self.ent1:SetPos(self:GetPos() + self:GetForward() * 25 + self:GetRight() * -25)
		self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent1:SetKeyValue( "citizentype", "1" )
		if self.randomModel == 0 then	self.ent1:SetModel("models/humans/group01/male_04.mdl" )	end
		self.ent1:SetKeyValue( "DontPickupWeapons", "1" )
		self.ent1:SetKeyValue( "Expression Type", "Scared" )
		self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent1:Spawn()
		self.ent1:Activate()
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )

		self.ent2 = ents.Create("npc_citizen")
		self.ent2:SetPos(self:GetPos() + self:GetForward() * 25 + self:GetRight() * 25)
		self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent2:SetKeyValue( "citizentype", "1" )
		if self.randomModel == 0 then	self.ent2:SetModel("models/humans/group01/female_02.mdl" )	end
		self.ent2:SetKeyValue( "DontPickupWeapons", "1" )
		self.ent2:SetKeyValue( "Expression Type", "Scared" )
		self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent2:Spawn()
		self.ent2:Activate()
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )

		self.ent3 = ents.Create("npc_citizen")
		self.ent3:SetPos(self:GetPos() + self:GetForward() * -25 + self:GetRight() * -25)
		self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent3:SetKeyValue( "citizentype", "1" )
		if self.randomModel == 0 then	self.ent3:SetModel("models/humans/group01/male_03.mdl" )	end
		self.ent3:SetKeyValue( "DontPickupWeapons", "1" )
		self.ent3:SetKeyValue( "Expression Type", "Scared" )
		self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent3:Spawn()
		self.ent3:Activate()
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent4 = ents.Create("npc_citizen")
		self.ent4:SetPos(self:GetPos() + self:GetForward() * -25 + self:GetRight() * 25)
		self.ent4:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent4:SetKeyValue( "citizentype", "1" )
		if self.randomModel == 0 then	self.ent4:SetModel("models/humans/group01/female_04.mdl" )	end
		self.ent4:SetKeyValue( "DontPickupWeapons", "1" )
		self.ent4:SetKeyValue( "Expression Type", "Scared" )
		self.ent4:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent4:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent4:Spawn()
		self.ent4:Activate()
		self.ent4:SetSchedule( SCHED_IDLE_WANDER )

		if GetConVarNumber( "npcg_squad_human" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "HumanSquad" )
			self.ent2:SetKeyValue( "SquadName", "HumanSquad" )
			self.ent3:SetKeyValue( "SquadName", "HumanSquad" )
			self.ent4:SetKeyValue( "SquadName", "HumanSquad" )
		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 )	
			self.ent2:SetKeyValue( "wakesquad", 1 )	
			self.ent3:SetKeyValue( "wakesquad", 1 )	
			self.ent4:SetKeyValue( "wakesquad", 1 )	
		end

		self.ent1:AddRelationship("npc_combine_s D_FR 20")
		self.ent2:AddRelationship("npc_combine_s D_FR 20")
		self.ent3:AddRelationship("npc_combine_s D_FR 20")
		self.ent4:AddRelationship("npc_combine_s D_FR 20")
		
		self.ent1:AddRelationship("npc_metropolice D_FR 20")
		self.ent2:AddRelationship("npc_metropolice D_FR 20")
		self.ent3:AddRelationship("npc_metropolice D_FR 20")
		self.ent4:AddRelationship("npc_metropolice D_FR 20")
		
		self.ent1:AddRelationship("player D_FR 20")
		self.ent2:AddRelationship("player D_FR 20")
		self.ent3:AddRelationship("player D_FR 20")
		self.ent4:AddRelationship("player D_FR 20")
		
		self.ent1:AddRelationship("npc_zombie D_FR 100")
		self.ent2:AddRelationship("npc_zombie D_FR 100")
		self.ent3:AddRelationship("npc_zombie D_FR 100")
		self.ent4:AddRelationship("npc_zombie D_FR 100")
		
		self.ent1:AddRelationship("npc_fastzombie D_FR 100")
		self.ent2:AddRelationship("npc_fastzombie D_FR 100")
		self.ent3:AddRelationship("npc_fastzombie D_FR 100")
		self.ent4:AddRelationship("npc_fastzombie D_FR 100")

		self.ent1:AddRelationship("npc_posionzombie D_FR 100")
		self.ent2:AddRelationship("npc_posionzombie D_FR 100")
		self.ent3:AddRelationship("npc_posionzombie D_FR 100")
		self.ent4:AddRelationship("npc_posionzombie D_FR 100")

		self.ent1:AddRelationship("npc_zombine D_FR 100")
		self.ent2:AddRelationship("npc_zombine D_FR 100")
		self.ent3:AddRelationship("npc_zombine D_FR 100")
		self.ent4:AddRelationship("npc_zombine D_FR 100")

		self.ent1:AddRelationship("npc_rollermine D_FR 100")
		self.ent2:AddRelationship("npc_rollermine D_FR 100")
		self.ent3:AddRelationship("npc_rollermine D_FR 100")
		self.ent4:AddRelationship("npc_rollermine D_FR 100")

		self.ent1:AddRelationship("npc_headcrab D_FR 100")
		self.ent2:AddRelationship("npc_headcrab D_FR 100")
		self.ent3:AddRelationship("npc_headcrab D_FR 100")
		self.ent4:AddRelationship("npc_headcrab D_FR 100")

		self.ent1:AddRelationship("npc_headcrabfast D_FR 100")
		self.ent2:AddRelationship("npc_headcrabfast D_FR 100")
		self.ent3:AddRelationship("npc_headcrabfast D_FR 100")
		self.ent4:AddRelationship("npc_headcrabfast D_FR 100")

		self.ent1:AddRelationship("npc_headcrab_black D_FR 100")
		self.ent2:AddRelationship("npc_headcrab_black D_FR 100")
		self.ent3:AddRelationship("npc_headcrab_black D_FR 100")
		self.ent4:AddRelationship("npc_headcrab_black D_FR 100")

		timer.Simple(0, function()
			undo.Create( self.PrintName )
				if self.ent1:IsValid() then undo.AddEntity(self.ent1) end
				if self.ent2:IsValid() then undo.AddEntity(self.ent2) end
				if self.ent3:IsValid() then undo.AddEntity(self.ent3) end
				if self.ent4:IsValid() then undo.AddEntity(self.ent4) end
				undo.SetCustomUndoText("Undone " .. self.PrintName )
				undo.SetPlayer(self.Owner)
			undo.Finish()
			self:Remove()
		end)
	end
end
