
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Coward Rebel Fireteam"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= false

local	_WEP	=	{	"weapon_shotgun",	"weapon_pistol",	"weapon_smg1",	"weapon_ar2"	}

if SERVER then
	function ENT:Initialize()
		local medicDiceRoll = math.random( 1, GetConVarNumber("npcg_medicchance") )
		if medicDiceRoll == 1 then self.medicChance = 131072 else self.medicChance = 0 end
		--print("Rebel Medic Dice Roll is " .. medicDiceRoll )
		
		local rebSupplyDiceRoll = math.random( 1, GetConVarNumber("npcg_rebelresupplychance") )
		if rebSupplyDiceRoll == 1 then self.resupplyChance = 524288 else self.resupplyChance = 0 end
		--print("Rebel Supply Dice Roll is " .. rebSupplyDiceRoll )
		if ConVarExists("npcg_random_rebels") and GetConVarNumber("npcg_random_rebels") != 0 then	self.randomModel = 1	else	self.randomModel = 0	end
		if ConVarExists("npcg_weapondrop") and GetConVarNumber("npcg_weapondrop") != 0 then	self.weaponNum = 8192	else	self.weaponNum = 0	end
		if ConVarExists("npcg_ignorepushing") and GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_fade_corpse") and GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if ConVarExists("npcg_longvision") and GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end
		self.kvNum = 0
		
		self.ent1 = ents.Create("npc_citizen")
		self.ent1:SetPos(self:GetPos())
		self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent1:SetKeyValue( "citizentype", math.random(2,3) )
		if self.randomModel == 0 then	self.ent1:SetModel("models/humans/group01/male_07.mdl" )	end
		self.ent1:SetKeyValue( "DontPickupWeapons", GetConVarNumber("npcg_pickupguns") )
		self.ent1:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent1:SetKeyValue( "Expression Type", "Random" )
		self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
		self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent1:Spawn()
		self.ent1:Activate()
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent2 = ents.Create("npc_citizen")
		self.ent2:SetPos(self:GetPos() + self:GetForward() * 50 + self:GetRight() * 50)
		self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent2:SetKeyValue( "citizentype", math.random(2,3) )
		if self.randomModel == 0 then	self.ent2:SetModel("models/humans/group01/male_06.mdl" )	end
		self.ent2:SetKeyValue( "DontPickupWeapons", GetConVarNumber("npcg_pickupguns") )
		self.ent2:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent2:SetKeyValue( "Expression Type", "Random" )
		self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
		self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent2:Spawn()
		self.ent2:Activate()
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent3 = ents.Create("npc_citizen")
		self.ent3:SetPos(self:GetPos() + self:GetForward() * -50 + self:GetRight() * -50)
		self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent3:SetKeyValue( "citizentype", math.random(2,3) )
		if self.randomModel == 0 then	self.ent3:SetModel("models/humans/group01/female_04.mdl" )	end
		self.ent3:SetKeyValue( "DontPickupWeapons", GetConVarNumber("npcg_pickupguns") )
		self.ent3:SetKeyValue( "additionalequipment", "weapon_shotgun" )
		self.ent3:SetKeyValue( "Expression Type", "Random" )
		self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
		self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent3:Spawn()
		self.ent3:Activate()
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent4 = ents.Create("npc_citizen")
		self.ent4:SetPos(self:GetPos() + self:GetForward() * -50 + self:GetRight() * 50)
		self.ent4:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent4:SetKeyValue( "citizentype", math.random(2,3) )
		if self.randomModel == 0 then	self.ent4:SetModel("models/humans/group01/female_01.mdl" )	end
		self.ent4:SetKeyValue( "DontPickupWeapons", GetConVarNumber("npcg_pickupguns") )
		self.ent4:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent4:SetKeyValue( "Expression Type", "Random" )
		self.ent4:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
		self.ent4:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent4:Spawn()
		self.ent4:Activate()
		self.ent4:SetSchedule( SCHED_IDLE_WANDER )
		
		if IsMounted( "ep2" ) and GetConVarNumber("npcg_squaddies_vort") != 0 then
			self.ent5 = ents.Create("npc_vortigaunt")
			self.ent5:SetPos(self:GetPos() + self:GetForward() * 50 + self:GetRight() * -50)
			self.ent5:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			if GetConVarNumber( "npcg_squad_vort" ) != 0	then	self.ent5:SetKeyValue( "SquadName", "HumanSquad" )	end
			if	GetConVarNumber("npcg_accuracy_vortigaunt") >= 4	then
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			elseif	GetConVarNumber("npcg_accuracy_vortigaunt") == 3	then
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			elseif	GetConVarNumber("npcg_accuracy_vortigaunt") == 2	then
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			elseif	GetConVarNumber("npcg_accuracy_vortigaunt") == 1	then
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			else
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)		
			end
			self.ent5:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
			self.ent5:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
			self.ent5:Spawn()
			self.ent5:Activate()
			self.ent5:SetSchedule( SCHED_IDLE_WANDER )
		else
			self.ent5 = ents.Create("npc_citizen")
			self.ent5:SetPos(self:GetPos() + self:GetForward() * 50 + self:GetRight() * -50)
			self.ent5:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent5:SetKeyValue( "citizentype", math.random(2,3) )
			if self.randomModel == 0 then	self.ent5:SetModel("models/humans/group01/male_09.mdl" )	end
			self.ent5:SetHealth( GetConVarNumber("npcg_healthoverride_reb") )
			if GetConVarNumber( "npcg_squad_human" ) != 0	then	self.ent5:SetKeyValue( "SquadName", "HumanSquad" )	end
			if	GetConVarNumber("npcg_accuracy_rebel") >= 4	then
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			elseif	GetConVarNumber("npcg_accuracy_rebel") == 3	then
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			elseif	GetConVarNumber("npcg_accuracy_rebel") == 2	then
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			elseif	GetConVarNumber("npcg_accuracy_rebel") == 1	then
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			else
				self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)		
			end
			self.ent5:SetKeyValue( "DontPickupWeapons", GetConVarNumber("npcg_pickupguns") )
			self.ent5:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
			self.ent5:SetKeyValue( "Expression Type", "Random" )
			self.ent5:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
			self.ent5:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
			self.ent5:Spawn()
			self.ent5:Activate()
			self.ent5:SetSchedule( SCHED_IDLE_WANDER )
		end

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
			self.ent5:SetKeyValue( "wakesquad", 1 )	
		end
		self.ent1:AddRelationship("npc_combine_s D_FR 20")
		self.ent2:AddRelationship("npc_combine_s D_FR 20")
		self.ent3:AddRelationship("npc_combine_s D_FR 20")
		self.ent4:AddRelationship("npc_combine_s D_FR 20")
		self.ent5:AddRelationship("npc_combine_s D_FR 20")
		
		self.ent1:AddRelationship("npc_metropolice D_FR 20")
		self.ent2:AddRelationship("npc_metropolice D_FR 20")
		self.ent3:AddRelationship("npc_metropolice D_FR 20")
		self.ent4:AddRelationship("npc_metropolice D_FR 20")
		self.ent5:AddRelationship("npc_metropolice D_FR 20")
		
		self.ent1:AddRelationship("player D_FR 20")
		self.ent2:AddRelationship("player D_FR 20")
		self.ent3:AddRelationship("player D_FR 20")
		self.ent4:AddRelationship("player D_FR 20")
		self.ent5:AddRelationship("player D_FR 20")
		
		self.ent1:AddRelationship("*zombie* D_FR 100")
		self.ent2:AddRelationship("*zombie* D_FR 100")
		self.ent3:AddRelationship("*zombie* D_FR 100")
		self.ent4:AddRelationship("*zombie* D_FR 100")
		self.ent5:AddRelationship("*zombie* D_FR 100")
			
		self.ent1:AddRelationship("*headcrab* D_FR 100")
		self.ent2:AddRelationship("*headcrab* D_FR 100")
		self.ent3:AddRelationship("*headcrab* D_FR 100")
		self.ent4:AddRelationship("*headcrab* D_FR 100")
		self.ent5:AddRelationship("*headcrab* D_FR 100")
		if	GetConVarNumber("npcg_accuracy_rebel") >= 4	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber("npcg_accuracy_rebel") == 3	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_rebel") == 2	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_rebel") == 1	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
		else
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)	
		end

		timer.Simple(0, function()
			undo.Create( self.PrintName )
				if self.ent1:IsValid() then undo.AddEntity(self.ent1) end
				if self.ent2:IsValid() then undo.AddEntity(self.ent2) end
				if self.ent3:IsValid() then undo.AddEntity(self.ent3) end
				if self.ent4:IsValid() then undo.AddEntity(self.ent4) end
				if self.ent5:IsValid() then undo.AddEntity(self.ent5) end
				undo.SetCustomUndoText("Undone " .. self.PrintName )
				undo.SetPlayer(self.Owner)
			undo.Finish()
			self:Remove()
		end)
	end
end
