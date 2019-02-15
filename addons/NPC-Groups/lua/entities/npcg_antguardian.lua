
AddCSLuaFile( )

if not ConVarExists( "npcg_antlion_startburrow" ) then CreateConVar(	"npcg_antlion_startburrow" , 		"0" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_antlion_eludeburrow" ) then CreateConVar(	"npcg_antlion_eludeburrow" , 		"0" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_antlion_alertrange" ) then CreateConVar(	"npcg_antlion_alertrange" , 			"8192" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_antlion_barktoggle" ) then CreateConVar(	"npcg_antlion_barktoggle" , 			"1" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_antlion_cavern" ) then CreateConVar(	"npcg_antlion_cavern" , 				"1" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_randomizer_antlion" ) then CreateConVar(	"npcg_randomizer_antlion" , "1" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_wakeradius_antlion" ) then CreateConVar(	"npcg_wakeradius_antlion" , "500" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_squad_antlion" ) then CreateConVar(	"npcg_squad_antlion" , 				"1" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_healthoverride_antlion" ) then CreateConVar(	"npcg_healthoverride_antlion" , 	"125" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_healthvariant_antlion" ) then CreateConVar(	"npcg_healthvariant_antlion" , 	"0" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Antlion Guardian Cohort"
ENT.Author = "V92"
ENT.Information = ""
ENT.Category = "NPCGroups"
ENT.Spawnable = false
ENT.AdminOnly = false

if SERVER then

	function ENT:Initialize( )


		if ConVarExists( "npcg_ignorepushing" ) and GetConVarNumber( "npcg_ignorepushing" ) != 0 then self.pushNum = 16384 else self.pushNum = 0 end
		if ConVarExists( "npcg_fade_corpse" ) and GetConVarNumber( "npcg_fade_corpse" ) != 0 then self.fadeNum = 512 else self.fadeNum = 0 end
		if ConVarExists( "npcg_longvision" ) and GetConVarNumber( "npcg_longvision" ) != 0 then self.longNum = 256 else self.longNum = 0 end
		if ConVarExists( "npcg_antlion_eludeburrow" ) and GetConVarNumber( "npcg_antlion_eludeburrow" ) != 0 then self.eludeBurrowNum = 65536 else self.eludeBurrowNum = 0 end
		if ConVarExists( "npcg_antlion_startburrow" ) then self.startBurrow = GetConVarNumber( "npcg_antlion_startburrow" ) else self.startBurrow = 0 end
		if ConVarExists( "npcg_wakeradius_antlion" ) then self.wakeRadius = GetConVarNumber( "npcg_wakeradius_antlion" ) else self.wakeRadius = 512 end
		if ConVarExists( "npcg_antlion_alertrange" ) then self.alertRange = GetConVarNumber( "npcg_antlion_alertrange" ) else self.alertRange = 512 end
		
		self.kvNum = 0

		self.ent1 = ents.Create( "npc_antlionguard" )
		self.ent1:SetPos( self:GetPos( ) )

		if IsMounted( "ep2" ) then self.ent1:SetMaterial( "models/antlion_guard/antlionguard2" ) end
		self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + self.eludeBurrowNum ) )
		self.ent1:SetKeyValue( "wakeradius" , tostring( self.wakeRadius ) )
		self.ent1:SetKeyValue( "allowbark" , GetConVarNumber( "npcg_antlion_barktoggle" ) )
		self.ent1:SetKeyValue( "incavern" , GetConVarNumber( "npcg_antlion_cavern" ) )
		self.ent1:SetKeyValue( "cavernbreed" , 1		)
		self.ent1:Spawn( )
		self.ent1:Activate( )
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent2 = ents.Create( "npc_antlion" )
		self.ent2:SetPos( self:GetPos( ) + self:GetForward( ) * -150 + self:GetRight( ) * 150 )
		self.ent2:SetSkin( math.random( 0 , 3 ) )
		self.ent2:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + self.eludeBurrowNum ) )
		self.ent2:SetKeyValue( "startburrowed" , tostring( self.startBurrow ) )
		self.ent2:SetKeyValue( "wakeradius" , tostring( self.wakeRadius ) )
		self.ent2:SetKeyValue( "radius" , tostring( self.alertRange ) )
		self.ent2:Spawn( )
		self.ent2:Activate( )
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )

		self.ent3 = ents.Create( "npc_antlion" )
		self.ent3:SetPos( self:GetPos( ) + self:GetForward( ) * -150 + self:GetRight( ) * -150 )
		self.ent3:SetSkin( math.random( 0 , 3 ) )
		self.ent3:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + self.eludeBurrowNum ) )
		self.ent3:SetKeyValue( "startburrowed" , tostring( self.startBurrow ) )
		self.ent3:SetKeyValue( "wakeradius" , tostring( self.wakeRadius ) )
		self.ent3:SetKeyValue( "radius" , tostring( self.alertRange ) )
		self.ent3:Spawn( )
		self.ent3:Activate( )
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )

		if IsMounted( "ep2" ) and GetConVarNumber( "npcg_squaddies_worker" ) != 0 then

			self.ent4 = ents.Create( "npc_antlion_worker" ) 
			self.ent4:SetPos( self:GetPos( ) + self:GetForward( ) * 150 + self:GetRight( ) * -150 )
			self.ent4:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + self.eludeBurrowNum ) )
			self.ent4:SetKeyValue( "startburrowed" , tostring( self.startBurrow ) )
			self.ent4:SetKeyValue( "wakeradius" , tostring( self.wakeRadius ) )
			self.ent4:SetKeyValue( "radius" , tostring( self.alertRange ) )
			self.ent4:Spawn( )
			self.ent4:Activate( )
			self.ent4:SetSchedule( SCHED_IDLE_WANDER )

			self.ent5 = ents.Create( "npc_antlion_worker" ) 
			self.ent5:SetPos( self:GetPos( ) + self:GetForward( ) * 150 + self:GetRight( ) * 150 )
			self.ent5:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + self.eludeBurrowNum ) )
			self.ent5:SetKeyValue( "startburrowed" , tostring( self.startBurrow ) )
			self.ent5:SetKeyValue( "wakeradius" , tostring( self.wakeRadius ) )
			self.ent5:SetKeyValue( "radius" , tostring( self.alertRange ) )
			self.ent5:Spawn( )
			self.ent5:Activate( )
			self.ent5:SetSchedule( SCHED_IDLE_WANDER )

		else
			self.ent4 = ents.Create( "npc_antlion" ) 	
			self.ent4:SetPos( self:GetPos( ) + self:GetForward( ) * 150 + self:GetRight( ) * -150 )
			self.ent4:SetSkin( math.random( 0 , 3 ) )
			self.ent4:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + self.eludeBurrowNum ) )
			self.ent4:SetKeyValue( "startburrowed" , tostring( self.startBurrow ) )
			self.ent4:SetKeyValue( "wakeradius" , tostring( self.wakeRadius ) )
			self.ent4:SetKeyValue( "radius" , tostring( self.alertRange ) )
			self.ent4:Spawn( )
			self.ent4:Activate( )
			self.ent4:SetSchedule( SCHED_IDLE_WANDER )

			self.ent5 = ents.Create( "npc_antlion" ) 	
			self.ent5:SetPos( self:GetPos( ) + self:GetForward( ) * 150 + self:GetRight( ) * 150 )
			self.ent5:SetSkin( math.random( 0 , 3 ) )
			self.ent5:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + self.eludeBurrowNum ) )
			self.ent5:SetKeyValue( "startburrowed" , tostring( self.startBurrow ) )
			self.ent5:SetKeyValue( "wakeradius" , tostring( self.wakeRadius ) )
			self.ent5:SetKeyValue( "radius" , tostring( self.alertRange ) )
			self.ent5:Spawn( )
			self.ent5:Activate( )
			self.ent5:SetSchedule( SCHED_IDLE_WANDER )

		end

		if GetConVarNumber( "npcg_squad_antlion" ) != 0 then

			self.ent1:SetKeyValue( "SquadName" , "Antlion" )
			self.ent2:SetKeyValue( "SquadName" , "Antlion" )
			self.ent3:SetKeyValue( "SquadName" , "Antlion" )
			self.ent4:SetKeyValue( "SquadName" , "Antlion" )
			self.ent5:SetKeyValue( "SquadName" , "Antlion" )

		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then

			self.ent1:SetKeyValue( "wakesquad" , 1 )
			self.ent2:SetKeyValue( "wakesquad" , 1 ) 
			self.ent3:SetKeyValue( "wakesquad" , 1 ) 
			self.ent4:SetKeyValue( "wakesquad" , 1 ) 
			self.ent5:SetKeyValue( "wakesquad" , 1 )

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

		end )

	end

end
