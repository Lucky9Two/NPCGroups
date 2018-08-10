
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Rebel Scouts"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= true

local	_WEP	=	{	"weapon_pistol",	"weapon_smg1"	}

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
		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent1:SetAngles( Angle( 0 , 0 , 0 ) )
		else
			self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		end
		self.ent1:SetKeyValue( "citizentype", math.random(2,3) )
		if self.randomModel == 0 then	self.ent1:SetModel("models/humans/group03/male_07.mdl" ) end
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
		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent2:SetAngles( Angle( 0 , 0 , 0 ) )
		else
			self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		end
		self.ent2:SetKeyValue( "citizentype", math.random(2,3) )
		if self.randomModel == 0 then	self.ent2:SetModel("models/humans/group03/male_06.mdl" ) end
		self.ent2:SetKeyValue( "DontPickupWeapons", GetConVarNumber("npcg_pickupguns") )
		self.ent2:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent2:SetKeyValue( "Expression Type", "Random" )
		self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
		self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent2:Spawn()
		self.ent2:Activate()
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )
		
		if IsMounted( "ep2" ) then
			self.ent3 = ents.Create("npc_vortigaunt")
			self.ent3:SetPos(self:GetPos() + self:GetForward() * 50 + self:GetRight() * -50)
			if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent3:SetAngles( Angle( 0 , 0 , 0 ) )
		else
			self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		end
			if GetConVarNumber( "npcg_squad_vort" ) != 0	then	self.ent3:SetKeyValue( "SquadName", "Human" ) end
			if	GetConVarNumber("npcg_accuracy_vortigaunt") >= 4	then
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			elseif	GetConVarNumber("npcg_accuracy_vortigaunt") == 3	then
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			elseif	GetConVarNumber("npcg_accuracy_vortigaunt") == 2	then
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			elseif	GetConVarNumber("npcg_accuracy_vortigaunt") == 1	then
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			else
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR) 	
			end
			self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
			self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
			self.ent3:Spawn()
			self.ent3:Activate()
			self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		else
			self.ent3 = ents.Create("npc_citizen")
			self.ent3:SetPos(self:GetPos() + self:GetForward() * 50 + self:GetRight() * -50)
			if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent3:SetAngles( Angle( 0 , 0 , 0 ) )
		else
			self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		end
			self.ent3:SetKeyValue( "citizentype", math.random(2,3) )
			if self.randomModel == 0 then	self.ent3:SetModel("models/humans/group03/female_03.mdl" ) end
			if GetConVarNumber( "npcg_squad_human" ) != 0	then	self.ent3:SetKeyValue( "SquadName", "Human" ) end
			if	GetConVarNumber("npcg_accuracy_rebel") >= 4	then
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			elseif	GetConVarNumber("npcg_accuracy_rebel") == 3	then
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			elseif	GetConVarNumber("npcg_accuracy_rebel") == 2	then
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			elseif	GetConVarNumber("npcg_accuracy_rebel") == 1	then
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			else
				self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR) 	
			end
			self.ent3:SetKeyValue( "DontPickupWeapons", GetConVarNumber("npcg_pickupguns") )
			self.ent3:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
			self.ent3:SetKeyValue( "Expression Type", "Random" )
			self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
			self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_human" ) )
			self.ent3:Spawn()
			self.ent3:Activate()
			self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		end

		if GetConVarNumber( "npcg_squad_human" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "Human" )
			self.ent2:SetKeyValue( "SquadName", "Human" )
		end
		
		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 ) 
			self.ent2:SetKeyValue( "wakesquad", 1 ) 
			self.ent3:SetKeyValue( "wakesquad", 1 ) 
		end
		if	GetConVarNumber("npcg_accuracy_rebel") >= 4	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber("npcg_accuracy_rebel") == 3	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_rebel") == 2	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_rebel") == 1	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
		else
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
		end

		timer.Simple(0, function()
			undo.Create( self.PrintName )
				if self.ent1:IsValid() then undo.AddEntity(self.ent1) end
				if self.ent2:IsValid() then undo.AddEntity(self.ent2) end
				if self.ent3:IsValid() then undo.AddEntity(self.ent3) end
				undo.SetCustomUndoText("Undone " .. self.PrintName )
				undo.SetPlayer(self.Owner)
			undo.Finish()
			self:Remove()
		end)
	end
end
