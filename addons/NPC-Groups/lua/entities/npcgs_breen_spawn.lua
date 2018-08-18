
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Dr. Breen Spawner"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

	function ENT:Initialize()

		self:SetModel( "models/props_c17/oildrum001.mdl" )
		self:DrawShadow( false )
		self:SetNoDraw( true )
		self:SetNotSolid( true )

		if GetConVarNumber("npcg_cmbelite_ar2altdrop") != 0 then	self.ar2AltDrop = 393732	else	self.ar2AltDrop = 0	end
		if GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_weapondrop") and GetConVarNumber("npcg_weapondrop") != 0 then	self.weaponNum = 8192	else	self.weaponNum = 0	end
		if GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end
		
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

		self.ent1:AddRelationship("player D_FR 999")
		self.ent1:AddRelationship("npc_citizen D_FR 200")
		self.ent1:AddRelationship("npc_headcrab D_FR 300")
		self.ent1:AddRelationship("npc_headcrab_fast D_FR 350")
		self.ent1:AddRelationship("npc_headcrab_black D_FR 375")
		self.ent1:AddRelationship("npc_vortigaunt D_FR 400")

		if GetConVarNumber( "npcg_squad_combine" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "Combine" )
		end
		
		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 ) 
		end

		if	GetConVarNumber("npcg_accuracy_combine") >= 4	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 3	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 2	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 1	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
		else
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR) 
		end

		timer.Simple( 0 , function( )

			undo.Create( self.PrintName )

			undo.AddEntity( self )

			if self.ent1:IsValid( ) then undo.AddEntity( self.ent1 ) end

			undo.SetCustomUndoText( "Undone " .. self.PrintName )
			undo.SetPlayer( self.Owner )

			undo.Finish( )

		end )

	end

	function ENT:Think()

		if !self.ent1:IsValid() then		

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

			self.ent1:AddRelationship("player D_FR 999")
			self.ent1:AddRelationship("npc_citizen D_FR 200")
			self.ent1:AddRelationship("npc_headcrab D_FR 300")
			self.ent1:AddRelationship("npc_headcrab_fast D_FR 350")
			self.ent1:AddRelationship("npc_headcrab_black D_FR 375")
			self.ent1:AddRelationship("npc_vortigaunt D_FR 400")
			
		end

		if GetConVarNumber( "npcg_squad_combine" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "Combine" )
		end
		
		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 ) 
		end

		if	GetConVarNumber("npcg_accuracy_combine") >= 4	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 3	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 2	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber("npcg_accuracy_combine") == 1	then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
		else
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR) 
		end

	end
end
