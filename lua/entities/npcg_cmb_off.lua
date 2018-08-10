
AddCSLuaFile()

if !ConVarExists( "npcg_cmbelite_ar2altdrop" ) then CreateConVar(	"npcg_cmbelite_ar2altdrop",			"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_randomizer_cmb" ) then CreateConVar(	"npcg_randomizer_cmb",				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_cmb" ) then CreateConVar(	"npcg_wakeradius_cmb",				"200",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Combine Officers"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then
	function ENT:Initialize()

		if ConVarExists("npcg_cmbelite_ar2altdrop") and GetConVarNumber("npcg_cmbelite_ar2altdrop") != 0 then	self.ar2AltDrop = 393732	else	self.ar2AltDrop = 0	end
		if ConVarExists("npcg_weapondrop") and GetConVarNumber("npcg_weapondrop") != 0 then	self.weaponNum = 8192	else	self.weaponNum = 0	end
		if ConVarExists("npcg_ignorepushing") and GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_fade_corpse") and GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if ConVarExists("npcg_longvision") and GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end
		
		self.kvNum = 0
		
		self.ent1 = ents.Create("npc_breen")
		self.ent1:SetPos(self:GetPos())
		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent1:SetAngles( Angle( 0 , 0 , 0 ) )
		else
			self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		end
		self.ent1:SetKeyValue( "spawnflags", tostring(401408 - self.weaponNum))
		self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cmb" ) )
		self.ent1:Spawn()
		self.ent1:Activate()
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )

		self.ent2 = ents.Create("npc_combine_s")
		self.ent2:SetPos(self:GetPos() + self:GetForward() * 50 + self:GetRight() * -50)
		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent2:SetAngles( Angle( 0 , 0 , 0 ) )
		else
			self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		end
		self.ent2:SetModel("models/combine_super_soldier.mdl" )
		self.ent2:SetKeyValue( "additionalequipment", "weapon_ar2" )
		self.ent2:SetKeyValue( "NumGrenades", GetConVarNumber("npcg_grenadecount") )
		self.ent2:SetKeyValue( "spawnflags", tostring(401408 - self.weaponNum))
		self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.ar2AltDrop ) )
		self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cmb" ) )
		self.ent2:Spawn()
		self.ent2:Activate()
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent3 = ents.Create("npc_combine_s")
		self.ent3:SetPos(self:GetPos() + self:GetForward() * -50 + self:GetRight() * -50)
		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent3:SetAngles( Angle( 0 , 0 , 0 ) )
		else
			self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		end
		self.ent3:SetModel("models/combine_super_soldier.mdl" )
		self.ent3:SetKeyValue( "additionalequipment", "weapon_ar2" )
		self.ent3:SetKeyValue( "NumGrenades", GetConVarNumber("npcg_grenadecount") )
		self.ent3:SetKeyValue( "spawnflags", tostring(401408 - self.weaponNum))
		self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.ar2AltDrop ) )
		self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cmb" ) )
		self.ent3:Spawn()
		self.ent3:Activate()
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent4 = ents.Create("npc_combine_s")
		self.ent4:SetPos(self:GetPos() + self:GetForward() * -50 + self:GetRight() * 50)
		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent4:SetAngles( Angle( 0 , 0 , 0 ) )
		else
			self.ent4:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		end
		self.ent4:SetModel("models/combine_super_soldier.mdl" )
		self.ent4:SetKeyValue( "additionalequipment", "weapon_ar2" )
		self.ent4:SetKeyValue( "NumGrenades", GetConVarNumber("npcg_grenadecount") )
		self.ent4:SetKeyValue( "spawnflags", tostring(401408 - self.weaponNum))
		self.ent4:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.ar2AltDrop ) )
		self.ent4:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cmb" ) )
		self.ent4:Spawn()
		self.ent4:Activate()
		self.ent4:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent5 = ents.Create("npc_combine_s")
		self.ent5:SetPos(self:GetPos() + self:GetForward() * 50 + self:GetRight() * 50 )
		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent5:SetAngles( Angle( 0 , 0 , 0 ) )
			else
			self.ent5:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			end
		self.ent5:SetModel("models/combine_super_soldier.mdl" )
		self.ent5:SetKeyValue( "additionalequipment", "weapon_ar2" )
		self.ent5:SetKeyValue( "NumGrenades", GetConVarNumber("npcg_grenadecount") )
		self.ent5:SetKeyValue( "spawnflags", tostring(401408 - self.weaponNum))
		self.ent5:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.ar2AltDrop ) )
		self.ent5:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_cmb" ) )
		self.ent5:Spawn()
		self.ent5:Activate()
		self.ent5:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent1:AddRelationship("player D_FR 999")
		self.ent1:AddRelationship("npc_citizen D_FR 200")
		self.ent1:AddRelationship("npc_headcrab D_FR 300")
		self.ent1:AddRelationship("npc_headcrab_fast D_FR 350")
		self.ent1:AddRelationship("npc_headcrab_black D_FR 375")
		self.ent1:AddRelationship("npc_vortigaunt D_FR 400")

		if GetConVarNumber( "npcg_healthvariant_cmb" ) > 1 then
			self.ent2:SetHealth( GetConVarNumber("npcg_healthoverride_cmb") )
			self.ent3:SetHealth( GetConVarNumber("npcg_healthoverride_cmb") )
			self.ent4:SetHealth( GetConVarNumber("npcg_healthoverride_cmb") )
			self.ent5:SetHealth( GetConVarNumber("npcg_healthoverride_cmb") )
		elseif GetConVarNumber( "npcg_healthvariant_cmb" ) == 1 then
			self.ent2:SetHealth( math.random( 100, 150 ) )
			self.ent3:SetHealth( math.random( 100, 150 ) )
			self.ent4:SetHealth( math.random( 100, 150 ) )
			self.ent5:SetHealth( math.random( 100, 150 ) )
		end
		
		if GetConVarNumber( "npcg_squad_combine" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "Combine" )
			self.ent2:SetKeyValue( "SquadName", "Combine" )
			self.ent3:SetKeyValue( "SquadName", "Combine" )
			self.ent4:SetKeyValue( "SquadName", "Combine" )
			self.ent5:SetKeyValue( "SquadName", "Combine" )
		end
		
		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 ) 
			self.ent2:SetKeyValue( "wakesquad", 1 ) 
			self.ent3:SetKeyValue( "wakesquad", 1 ) 
			self.ent4:SetKeyValue( "wakesquad", 1 ) 
			self.ent5:SetKeyValue( "wakesquad", 1 ) 
		end

		if	GetConVarNumber("npcg_combine_tacticalvar") > 1	then
			self.ent2:SetKeyValue( "tacticalvariant", 2 )
			self.ent3:SetKeyValue( "tacticalvariant", 2 )
			self.ent4:SetKeyValue( "tacticalvariant", 2 )
			self.ent5:SetKeyValue( "tacticalvariant", 2 )
		elseif	GetConVarNumber("npcg_combine_tacticalvar") != 0	then
			self.ent2:SetKeyValue( "tacticalvariant", 1 )
			self.ent3:SetKeyValue( "tacticalvariant", 1 )
			self.ent4:SetKeyValue( "tacticalvariant", 1 )
			self.ent5:SetKeyValue( "tacticalvariant", 1 )
		else
			self.ent2:SetKeyValue( "tacticalvariant", 0 )
			self.ent3:SetKeyValue( "tacticalvariant", 0 )
			self.ent4:SetKeyValue( "tacticalvariant", 0 )
			self.ent5:SetKeyValue( "tacticalvariant", 0 ) 
		end
		
		if	GetConVarNumber("npcg_accuracy_combine") >= 4	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 3	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 2	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 1	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
		else
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR) 	
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
