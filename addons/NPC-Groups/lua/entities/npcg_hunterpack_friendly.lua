
AddCSLuaFile( )

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Friendly Hunters"
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
		if ConVarExists( "npcg_cmbelite_ar2altdrop" ) and GetConVarNumber( "npcg_cmbelite_ar2altdrop" ) != 0 then self.ar2AltDrop = 393732 else self.ar2AltDrop = 0 end
		if not ConVarExists( "npcg_wakeradius_hunter" ) then CreateConVar(	"npcg_wakeradius_hunter" , "275" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
		
		self.kvNum = 0
		
		if IsMounted( "ep2" ) then

			self.ent1 = ents.Create( "npc_hunter" )
			self.ent1:SetPos( self:GetPos( ) + self:GetRight( ) * -150 )
			self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_hunter" ) )
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )
			self.ent1:AddRelationship( "player D_LI 200" )
			self.ent1:AddRelationship( "npc_citizen D_LI 200" )
			self.ent1:AddRelationship( "npc_vortigaunt D_LI 200" )
			self.ent1:Spawn( )
			self.ent1:Activate( )

			self.ent2 = ents.Create( "npc_hunter" )
			self.ent2:SetPos( self:GetPos( ) + self:GetForward( ) * 150 )
			self.ent2:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent2:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_hunter" ) )
			self.ent2:SetSchedule( SCHED_IDLE_WANDER )
			self.ent2:AddRelationship( "player D_LI 200" )
			self.ent2:AddRelationship( "npc_citizen D_LI 200" )
			self.ent2:AddRelationship( "npc_vortigaunt D_LI 200" )
			self.ent2:Spawn( )
			self.ent2:Activate( )

			self.ent3 = ents.Create( "npc_hunter" )
			self.ent3:SetPos( self:GetPos( ) + self:GetRight( ) * 150 )
			self.ent3:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent3:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_hunter" ) )
			self.ent3:SetSchedule( SCHED_IDLE_WANDER )
			self.ent3:AddRelationship( "player D_LI 200" )
			self.ent3:AddRelationship( "npc_citizen D_LI 200" )
			self.ent3:AddRelationship( "npc_vortigaunt D_LI 200" )
			self.ent3:Spawn( )
			self.ent3:Activate( )

		else

			self.ent1 = ents.Create( "npc_combine_s" )
			self.ent1:SetPos( self:GetPos( ) + self:GetRight( ) * -150 )
			self.ent1:SetModel( "models/combine_super_soldier.mdl" )
			self.ent1:SetKeyValue( "additionalequipment" , "weapon_ar2" )
			self.ent1:SetKeyValue( "NumGrenades" , GetConVarNumber( "npcg_grenadecount" ) )
			self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.ar2AltDrop ) )
			self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cmb" ) )
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )
			self.ent1:AddRelationship( "player D_LI 200" )
			self.ent1:AddRelationship( "npc_citizen D_LI 200" )
			self.ent1:AddRelationship( "npc_vortigaunt D_LI 200" )
			self.ent1:Spawn( )
			self.ent1:Activate( )

			self.ent2 = ents.Create( "npc_combine_s" )
			self.ent2:SetPos( self:GetPos( ) + self:GetForward( ) * 150 )
			self.ent2:SetModel( "models/combine_super_soldier.mdl" )
			self.ent2:SetKeyValue( "additionalequipment" , "weapon_ar2" )
			self.ent2:SetKeyValue( "NumGrenades" , GetConVarNumber( "npcg_grenadecount" ) )
			self.ent2:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.ar2AltDrop ) )
			self.ent2:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cmb" ) )
			self.ent2:SetSchedule( SCHED_IDLE_WANDER )
			self.ent2:AddRelationship( "player D_LI 200" )
			self.ent2:AddRelationship( "npc_citizen D_LI 200" )
			self.ent2:AddRelationship( "npc_vortigaunt D_LI 200" )
			self.ent2:Spawn( )
			self.ent2:Activate( )

			self.ent3 = ents.Create( "npc_combine_s" )
			self.ent3:SetPos( self:GetPos( ) + self:GetRight( ) * 150 )
			self.ent3:SetModel( "models/combine_super_soldier.mdl" )
			self.ent3:SetKeyValue( "additionalequipment" , "weapon_ar2" )
			self.ent3:SetKeyValue( "NumGrenades" , GetConVarNumber( "npcg_grenadecount" ) )
			self.ent3:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.ar2AltDrop ) )
			self.ent3:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cmb" ) )
			self.ent3:SetSchedule( SCHED_IDLE_WANDER )
			self.ent3:AddRelationship( "player D_LI 200" )
			self.ent3:AddRelationship( "npc_citizen D_LI 200" )
			self.ent3:AddRelationship( "npc_vortigaunt D_LI 200" )
			self.ent3:Spawn( )
			self.ent3:Activate( )

		end
		
		if GetConVarNumber( "npcg_squad_combine" ) != 0 then

			self.ent1:SetKeyValue( "SquadName" , "Combine" )
			self.ent2:SetKeyValue( "SquadName" , "Combine" )
			self.ent3:SetKeyValue( "SquadName" , "Combine" )

		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then

			self.ent3:SetKeyValue( "wakesquad" , 1 ) 
			self.ent1:SetKeyValue( "wakesquad" , 1 )
			self.ent2:SetKeyValue( "wakesquad" , 1 )

		end

		if	GetConVarNumber( "npcg_accuracy_synth" ) >= 4 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )

		elseif	GetConVarNumber( "npcg_accuracy_synth" ) == 3 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )

		elseif	GetConVarNumber( "npcg_accuracy_synth" ) == 2 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )

		elseif	GetConVarNumber( "npcg_accuracy_synth" ) == 1 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )

		else

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )

		end

		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then

			self.ent1:SetAngles( Angle( 0 , 0 , 0 ) )
			self.ent2:SetAngles( Angle( 0 , 0 , 0 ) )
			self.ent3:SetAngles( Angle( 0 , 0 , 0 ) )

		else
			self.ent1:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) )
			self.ent2:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) )
			self.ent3:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) )

		end

		timer.Simple( 0 , function( )
			undo.Create( self.PrintName )
				if self.ent1:IsValid( ) then undo.AddEntity( self.ent1 ) end
				if self.ent2:IsValid( ) then undo.AddEntity( self.ent2 ) end
				if self.ent3:IsValid( ) then undo.AddEntity( self.ent3 ) end
				undo.SetCustomUndoText( "Undone " .. self.PrintName )
				undo.SetPlayer( self.Owner)
			undo.Finish( )
			self:Remove( )

		end )

	end

end
