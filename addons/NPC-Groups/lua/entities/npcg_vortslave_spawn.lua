
AddCSLuaFile( )

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Vort Slave Spawner"
ENT.Author = "V92"
ENT.Information = ""
ENT.Category = "NPCGroups"
ENT.Spawnable = false
ENT.AdminOnly = false

if SERVER then

	function ENT:Initialize( )

		self:SetModel( "models/props_c17/oildrum001.mdl" )
		self:DrawShadow( false )
		self:SetNoDraw( true )
		self:SetNotSolid( true ) 

		if ConVarExists( "npcg_weapondrop" ) and GetConVarNumber( "npcg_weapondrop" ) != 0 then self.weaponNum = 8192 else self.weaponNum = 0 end
		if ConVarExists( "npcg_ignorepushing" ) and GetConVarNumber( "npcg_ignorepushing" ) != 0 then self.pushNum = 16384 else self.pushNum = 0 end
		if ConVarExists( "npcg_fade_corpse" ) and GetConVarNumber( "npcg_fade_corpse" ) != 0 then self.fadeNum = 512 else self.fadeNum = 0 end
		if ConVarExists( "npcg_longvision" ) and GetConVarNumber( "npcg_longvision" ) != 0 then self.longNum = 256 else self.longNum = 0 end

		self.kvNum = 0
		
		self.ent1 = ents.Create( "npc_vortigaunt" )
		self.ent1:SetPos( self:GetPos( ) + self:GetRight( ) * -50 )
		self.ent1:SetModel( "models/vortigaunt_slave.mdl"	)
		self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_vort" ) )
		self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
		self.ent1:Spawn( )
		self.ent1:Activate( )
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent2 = ents.Create( "npc_vortigaunt" )
		self.ent2:SetPos( self:GetPos( ) + self:GetForward( ) * 50 )
		self.ent2:SetModel( "models/vortigaunt_slave.mdl"	)
		self.ent2:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_vort" ) )
		self.ent2:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
		self.ent2:Spawn( )
		self.ent2:Activate( )
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )

		self.ent3 = ents.Create( "npc_vortigaunt" )
		self.ent3:SetPos( self:GetPos( ) + self:GetRight( ) * 50 )
		self.ent3:SetModel( "models/vortigaunt_slave.mdl"	)
		self.ent3:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_vort" ) )
		self.ent3:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
		self.ent3:Spawn( )
		self.ent3:Activate( )
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		
		if GetConVarNumber( "npcg_squad_vortslave" ) != 0 then

			self.ent1:SetKeyValue( "SquadName" , "SlaveVortSquad" )
			self.ent1:SetKeyValue( "SquadName" , "SlaveVortSquad" )
			self.ent3:SetKeyValue( "SquadName" , "SlaveVortSquad" )

		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then

			self.ent1:SetKeyValue( "wakesquad" , 1 )
			self.ent2:SetKeyValue( "wakesquad" , 1 ) 
			self.ent3:SetKeyValue( "wakesquad" , 1 )

		end

		if GetConVarNumber( "npcg_regenhealth_vort" ) != 0 then

			self.ent1:SetKeyValue( "HealthRegenerateEnabled" , 1 ) 
			self.ent1:SetKeyValue( "HealthRegenerateEnabled" , 1 ) 
			self.ent3:SetKeyValue( "HealthRegenerateEnabled" , 1 )

	end

		if	GetConVarNumber( "npcg_accuracy_vortigaunt" ) >= 4 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )

		elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 3 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )

		elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 2 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )

		elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 1 then

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

		self.ent1:AddRelationship( "player D_HT 200" )
		self.ent1:AddRelationship( "player D_HT 200" )
		self.ent1:AddRelationship( "player D_HT 200" )
		
		self.ent1:AddRelationship( "npc_citizen D_HT 200" )
		self.ent1:AddRelationship( "npc_citizen D_HT 200" )
		self.ent1:AddRelationship( "npc_citizen D_HT 200" )
		
		self.ent1:AddRelationship( "npc_metropolice D_NU 200" )
		self.ent1:AddRelationship( "npc_metropolice D_NU 200" )
		self.ent1:AddRelationship( "npc_metropolice D_NU 200" )

		self.ent1:AddRelationship( "npc_manhack D_NU 200" )
		self.ent1:AddRelationship( "npc_manhack D_NU 200" )
		self.ent1:AddRelationship( "npc_manhack D_NU 200" )

		self.ent1:AddRelationship( "npc_cscanner D_NU 200" )
		self.ent1:AddRelationship( "npc_cscanner D_NU 200" )
		self.ent1:AddRelationship( "npc_cscanner D_NU 200" )

		self.ent1:AddRelationship( "npc_clawscanner D_NU 200" )
		self.ent1:AddRelationship( "npc_clawscanner D_NU 200" )
		self.ent1:AddRelationship( "npc_clawscanner D_NU 200" )

		self.ent1:AddRelationship( "npc_combine_s D_NU 200" )
		self.ent1:AddRelationship( "npc_combine_s D_NU 200" )
		self.ent1:AddRelationship( "npc_combine_s D_NU 200" )

		timer.Simple( 0 , function( )

			undo.Create( self.PrintName )

			undo.AddEntity( self )

			if self.ent1:IsValid( ) then undo.AddEntity( self.ent1 ) end
			if self.ent2:IsValid( ) then undo.AddEntity( self.ent2 ) end
			if self.ent3:IsValid( ) then undo.AddEntity( self.ent3 ) end

			undo.SetCustomUndoText( "Undone " .. self.PrintName )
			undo.SetPlayer( self.Owner )

			undo.Finish( )

		end )

	end

	function ENT:Think( )

		if !self.ent1:IsValid( ) then

			self.ent1 = ents.Create( "npc_vortigaunt" )
			self.ent1:SetPos( self:GetPos( ) + self:GetRight( ) * -50 )
			self.ent1:SetModel( "models/vortigaunt_slave.mdl"	)
			self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_vort" ) )
			self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent1:Spawn( )
			self.ent1:Activate( )
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )
				
			if GetConVarNumber( "npcg_healthvariant_vort" ) > 1 then
				self.ent1:SetHealth( GetConVarNumber( "npcg_healthoverride_vort" ) )
			elseif GetConVarNumber( "npcg_healthvariant_vort" ) == 1 then
				self.ent1:SetHealth( math.random( 200 , 240 ) )
			end

			if GetConVarNumber( "npcg_squad_vortslave" ) != 0 then
				self.ent1:SetKeyValue( "SquadName" , "SlaveVortSquad" )
			end

			if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then 
				self.ent1:SetKeyValue( "wakesquad" , 1 ) 
			end

			if	GetConVarNumber( "npcg_accuracy_vortigaunt" ) >= 4 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
			elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 3 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
			elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 2 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
			elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 1 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )
			else
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )
			end

			if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
				self.ent1:SetAngles( Angle( 0 , 0 , 0 ) ) 
			else
				self.ent1:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
		end

			self.ent1:AddRelationship( "player D_HT 200" )
			
			self.ent1:AddRelationship( "npc_citizen D_HT 200" )
			
			self.ent1:AddRelationship( "npc_metropolice D_NU 200" )

			self.ent1:AddRelationship( "npc_manhack D_NU 200" )

			self.ent1:AddRelationship( "npc_cscanner D_NU 200" )

			self.ent1:AddRelationship( "npc_clawscanner D_NU 200" )

			self.ent1:AddRelationship( "npc_combine_s D_NU 200" )

	end

		if !self.ent1:IsValid( ) then

			self.ent1 = ents.Create( "npc_vortigaunt" )
			self.ent1:SetPos( self:GetPos( ) + self:GetForward( ) * 50 )
			self.ent1:SetModel( "models/vortigaunt_slave.mdl"	)
			self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_vort" ) )
			self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent1:Spawn( )
			self.ent1:Activate( )
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )
			
			if GetConVarNumber( "npcg_healthvariant_vort" ) > 1 then
				self.ent1:SetHealth( GetConVarNumber( "npcg_healthoverride_vort" ) )
			elseif GetConVarNumber( "npcg_healthvariant_vort" ) == 1 then
				self.ent1:SetHealth( math.random( 200 , 240 ) )
			end

			if GetConVarNumber( "npcg_squad_vortslave" ) != 0 then
				self.ent1:SetKeyValue( "SquadName" , "SlaveVortSquad" )
			end

			if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then 
				self.ent1:SetKeyValue( "wakesquad" , 1 ) 
			end

			if	GetConVarNumber( "npcg_accuracy_vortigaunt" ) >= 4 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
			elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 3 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
			elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 2 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
			elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 1 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )
			else
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )
			end

			if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
				self.ent1:SetAngles( Angle( 0 , 0 , 0 ) ) 
			else
				self.ent1:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
		end

			self.ent1:AddRelationship( "player D_HT 200" )
			
			self.ent1:AddRelationship( "npc_citizen D_HT 200" )
			
			self.ent1:AddRelationship( "npc_metropolice D_NU 200" )

			self.ent1:AddRelationship( "npc_manhack D_NU 200" )

			self.ent1:AddRelationship( "npc_cscanner D_NU 200" )

			self.ent1:AddRelationship( "npc_clawscanner D_NU 200" )

			self.ent1:AddRelationship( "npc_combine_s D_NU 200" )

	end	

		if !self.ent3:IsValid( ) then

			self.ent3 = ents.Create( "npc_vortigaunt" )
			self.ent3:SetPos( self:GetPos( ) + self:GetRight( ) * 50 )
			self.ent3:SetHealth( GetConVarNumber( "npcg_healthoverride_vort" ) )
			self.ent3:SetModel( "models/vortigaunt_slave.mdl"	)
			self.ent3:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_vort" ) )
			self.ent3:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent3:Spawn( )
			self.ent3:Activate( )
			self.ent3:SetSchedule( SCHED_IDLE_WANDER )
			
			if GetConVarNumber( "npcg_healthvariant_vort" ) > 1 then
				self.ent3:SetHealth( GetConVarNumber( "npcg_healthoverride_vort" ) )
			elseif GetConVarNumber( "npcg_healthvariant_vort" ) == 1 then
				self.ent3:SetHealth( math.random( 200 , 240 ) )
			end

			if GetConVarNumber( "npcg_squad_vortslave" ) != 0 then
				self.ent3:SetKeyValue( "SquadName" , "SlaveVortSquad" )
			end

			if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then 
				self.ent3:SetKeyValue( "wakesquad" , 1 ) 
			end

			if	GetConVarNumber( "npcg_accuracy_vortigaunt" ) >= 4 then
				self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
			elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 3 then
				self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
			elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 2 then
				self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
			elseif	GetConVarNumber( "npcg_accuracy_vortigaunt" ) == 1 then
				self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )
			else
				self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )
			end

			if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
				self.ent3:SetAngles( Angle( 0 , 0 , 0 ) ) 
			else
				self.ent3:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
		end

			self.ent3:AddRelationship( "player D_HT 200" )
			
			self.ent3:AddRelationship( "npc_citizen D_HT 200" )
			
			self.ent3:AddRelationship( "npc_metropolice D_NU 200" )

			self.ent3:AddRelationship( "npc_manhack D_NU 200" )

			self.ent3:AddRelationship( "npc_cscanner D_NU 200" )

			self.ent3:AddRelationship( "npc_clawscanner D_NU 200" )

			self.ent3:AddRelationship( "npc_combine_s D_NU 200" )

	end
		
		self:NextThink(CurTime( ) + GetConVarNumber( "npcg_spawner_wavetime" ) )
end


	function ENT:OnRemove( )

		if self.ent1 then self.ent1:Remove( ) end
		if self.ent2 then self.ent2:Remove( ) end
		if self.ent3 then self.ent3:Remove( ) end

	end

end
