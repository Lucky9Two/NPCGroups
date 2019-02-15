
AddCSLuaFile( )

if not ConVarExists( "npcg_custom_model_citizen" ) then CreateConVar( "npcg_custom_model_citizen" , "models/humans/group01/male_09.mdl" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Custom Citizen"
ENT.Author = "V92"
ENT.Information = ""
ENT.Category = "NPCGroups"
ENT.Spawnable = false
ENT.AdminOnly = false

if SERVER then

	function ENT:Initialize( )


		if ConVarExists( "npcg_weapondrop" ) and GetConVarNumber( "npcg_weapondrop" ) != 0 then self.weaponNum = 8192 else self.weaponNum = 0 end
		if ConVarExists( "npcg_ignorepushing" ) and GetConVarNumber( "npcg_ignorepushing" ) != 0 then self.pushNum = 16384 else self.pushNum = 0 end
		if ConVarExists( "npcg_fade_corpse" ) and GetConVarNumber( "npcg_fade_corpse" ) != 0 then self.fadeNum = 512 else self.fadeNum = 0 end
		if ConVarExists( "npcg_longvision" ) and GetConVarNumber( "npcg_longvision" ) != 0 then self.longNum = 256 else self.longNum = 0 end

		self.kvNum = 0

		self.ent1 = ents.Create( "npc_citizen" )
		self.ent1:SetPos( self:GetPos( ) + self:GetForward( ) * 25 + self:GetRight( ) * 25 )
		self.ent1:SetKeyValue( "citizentype" , "4" )
		self.ent1:SetModel( GetConVarString( "npcg_custom_model_citizen" ) )
		self.ent1:SetKeyValue( "DontPickupWeapons" , "1" )
		self.ent1:SetKeyValue( "Expression Type" , "Scared" )
		self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_human" ) )
		self.ent1:Spawn( )
		self.ent1:Activate( )
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then

			self.ent1:SetKeyValue( "wakesquad" , 1 )

		end

		if GetConVarNumber( "npcg_squad_human" ) != 0 then

			self.ent1:SetKeyValue( "SquadName" , "Human" )

	end

		if	GetConVarNumber( "npcg_accuracy_rebels" ) >= 4 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )

		elseif	GetConVarNumber( "npcg_accuracy_rebels" ) == 3 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )

		elseif	GetConVarNumber( "npcg_accuracy_rebels" ) == 2 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )

		elseif	GetConVarNumber( "npcg_accuracy_rebels" ) == 1 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )

		else
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )

		end

		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then

			self.ent1:SetAngles( Angle( 0 , 0 , 0 ) )

		else
			self.ent1:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) )

		end

		self.ent1:AddRelationship( "npc_combine_s D_FR 20" )
		
		self.ent1:AddRelationship( "npc_metropolice D_FR 20" )
		
		self.ent1:AddRelationship( "player D_FR 20" )
		
		self.ent1:AddRelationship( "npc_zombie D_FR 100" )
		
		self.ent1:AddRelationship( "npc_fastzombie D_FR 100" )

		self.ent1:AddRelationship( "npc_posionzombie D_FR 100" )

		self.ent1:AddRelationship( "npc_zombine D_FR 100" )

		self.ent1:AddRelationship( "npc_rollermine D_FR 100" )

		self.ent1:AddRelationship( "npc_headcrab D_FR 100" )

		self.ent1:AddRelationship( "npc_headcrabfast D_FR 100" )

		self.ent1:AddRelationship( "npc_headcrab_black D_FR 100" )

		timer.Simple( 0 , function( )
			undo.Create( self.PrintName )
				if self.ent1:IsValid( ) then undo.AddEntity( self.ent1 ) end
				undo.SetCustomUndoText( "Undone " .. self.PrintName )
				undo.SetPlayer( self.Owner)
			undo.Finish( )
			self:Remove( )

		end )

	end

end
