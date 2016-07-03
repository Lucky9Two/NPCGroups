
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Zombine Spawner"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

	function ENT:Initialize()
		self:SetModel("models/props_c17/oildrum001.mdl")
		self:DrawShadow(false)
		self:SetNoDraw(true)
		self:SetNotSolid(true)
		
		if ConVarExists("npcg_weapondrop") and GetConVarNumber("npcg_weapondrop") != 0 then	self.weaponNum = 8192	else	self.weaponNum = 0	end
		if ConVarExists("npcg_ignorepushing") and GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_fade_corpse") and GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if ConVarExists("npcg_longvision") and GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end

		self.kvNum = 0
		if IsMounted( "ep2" ) then
			self.ent1 = ents.Create("npc_zombine")
			self.ent1:SetPos(self:GetPos())
			self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent1:Spawn()
			self.ent1:Activate()
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )
			
			self.ent2 = ents.Create("npc_zombine")
			self.ent2:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * 100)
			self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent2:Spawn()
			self.ent2:Activate()
			self.ent2:SetSchedule( SCHED_IDLE_WANDER )

			self.ent3 = ents.Create("npc_zombine")
			self.ent3:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * -100)
			self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent3:Spawn()
			self.ent3:Activate()
			self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		else
			self.ent1 = ents.Create("npc_zombie")
			self.ent1:SetPos(self:GetPos())
			self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent1:Spawn()
			self.ent1:Activate()
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )
			
			self.ent2 = ents.Create("npc_zombie")
			self.ent2:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * 100)
			self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent2:Spawn()
			self.ent2:Activate()
			self.ent2:SetSchedule( SCHED_IDLE_WANDER )

			self.ent3 = ents.Create("npc_zombie")
			self.ent3:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * -100)
			self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent3:Spawn()
			self.ent3:Activate()
			self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		end

		if GetConVarNumber( "npcg_squad_zombie" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "ZombieSquad" )
			self.ent2:SetKeyValue( "SquadName", "ZombieSquad" )
			self.ent3:SetKeyValue( "SquadName", "ZombieSquad" )
		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 )	
			self.ent2:SetKeyValue( "wakesquad", 1 )	
			self.ent3:SetKeyValue( "wakesquad", 1 )	
		end

		timer.Simple(0, function()
			undo.Create( self.PrintName )
				undo.AddEntity(self)
				if self.ent1:IsValid() then undo.AddEntity(self.ent1) end
				if self.ent2:IsValid() then undo.AddEntity(self.ent2) end
				if self.ent3:IsValid() then undo.AddEntity(self.ent3) end
				undo.SetCustomUndoText("Undone " .. self.PrintName )
				undo.SetPlayer(self.Owner)
			undo.Finish()
		end)
	end

	function ENT:Think()

		if !self.ent1:IsValid() and IsMounted( "ep2" ) then
			self.ent1 = ents.Create("npc_zombine")
			self.ent1:SetPos(self:GetPos())
			self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent1:Spawn()
			self.ent1:Activate()
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		elseif !self.ent1:IsValid() and !IsMounted( "ep2" ) then
			self.ent1 = ents.Create("npc_zombie")
			self.ent1:SetPos(self:GetPos())
			self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent1:Spawn()
			self.ent1:Activate()
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		end
		
		if !self.ent2:IsValid() and IsMounted( "ep2" ) then
			self.ent2 = ents.Create("npc_zombine")
			self.ent2:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * 100)
			self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent2:Spawn()
			self.ent2:Activate()
			self.ent2:SetSchedule( SCHED_IDLE_WANDER )
		elseif !self.ent2:IsValid() and !IsMounted( "ep2" ) then
			self.ent2 = ents.Create("npc_zombie")
			self.ent2:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * 100)
			self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent2:Spawn()
			self.ent2:Activate()
			self.ent2:SetSchedule( SCHED_IDLE_WANDER )
		end
		
		if !self.ent3:IsValid() and IsMounted( "ep2" ) then
			self.ent3 = ents.Create("npc_zombine")
			self.ent3:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * -100)
			self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent3:Spawn()
			self.ent3:Activate()
			self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		elseif !self.ent3:IsValid() and !IsMounted( "ep2" ) then
			self.ent3 = ents.Create("npc_zombie")
			self.ent3:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * -100)
			self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
			self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
			self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
			self.ent3:Spawn()
			self.ent3:Activate()
			self.ent3:SetSchedule( SCHED_IDLE_WANDER )
		end	

		if GetConVarNumber( "npcg_squad_zombie" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "ZombieSquad" )
			self.ent2:SetKeyValue( "SquadName", "ZombieSquad" )
			self.ent3:SetKeyValue( "SquadName", "ZombieSquad" )
		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 )	
			self.ent2:SetKeyValue( "wakesquad", 1 )	
			self.ent3:SetKeyValue( "wakesquad", 1 )	
		end

		self:NextThink(CurTime() + GetConVarNumber("npcg_spawner_wavetime") )
	end

	function ENT:OnRemove()
		if self.ent1 then	self.ent1:Remove()	end
		if self.ent2 then	self.ent2:Remove()	end
		if self.ent3 then	self.ent3:Remove()	end
	end
end
