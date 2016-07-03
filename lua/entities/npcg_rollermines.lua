
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Rollermines"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= true

if !ConVarExists( "npcg_rollermineburied" ) then CreateConVar(	"npcg_rollermineburied", 			"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end

if SERVER then
	function ENT:Initialize()
		
		if ConVarExists("npcg_weapondrop") and GetConVarNumber("npcg_weapondrop") != 0 then	self.weaponNum = 8192	else	self.weaponNum = 0	end
		if ConVarExists("npcg_ignorepushing") and GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_fade_corpse") and GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if ConVarExists("npcg_longvision") and GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end

		self.kvNum = 0
		
		self.ent1 = ents.Create("npc_rollermine")
		self.ent1:SetPos(self:GetPos())
		self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		--self.ent1:SetHealth( GetConVarNumber("npcg_healthoverride_rollermine") )
		self.ent1:SetKeyValue( "startburied", GetConVarNumber( "npcg_rollermineburied" ) )
		self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + 4 ) )
		self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_rollermine" ) )
		self.ent1:Spawn()
		self.ent1:Activate()
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent2 = ents.Create("npc_rollermine")
		self.ent2:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * 100)
		self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		--self.ent2:SetHealth( GetConVarNumber("npcg_healthoverride_rollermine") )
		self.ent2:SetKeyValue( "startburied", GetConVarNumber( "npcg_rollermineburied" ) )
		self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + 4 ) )
		self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_rollermine" ) )
		self.ent2:Spawn()
		self.ent2:Activate()
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )
		
		self.ent3 = ents.Create("npc_rollermine")
		self.ent3:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * -100)
		self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		--self.ent3:SetHealth( GetConVarNumber("npcg_healthoverride_rollermine") )
		self.ent3:SetKeyValue( "startburied", GetConVarNumber( "npcg_rollermineburied" ) )
		self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum + 4 ) )
		self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_rollermine" ) )
		self.ent3:Spawn()
		self.ent3:Activate()
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		
		if GetConVarNumber( "npcg_squad_rollermine" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "RollermineSquad" )
			self.ent2:SetKeyValue( "SquadName", "RollermineSquad" )
			self.ent3:SetKeyValue( "SquadName", "RollermineSquad" )
		end
		
		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 )	
			self.ent2:SetKeyValue( "wakesquad", 1 )	
			self.ent3:SetKeyValue( "wakesquad", 1 )	
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
