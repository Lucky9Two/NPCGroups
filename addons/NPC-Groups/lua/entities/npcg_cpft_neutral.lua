
AddCSLuaFile( )

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Neutral Police Fireteam"
ENT.Author = "V92"
ENT.Information = ""
ENT.Category = "NPCGroups"
ENT.Spawnable = false
ENT.AdminOnly = false

local WeaponTbl = { "weapon_stunstick" , "weapon_pistol" , "weapon_smg1" , }

if SERVER then
	function ENT:Initialize( )

		if ConVarExists( "npcg_weapondrop" ) and GetConVarNumber( "npcg_weapondrop" ) != 0 then self.weaponNum = 8192 else self.weaponNum = 0	end
		if ConVarExists( "npcg_ignorepushing" ) and GetConVarNumber( "npcg_ignorepushing" ) != 0 then self.pushNum = 16384 else self.pushNum = 0	end
		if ConVarExists( "npcg_fade_corpse" ) and GetConVarNumber( "npcg_fade_corpse" ) != 0 then self.fadeNum = 512 else self.fadeNum = 0	end
		if ConVarExists( "npcg_longvision" ) and GetConVarNumber( "npcg_longvision" ) != 0 then self.longNum = 256 else self.longNum = 0	end

		self.kvNum = 0
		
		self.ent1 = ents.Create( "npc_metropolice" )
		self.ent1:SetPos( self:GetPos( ) )
		self.ent1:SetKeyValue( "additionalequipment" , table.Random( WeaponTbl ) )
		self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent1:Spawn( )
		self.ent1:Activate( )
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )

		self.ent2 = ents.Create( "npc_metropolice" )
		self.ent2:SetPos( self:GetPos( ) + self:GetForward( ) * 50 + self:GetRight( ) * 50 )
		self.ent2:SetKeyValue( "additionalequipment" , table.Random( WeaponTbl ) )
		self.ent2:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent2:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent2:Spawn( )
		self.ent2:Activate( )
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )

		self.ent3 = ents.Create( "npc_metropolice" )
		self.ent3:SetPos( self:GetPos( ) + self:GetForward( ) * 50 + self:GetRight( ) * -50 )
		self.ent3:SetKeyValue( "additionalequipment" , table.Random( WeaponTbl ) )
		self.ent3:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent3:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent3:Spawn( )
		self.ent3:Activate( )
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent4 = ents.Create( "npc_metropolice" )
		self.ent4:SetPos( self:GetPos( ) + self:GetForward( ) * -50 + self:GetRight( ) * 50 )
		self.ent4:SetKeyValue( "additionalequipment" , table.Random( WeaponTbl ) )
		self.ent4:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent4:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent4:Spawn( )
		self.ent4:Activate( )
		self.ent4:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent5 = ents.Create( "npc_metropolice" )
		self.ent5:SetPos( self:GetPos( ) + self:GetForward( ) * -50 + self:GetRight( ) * -50 )
		self.ent5:SetKeyValue( "additionalequipment" , table.Random( WeaponTbl ) )
		self.ent5:SetKeyValue( "manhacks" , GetConVarNumber( "npcg_manhackcount" ) )
		self.ent5:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent5:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cp" ) )
		self.ent5:Spawn( ) 
		self.ent5:Activate( ) 
		self.ent5:SetSchedule( SCHED_IDLE_WANDER )

		if GetConVarNumber( "npcg_squad_police" ) != 0 then
			self.ent1:SetKeyValue( "SquadName" , "Combine" )
			self.ent2:SetKeyValue( "SquadName" , "Combine" )
			self.ent3:SetKeyValue( "SquadName" , "Combine" )
			self.ent4:SetKeyValue( "SquadName" , "Combine" )
			self.ent5:SetKeyValue( "SquadName" , "Combine" )
		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then 
			self.ent1:SetKeyValue( "wakesquad" , 1 ) 
			self.ent2:SetKeyValue( "wakesquad" , 1 ) 
			self.ent3:SetKeyValue( "wakesquad" , 1 ) 
			self.ent4:SetKeyValue( "wakesquad" , 1 ) 
			self.ent5:SetKeyValue( "wakesquad" , 1 ) 
		end

		if	GetConVarNumber( "npcg_accuracy_cp" ) >= 4 then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber( "npcg_accuracy_cp" ) == 3 then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber( "npcg_accuracy_cp" ) == 2 then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent2:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent3:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent4:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
			self.ent5:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber( "npcg_accuracy_cp" ) == 1 then
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
		
		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent1:SetAngles( Angle( 0 , 0 , 0 ) ) 
			self.ent2:SetAngles( Angle( 0 , 0 , 0 ) ) 
			self.ent3:SetAngles( Angle( 0 , 0 , 0 ) ) 
			self.ent4:SetAngles( Angle( 0 , 0 , 0 ) ) 
			self.ent5:SetAngles( Angle( 0 , 0 , 0 ) ) 
		else
			self.ent1:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
			self.ent2:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
			self.ent3:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
			self.ent4:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
			self.ent5:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
		end

		self.ent1:AddRelationship( "player D_NU 200" )
		self.ent1:AddRelationship( "npc_citizen D_NU 200" )
		self.ent1:AddRelationship( "npc_vortigaunt D_NU 200" )
		
		self.ent2:AddRelationship( "player D_NU 200" )
		self.ent2:AddRelationship( "npc_citizen D_NU 200" )
		self.ent2:AddRelationship( "npc_vortigaunt D_NU 200" )
		
		self.ent3:AddRelationship( "player D_NU 200" )
		self.ent3:AddRelationship( "npc_citizen D_NU 200" )
		self.ent3:AddRelationship( "npc_vortigaunt D_NU 200" )
		
		self.ent4:AddRelationship( "player D_NU 200" )
		self.ent4:AddRelationship( "npc_citizen D_NU 200" )
		self.ent4:AddRelationship( "npc_vortigaunt D_NU 200" )
		
		self.ent5:AddRelationship( "player D_NU 200" )
		self.ent5:AddRelationship( "npc_citizen D_NU 200" )
		self.ent5:AddRelationship( "npc_vortigaunt D_NU 200" )

		timer.Simple( 0 , function( )
			undo.Create( self.PrintName )
				if self.ent1:IsValid( ) then undo.AddEntity( self.ent1 ) end
				if self.ent2:IsValid( ) then undo.AddEntity( self.ent2 ) end
				if self.ent3:IsValid( ) then undo.AddEntity( self.ent3 ) end
				if self.ent4:IsValid( ) then undo.AddEntity( self.ent4 ) end
				if self.ent5:IsValid( ) then undo.AddEntity( self.ent5 ) end
				undo.SetCustomUndoText( "Undone " .. self.PrintName )
				undo.SetPlayer( self.Owner)
			undo.Finish( )
			self:Remove( )
		end)
	end
end
