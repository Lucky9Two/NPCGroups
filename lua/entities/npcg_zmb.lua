
AddCSLuaFile()

if !ConVarExists( "npcg_squad_zombie" ) then CreateConVar(	"npcg_squad_zombie", 				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_zombietorsochance" ) then CreateConVar(	"npcg_zombietorsochance", 			"4",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_zmb" ) then CreateConVar(	"npcg_wakeradius_zmb",				"100",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squaddies_zmbs" ) then CreateConVar(	"npcg_squaddies_zmbs",				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Zombie Group"
ENT.Author			= "Neotanks/V92"
ENT.Information		= ""
ENT.Category		= "NPCGroups"
ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then
	function ENT:Initialize()

		local torsoDiceRoll = math.random( 1, GetConVarNumber("npcg_zombietorsochance") )
		if torsoDiceRoll == 1 then self.torsoChance = 1 else self.torsoChance = 0 end
		
		if GetConVarNumber("VNT_Debug_Prints") != 0 then print("Zombie Torso Dice Roll is " .. torsoDiceRoll ) end
		
		if ConVarExists("npcg_ignorepushing") and GetConVarNumber("npcg_ignorepushing") != 0 then	self.pushNum = 16384	else	self.pushNum = 0	end
		if ConVarExists("npcg_fade_corpse") and GetConVarNumber("npcg_fade_corpse") != 0 then	self.fadeNum = 512	else	self.fadeNum = 0	end
		if ConVarExists("npcg_longvision") and GetConVarNumber("npcg_longvision") != 0 then	self.longNum = 256	else	self.longNum = 0	end

		self.kvNum = 0
		
		if self.torsoChance == 1	and	IsMounted( "ep2" )	then	self.ent1 = ents.Create("npc_zombie_torso")	else	self.ent1 = ents.Create("npc_zombie")	end	
		self.ent1:SetPos(self:GetPos())
		self.ent1:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent1:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
		self.ent1:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
		self.ent1:Spawn()
		self.ent1:Activate()
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )

		self.ent2 = ents.Create("npc_zombie")
		self.ent2:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * 100)
		self.ent2:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent2:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
		self.ent2:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
		self.ent2:Spawn()
		self.ent2:Activate()
		self.ent2:SetSchedule( SCHED_IDLE_WANDER )

		self.ent3 = ents.Create("npc_zombie")
		self.ent3:SetPos(self:GetPos() + self:GetForward() * 100 + self:GetRight() * -100)
		self.ent3:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent3:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
		self.ent3:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
		self.ent3:Spawn()
		self.ent3:Activate()
		self.ent3:SetSchedule( SCHED_IDLE_WANDER )

		self.ent4 = ents.Create("npc_fastzombie")
		self.ent4:SetPos(self:GetPos() + self:GetForward() * 120 + self:GetRight() * 0)
		self.ent4:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
		self.ent4:SetHealth( GetConVarNumber("npcg_healthoverride_zmb") )
		self.ent4:SetKeyValue( "wakeradius", GetConVarNumber( "npcg_wakeradius_zmb" ) )
		self.ent4:SetKeyValue( "spawnflags", tostring( self.kvNum + self.longNum + self.pushNum + self.fadeNum ) )
		self.ent4:Spawn()
		self.ent4:Activate()
		self.ent4:SetSchedule( SCHED_IDLE_WANDER )

		if GetConVarNumber( "npcg_squad_zombie" ) != 0	then
			self.ent1:SetKeyValue( "SquadName", "ZombieSquad" )
			self.ent2:SetKeyValue( "SquadName", "ZombieSquad" )
			self.ent3:SetKeyValue( "SquadName", "ZombieSquad" )
			self.ent4:SetKeyValue( "SquadName", "ZombieSquad" )
		end
		
		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0	then	
			self.ent1:SetKeyValue( "wakesquad", 1 )	
			self.ent2:SetKeyValue( "wakesquad", 1 )	
			self.ent3:SetKeyValue( "wakesquad", 1 )	
			self.ent4:SetKeyValue( "wakesquad", 1 )	
		end

		timer.Simple(0, function()
			undo.Create( self.PrintName )
				if self.ent1:IsValid() then undo.AddEntity(self.ent1) end
				if self.ent2:IsValid() then undo.AddEntity(self.ent2) end
				if self.ent3:IsValid() then undo.AddEntity(self.ent3) end
				if self.ent4:IsValid() then undo.AddEntity(self.ent4) end
				undo.SetCustomUndoText("Undone " .. self.PrintName )
				undo.SetPlayer(self.Owner)
			undo.Finish()
			self:Remove()
		end)
	end
end
