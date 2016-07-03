
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Police Squad"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= false

local	_WEP	=	{	"weapon_stunstick",	"weapon_pistol",	"weapon_smg1",	}

if SERVER then
	function ENT:Initialize()

		if ConVarExists("npcg_weapondrop") and GetConVarNumber("npcg_weapondrop") != 0 then	self.weaponNum = 8192	else	self.weaponNum = 0	end
		if ConVarExists("npcg_ignorepushing") and GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_fade_corpse") and GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if ConVarExists("npcg_longvision") and GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end

		self.kvNum = 0
		
		self.ent1 = ents.Create("npc_metropolice")
		self.ent1:SetPos(self:GetPos())
		self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent1:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent1:Spawn()
		self.ent1:Activate()
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )

		self.ent2 = ents.Create("npc_metropolice")
		self.ent2:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * 100)
		self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent2:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent2:Spawn()
		self.ent2:Activate()
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )

		self.ent3 = ents.Create("npc_metropolice")
		self.ent3:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * -100)
		self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent3:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent3:SetKeyValue( "manhacks", GetConVarNumber("npcg_manhackcount") )
		self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent3:Spawn()
		self.ent3:Activate()
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )

		self.ent4 = ents.Create("npc_metropolice")
		self.ent4:SetPos(self:GetPos() + self:GetForward() * 120 + self:GetRight() * 0)
		self.ent4:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent4:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent4:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent4:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent4:Spawn()
		self.ent4:Activate()
		self.ent4:SetSchedule( SCHED_IDLE_WANDER )

		self.ent5 = ents.Create("npc_metropolice")
		self.ent5:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * 150)
		self.ent5:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent5:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent5:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent5:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent5:Spawn()
		self.ent5:Activate()
		self.ent5:SetSchedule( SCHED_IDLE_WANDER )

		self.ent6 = ents.Create("npc_metropolice")
		self.ent6:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * -150)
		self.ent6:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent6:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent6:SetKeyValue( "manhacks", GetConVarNumber("npcg_manhackcount") )
		self.ent6:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent6:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent6:Spawn()
		self.ent6:Activate()
		self.ent6:SetSchedule( SCHED_IDLE_WANDER )

		self.ent7 = ents.Create("npc_metropolice")
		self.ent7:SetPos(self:GetPos() + self:GetForward() * 0 + self:GetRight() * -50)
		self.ent7:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent7:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent7:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent7:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent7:Spawn()
		self.ent7:Activate()
		self.ent7:SetSchedule( SCHED_IDLE_WANDER )

		self.ent8 = ents.Create("npc_metropolice")
		self.ent8:SetPos(self:GetPos() + self:GetForward() * 0 + self:GetRight() * 50)
		self.ent8:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent8:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent8:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent8:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent8:Spawn()
		self.ent8:Activate()
		self.ent8:SetSchedule( SCHED_IDLE_WANDER )

		if GetConVarNumber("npcg_squaddies_hunter") != 0 then
			self.ent9 = ents.Create("npc_cscanner")
			self.ent9:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetUp() * 50 )
			self.ent9:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent9:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
			self.ent9:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_scanner" ) )
			self.ent9:SetSchedule( SCHED_IDLE_WANDER )
			self.ent9:Spawn()
			self.ent9:Activate()
		else
			self.ent9 = ents.Create("npc_metropolice")
			self.ent9:SetPos(self:GetPos() + self:GetForward() * 100 )
			self.ent9:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent9:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
			self.ent9:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
			self.ent9:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cp" ) )
			self.ent9:Spawn()
			self.ent9:Activate()
			self.ent9:SetSchedule( SCHED_IDLE_WANDER )
		end
		
		if GetConVarNumber( "npcg_squad_police" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "PoliceSquad" )
			self.ent2:SetKeyValue( "SquadName", "PoliceSquad" )
			self.ent3:SetKeyValue( "SquadName", "PoliceSquad" )
			self.ent4:SetKeyValue( "SquadName", "PoliceSquad" )
			self.ent5:SetKeyValue( "SquadName", "PoliceSquad" )
			self.ent6:SetKeyValue( "SquadName", "PoliceSquad" )
			self.ent7:SetKeyValue( "SquadName", "PoliceSquad" )
			self.ent8:SetKeyValue( "SquadName", "PoliceSquad" )
			self.ent9:SetKeyValue( "SquadName", "PoliceSquad" )
		end
		
		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 )	
			self.ent2:SetKeyValue( "wakesquad", 1 )	
			self.ent3:SetKeyValue( "wakesquad", 1 )	
			self.ent4:SetKeyValue( "wakesquad", 1 )	
			self.ent5:SetKeyValue( "wakesquad", 1 )	
			self.ent6:SetKeyValue( "wakesquad", 1 )	
			self.ent7:SetKeyValue( "wakesquad", 1 )	
			self.ent8:SetKeyValue( "wakesquad", 1 )	
			self.ent9:SetKeyValue( "wakesquad", 1 )	
		end
			
		if	GetConVarNumber("npcg_accuracy_cp") >= 4	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent6:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent7:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent8:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent9:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber("npcg_accuracy_cp") == 3	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent6:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent7:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent8:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent9:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_cp") == 2	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent6:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent7:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent8:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent9:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_cp") == 1	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent6:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent7:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent8:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent9:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
		else
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)		
			self.ent6:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)		
			self.ent7:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)		
			self.ent8:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)		
			self.ent9:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)		
		end


		timer.Simple(0, function()
			undo.Create( self.PrintName )
				if self.ent1:IsValid() then undo.AddEntity(self.ent1) end
				if self.ent2:IsValid() then undo.AddEntity(self.ent2) end
				if self.ent3:IsValid() then undo.AddEntity(self.ent3) end
				if self.ent4:IsValid() then undo.AddEntity(self.ent4) end
				if self.ent5:IsValid() then undo.AddEntity(self.ent5) end
				if self.ent6:IsValid() then undo.AddEntity(self.ent6) end
				if self.ent7:IsValid() then undo.AddEntity(self.ent7) end
				if self.ent8:IsValid() then undo.AddEntity(self.ent8) end
				if self.ent9:IsValid() then undo.AddEntity(self.ent9) end
				undo.SetCustomUndoText("Undone " .. self.PrintName )
				undo.SetPlayer(self.Owner)
			undo.Finish()
			self:Remove()
		end)
	end
end
