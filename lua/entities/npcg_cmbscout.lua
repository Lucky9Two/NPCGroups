
AddCSLuaFile()

if !ConVarExists( "npcg_cmbelite_ar2altdrop" ) then CreateConVar(	"npcg_cmbelite_ar2altdrop",			"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_randomizer_cmb" ) then CreateConVar(	"npcg_randomizer_cmb",				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_cmb" ) then CreateConVar(	"npcg_wakeradius_cmb",				"200",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Combine Scouts"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= false

local	_WEP	=	{	"weapon_smg1",	"weapon_ar2"	}

if SERVER then
	function ENT:Initialize()

		if ConVarExists("npcg_cmbelite_ar2altdrop") and GetConVarNumber("npcg_cmbelite_ar2altdrop") != 0 then	self.ar2AltDrop = 393732	else	self.ar2AltDrop = 0	end
		if ConVarExists("npcg_weapondrop") and GetConVarNumber("npcg_weapondrop") != 0 then	self.weaponNum = 8192	else	self.weaponNum = 0	end
		if ConVarExists("npcg_ignorepushing") and GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_fade_corpse") and GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if ConVarExists("npcg_longvision") and GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end
		
		self.kvNum = 0
		
		self.ent1 = ents.Create("npc_combine_s")
		self.ent1:SetPos(self:GetPos())
		self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent1:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent1:SetKeyValue( "NumGrenades", GetConVarNumber("npcg_grenadecount") )
		self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cmb" ) )
		self.ent1:Spawn()
		self.ent1:Activate()
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent2 = ents.Create("npc_clawscanner")
		self.ent2:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() + self:GetUp() * 50 )
		self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_scanner" ) )
		self.ent2:Spawn()
		self.ent2:Activate()
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent3 = ents.Create("npc_combine_s")
		self.ent3:SetPos(self:GetPos() + self:GetRight() * -50 + self:GetForward() )
		self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent3:SetKeyValue( "additionalequipment", table.Random( _WEP ) )
		self.ent3:SetKeyValue( "NumGrenades", GetConVarNumber("npcg_grenadecount") )
		self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cmb" ) )
		self.ent3:Spawn()
		self.ent3:Activate()
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )

		if GetConVarNumber( "npcg_squad_combine" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "CombineSquad" )
			self.ent2:SetKeyValue( "SquadName", "CombineSquad" )
			self.ent3:SetKeyValue( "SquadName", "CombineSquad" )
		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 )	
			self.ent2:SetKeyValue( "wakesquad", 1 )	
			self.ent3:SetKeyValue( "wakesquad", 1 )	
		end

		if	GetConVarNumber("npcg_combine_tacticalvar") > 1	then
			self.ent1:SetKeyValue( "tacticalvariant", 2 )
			self.ent3:SetKeyValue( "tacticalvariant", 2 )	
		elseif	GetConVarNumber("npcg_combine_tacticalvar") != 0	then
			self.ent1:SetKeyValue( "tacticalvariant", 1 )
			self.ent3:SetKeyValue( "tacticalvariant", 1 )	
		else
			self.ent1:SetKeyValue( "tacticalvariant", 0 )
			self.ent3:SetKeyValue( "tacticalvariant", 0 )
		end
		
		if	GetConVarNumber("npcg_accuracy_combine") >= 4	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 3	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 2	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 1	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
		else
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
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
