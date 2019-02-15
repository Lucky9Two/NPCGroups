
AddCSLuaFile( )

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Dr. Magnusson Spawner"
ENT.Author = "V92"
ENT.Information = ""
ENT.Category = "NPCGroups"
ENT.Spawnable = false
ENT.AdminOnly = false

local WeaponTbl = { "weapon_shotgun" , "weapon_pistol" , "weapon_smg1" , "weapon_ar2" , "weapon_rpg" }

if SERVER then

	function ENT:Initialize( )

		self:SetModel( "models/props_c17/oildrum001.mdl" )
		self:DrawShadow( false )
		self:SetNoDraw( true )
		self:SetNotSolid( true )

		local medicDiceRoll = math.random( 1 , GetConVarNumber( "npcg_medicchance" ) )
		if medicDiceRoll == 1 then self.medicChance = 131072 else self.medicChance = 0 end
		--print( "Rebel Medic Dice Roll is " .. medicDiceRoll )
		
		local rebSupplyDiceRoll = math.random( 1 , GetConVarNumber( "npcg_rebelresupplychance" ) )
		if rebSupplyDiceRoll == 1 then self.resupplyChance = 524288 else self.resupplyChance = 0 end
		--print( "Rebel Supply Dice Roll is " .. rebSupplyDiceRoll )
		
		if GetConVarNumber( "npcg_ignorepushing" ) != 0 then self.pushNum = 16384 else self.pushNum = 0 end
		if GetConVarNumber( "npcg_weapondrop" ) != 0 then self.weaponNum = 8192 else self.weaponNum = 0 end
		if GetConVarNumber( "npcg_fade_corpse" ) != 0 then self.fadeNum = 512 else self.fadeNum = 0 end
		if GetConVarNumber( "npcg_longvision" ) != 0 then self.longNum = 256 else self.longNum = 0 end
		if GetConVarNumber( "npcg_random_rebels" ) != 0 then self.randomModel = 1 else self.randomModel = 0 end
		
		self.kvNum = 0
		
		if IsMounted( "ep2" ) then

			self.ent1 = ents.Create( "npc_magnusson" )
			self.ent1:SetPos( self:GetPos( ) )
			self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
			self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_human" ) )
			self.ent1:Spawn( )
			self.ent1:Activate( )
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )

		else 
			self.ent1 = ents.Create( "npc_citizen" )
			self.ent1:SetPos( self:GetPos( ) )
			self.ent1:SetKeyValue( "citizentype" , math.random(2,3 ) )
			if self.randomModel == 0 then self.ent1:SetModel( "models/humans/group03/male_09.mdl" ) end
			self.ent1:SetKeyValue( "DontPickupWeapons" , GetConVarNumber( "npcg_pickupguns" ) )
			self.ent1:SetKeyValue( "additionalequipment" , table.Random( WeaponTbl ) )
			self.ent1:SetKeyValue( "Expression Type" , "Random" )
			self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
			self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_human" ) )
			self.ent1:Spawn( )
			self.ent1:Activate( )
			self.ent1:SetSchedule( SCHED_IDLE_WANDER )

		end

		if GetConVarNumber( "npcg_squad_human" ) != 0 then

			self.ent1:SetKeyValue( "SquadName" , "Human" )

		end

		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then

			self.ent1:SetKeyValue( "wakesquad" , 1 )

	end

		if	GetConVarNumber( "npcg_accuracy_rebel" ) >= 4 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )

		elseif	GetConVarNumber( "npcg_accuracy_rebel" ) == 3 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )

		elseif	GetConVarNumber( "npcg_accuracy_rebel" ) == 2 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )

		elseif	GetConVarNumber( "npcg_accuracy_rebel" ) == 1 then

			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )

		else
			self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )

		end

		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then

			self.ent1:SetAngles( Angle( 0 , 0 , 0 ) )

		else
			self.ent1:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) )

		end

		timer.Simple( 0 , function( )

			undo.Create( self.PrintName )

			undo.AddEntity( self )

			if self.ent1:IsValid( ) then undo.AddEntity( self.ent1 ) end

			undo.SetCustomUndoText( "Undone " .. self.PrintName )
			undo.SetPlayer( self.Owner )

			undo.Finish( )

		end )

	end

	function ENT:Think( )

		if !self.ent1:IsValid( ) then 	

			if IsMounted( "ep2" ) then
				self.ent1 = ents.Create( "npc_magnusson" )
				self.ent1:SetPos( self:GetPos( ) )
				self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
				self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_human" ) )
				self.ent1:Spawn( )
				self.ent1:Activate( )
				self.ent1:SetSchedule( SCHED_IDLE_WANDER )
			else 
				self.ent1 = ents.Create( "npc_citizen" )
				self.ent1:SetPos( self:GetPos( ) )
				self.ent1:SetKeyValue( "citizentype" , math.random(2,3 ) )
				if self.randomModel == 0 then self.ent1:SetModel( "models/humans/group03/male_09.mdl" ) end
				self.ent1:SetKeyValue( "DontPickupWeapons" , GetConVarNumber( "npcg_pickupguns" ) )
				self.ent1:SetKeyValue( "additionalequipment" , table.Random( WeaponTbl ) )
				self.ent1:SetKeyValue( "Expression Type" , "Random" )
				self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum + self.resupplyChance + self.medicChance ) )
				self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_human" ) )
				self.ent1:Spawn( )
				self.ent1:Activate( )
				self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		end
			
			if GetConVarNumber( "npcg_squad_human" ) != 0 then
				self.ent1:SetKeyValue( "SquadName" , "Human" )
			end

			if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then 
				self.ent1:SetKeyValue( "wakesquad" , 1 ) 
			end

			if	GetConVarNumber( "npcg_accuracy_rebel" ) >= 4 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
			elseif	GetConVarNumber( "npcg_accuracy_rebel" ) == 3 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
			elseif	GetConVarNumber( "npcg_accuracy_rebel" ) == 2 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
			elseif	GetConVarNumber( "npcg_accuracy_rebel" ) == 1 then
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )
			else
				self.ent1:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )
			end

			if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
				self.ent1:SetAngles( Angle( 0 , 0 , 0 ) ) 
			else
				self.ent1:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
		end

	end

end

end
