
AddCSLuaFile( )

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Manhack"
ENT.Author = "V92"
ENT.Information = ""
ENT.Category = "NPCGroups"
ENT.Spawnable = false
ENT.AdminOnly = true

if SERVER then

	function ENT:Initialize( )


		if GetConVarNumber( "npcg_ignorepushing" ) != 0 then self.pushNum = 16384 else self.pushNum = 0 end
		if GetConVarNumber( "npcg_fade_corpse" ) != 0 then self.fadeNum = 512 else self.fadeNum = 0 end
		if GetConVarNumber( "npcg_longvision" ) != 0 then self.longNum = 256 else self.longNum = 0 end
		if not ConVarExists( "npcg_wakeradius_manhack" ) then self.wakeRadius = GetConVarNumber( "npcg_wakeradius_cmb" ) else self.wakeRadius = 2048 end
		self.kvNum = 0

		self.ent1 = ents.Create( "npc_manhack" )
		self.ent1:SetPos( self:GetPos( ) + self:GetUp( ) * 50 )
		self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
		self.ent1:SetKeyValue( "wakeradius" , tostring( self.wakeRadius ) )
		self.ent1:Spawn( )
		self.ent1:Activate( )
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )

		if GetConVarNumber( "npcg_squad_police" ) != 0 then

			self.ent1:SetKeyValue( "SquadName" , "Combine" )

		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then

			self.ent1:SetKeyValue( "wakesquad" , 1 )

		end

		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then

			self.ent1:SetAngles( Angle( 0 , 0 , 0 ) )

		else
			self.ent1:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) )

		end

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
