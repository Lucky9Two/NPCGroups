
AddCSLuaFile( ) 

if not ConVarExists( "npcg_stalker_beampower" ) then CreateConVar( 	"npcg_stalker_beampower" , "2" , { FCVAR_REPLICATED , FCVAR_ARCHIVE }		) end

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Stalker Spawner"
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

		if ConVarExists( "npcg_ignorepushing" ) and GetConVarNumber( "npcg_ignorepushing" ) != 0 then self.pushNum = 16384 else self.pushNum = 0	end
		if ConVarExists( "npcg_fade_corpse" ) and GetConVarNumber( "npcg_fade_corpse" ) != 0 then self.fadeNum = 512 else self.fadeNum = 0	end
		if ConVarExists( "npcg_longvision" ) and GetConVarNumber( "npcg_longvision" ) != 0 then self.longNum = 256 else self.longNum = 0	end

		self.kvNum = 0
		
		self.ent1 = ents.Create( "npc_stalker" ) 
		self.ent1:SetPos( self:GetPos( ) + self:GetForward( ) + self:GetRight( ) * 50 )
		self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) ) 
		self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cmb" ) ) 
		self.ent1:SetKeyValue( "BeamPower" , GetConVarNumber( "npcg_stalker_beampower" ) ) 
		self.ent1:Spawn( ) 
		self.ent1:Activate( ) 
		self.ent1:SetSchedule( SCHED_IDLE_WANDER ) 
		
		self.ent2 = ents.Create( "npc_stalker" ) 
		self.ent2:SetPos( self:GetPos( ) + self:GetForward( ) + self:GetRight( ) * -50 )
		self.ent2:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) ) 
		self.ent2:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cmb" ) ) 
		self.ent2:SetKeyValue( "BeamPower" , GetConVarNumber( "npcg_stalker_beampower" ) ) 
		self.ent2:Spawn( ) 
		self.ent2:Activate( ) 
		self.ent2:SetSchedule( SCHED_IDLE_WANDER ) 

		self.ent3 = ents.Create( "npc_stalker" ) 
		self.ent3:SetPos( self:GetPos( ) )
		self.ent3:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) ) 
		self.ent3:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cmb" ) ) 
		self.ent3:SetKeyValue( "BeamPower" , GetConVarNumber( "npcg_stalker_beampower" ) ) 
		self.ent3:Spawn( ) 
		self.ent3:Activate( ) 
		self.ent3:SetSchedule( SCHED_IDLE_WANDER ) 

		if GetConVarNumber( "npcg_squad_stalker" ) != 0 then
			self.ent1:SetKeyValue( "SquadName" , "Combine" ) 
			self.ent2:SetKeyValue( "SquadName" , "Combine" ) 
			self.ent3:SetKeyValue( "SquadName" , "Combine" ) 
		end

		if GetConVarNumber( "npcg_accuracy_cmbstalker" ) >= 4 then
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT ) 
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT ) 
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT ) 
		elseif GetConVarNumber( "npcg_accuracy_cmbstalker" ) == 3 then
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD ) 
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD ) 
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD ) 
		elseif GetConVarNumber( "npcg_accuracy_cmbstalker" ) == 2 then
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD ) 
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD ) 
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD ) 
		elseif GetConVarNumber( "npcg_accuracy_cmbstalker" ) == 1 then
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE ) 
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE ) 
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE ) 
		else
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR ) 
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR ) 
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR ) 
		end

		self.ent1:AddRelationship( "player D_HT 200" ) 
		self.ent2:AddRelationship( "player D_HT 200" ) 
		self.ent3:AddRelationship( "player D_HT 200" ) 

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
			self.ent1 = ents.Create( "npc_stalker" ) 
			self.ent1:SetPos( self:GetPos( ) + self:GetForward( ) + self:GetRight( ) * 50 )
			self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) ) 
			self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cmb" ) ) 
			self.ent1:SetKeyValue( "BeamPower" , GetConVarNumber( "npcg_stalker_beampower" ) ) 
			self.ent1:Spawn( ) 
			self.ent1:Activate( )
			self.ent1:SetSchedule( SCHED_IDLE_WANDER ) 
		end
		
		if !self.ent2:IsValid( ) then
			self.ent2 = ents.Create( "npc_stalker" ) 
			self.ent2:SetPos( self:GetPos( ) + self:GetForward( ) + self:GetRight( ) * -50 )
			self.ent2:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) ) 
			self.ent2:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cmb" ) ) 
			self.ent2:SetKeyValue( "BeamPower" , GetConVarNumber( "npcg_stalker_beampower" ) ) 
			self.ent2:Spawn( ) 
			self.ent2:Activate( )
			self.ent2:SetSchedule( SCHED_IDLE_WANDER ) 
		end	

		if !self.ent3:IsValid( ) then
			self.ent3 = ents.Create( "npc_stalker" ) 
			self.ent3:SetPos( self:GetPos( ) )
			self.ent3:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) ) 
			self.ent3:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_cmb" ) ) 
			self.ent3:SetKeyValue( "BeamPower" , GetConVarNumber( "npcg_stalker_beampower" ) ) 
			self.ent3:Spawn( ) 
			self.ent3:Activate( )
			self.ent3:SetSchedule( SCHED_IDLE_WANDER ) 
		end

		if GetConVarNumber( "npcg_healthvariant_cmbstk" ) > 1 then
			self.ent1:SetHealth( GetConVarNumber( "npcg_healthoverride_cmbstk" ) ) 
			self.ent2:SetHealth( GetConVarNumber( "npcg_healthoverride_cmbstk" ) ) 
			self.ent3:SetHealth( GetConVarNumber( "npcg_healthoverride_cmbstk" ) ) 
		elseif GetConVarNumber( "npcg_healthvariant_cmbstk" ) == 1 then
			self.ent1:SetHealth( math.random( 20 , 50 ) ) 
			self.ent2:SetHealth( math.random( 20 , 50 ) ) 
			self.ent3:SetHealth( math.random( 20 , 50 ) ) 
		end

		if GetConVarNumber( "npcg_squad_stalker" ) != 0 then
			self.ent1:SetKeyValue( "SquadName" , "Combine" ) 
			self.ent2:SetKeyValue( "SquadName" , "Combine" ) 
			self.ent3:SetKeyValue( "SquadName" , "Combine" ) 
		end

		if GetConVarNumber( "npcg_squad_stalker" ) != 0 then
			self.ent1:SetKeyValue( "SquadName" , "Combine" ) 
			self.ent2:SetKeyValue( "SquadName" , "Combine" ) 
			self.ent3:SetKeyValue( "SquadName" , "Combine" ) 
		end

		if GetConVarNumber( "npcg_accuracy_cmbstalker" ) >= 4 then
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT ) 
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT ) 
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT ) 
		elseif GetConVarNumber( "npcg_accuracy_cmbstalker" ) == 3 then
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD ) 
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD ) 
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD ) 
		elseif GetConVarNumber( "npcg_accuracy_cmbstalker" ) == 2 then
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD ) 
			self.ent2:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD ) 
			self.ent3:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD ) 
		elseif GetConVarNumber( "npcg_accuracy_cmbstalker" ) == 1 then
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
		self.ent2:AddRelationship( "player D_HT 200" ) 
		self.ent3:AddRelationship( "player D_HT 200" ) 

		self:NextThink( CurTime( ) + GetConVarNumber( "npcg_spawner_wavetime" ) ) 
	end

	function ENT:OnRemove( ) 
		if self.ent1 then self.ent1:Remove( ) end
		if self.ent2 then self.ent2:Remove( ) end
		if self.ent3 then self.ent3:Remove( ) end
	end

end
