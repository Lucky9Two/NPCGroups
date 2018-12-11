
AddCSLuaFile( )

if not ConVarExists( "npcg_cmbelite_ar2altdrop" ) then CreateConVar(	"npcg_cmbelite_ar2altdrop" , "0" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_randomizer_cmb" ) then CreateConVar(	"npcg_randomizer_cmb" , "1" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end
if not ConVarExists( "npcg_wakeradius_cmb" ) then CreateConVar(	"npcg_wakeradius_cmb" , "200" , { FCVAR_REPLICATED , FCVAR_ARCHIVE } ) end

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Combine Advisor"
ENT.Author = "V92"
ENT.Information = ""
ENT.Category = "NPCGroups"
ENT.Spawnable = false
ENT.AdminOnly = false

ENT.AutomaticFrameAdvance = true

if SERVER then
	function ENT:Initialize( )

		if ConVarExists( "npcg_ignorepushing" ) and GetConVarNumber( "npcg_ignorepushing" ) != 0 then self.pushNum = 16384 else self.pushNum = 0	end
		if ConVarExists( "npcg_fade_corpse" ) and GetConVarNumber( "npcg_fade_corpse" ) != 0 then self.fadeNum = 512 else self.fadeNum = 0	end
		if ConVarExists( "npcg_longvision" ) and GetConVarNumber( "npcg_longvision" ) != 0 then self.longNum = 256 else self.longNum = 0	end
		if ConVarExists( "npcg_weapondrop" ) and GetConVarNumber( "npcg_weapondrop" ) != 0 then self.weaponNum = 8192 else self.weaponNum = 0	end

		self.kvNum = 0
		
		self.efect2 = ents.Create( "env_screeneffect" )
		
		self.ent1 = ents.Create( "npc_clawscanner" )
		self.ent1:SetPos( self:GetPos( ) )
		self.ent1:SetColor( Color( 0 , 0 , 0 , 0 ) )
		self.ent1:SetKeyValue( "spawnflags" , tostring( self.kvNum + self.longNum + self.weaponNum + self.pushNum + self.fadeNum ) )
		self.ent1:SetKeyValue( "wakeradius" , GetConVarNumber( "npcg_wakeradius_advisor" ) )
		self.ent1:Spawn( )
		self.ent1:Activate( )
		--self.ent1:SetBehavior( NPC_ADVISOR_HAS_BEHAVIOR )
		self.ent1:SetSchedule( SCHED_IDLE_WANDER )
		self.ent1:AddRelationship( "player D_HT 999" )
		
		self.ent2 = ents.Create( "prop_physics" )
		self.ent2:SetPos( self.ent1:GetPos( ) )
		self.ent2:SetAngles( self.ent1:GetAngles( ) )
		self.ent2:SetModel( "models/advisor_ep2.mdl" )
		self.ent2:SetSkin( 0 )
		self.ent2:SetParent( self.ent1 )
		self.ent2:SetKeyValue( "solid" , "6" )
		
		if GetConVarNumber( "npcg_healthvariant_advisor" ) > 1 then
			self.ent1:SetHealth( GetConVarNumber( "npcg_healthoverride_advisor" ) )
		elseif GetConVarNumber( "npcg_healthvariant_advisor" ) == 1 then
			self.ent1:SetHealth( math.random( 2000 , 2500 ) )
		end
		
		if GetConVarNumber( "npcg_squad_combine" ) != 0 then
			self.ent1:SetKeyValue( "SquadName" , "Combine" )
		end
		
		if GetConVarNumber( "npcg_squad_wakeupall" ) != 0 then 
			self.ent1:SetKeyValue( "wakesquad" , 1 ) 
		end

		if	GetConVarNumber( "npcg_accuracy_combine" ) >= 4 then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
		elseif	GetConVarNumber( "npcg_accuracy_combine" ) == 3 then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		elseif	GetConVarNumber( "npcg_accuracy_combine" ) == 2 then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_GOOD)
		elseif	GetConVarNumber( "npcg_accuracy_combine" ) == 1 then
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_AVERAGE)
		else
			self.ent1:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_POOR) 
		end

		if ConVarExists( "npcg_randomyaw" ) and GetConVarNumber( "npcg_randomyaw" ) == 0 then
			self.ent1:SetAngles( Angle( 0 , 0 , 0 ) ) 
		else
			self.ent1:SetAngles( Angle( 0 , math.random( 0 , 360 ) , 0 ) ) 
		end

		timer.Simple( 0 , function( )
			undo.Create( self.PrintName )
				if self.ent1:IsValid( ) then undo.AddEntity( self.ent1 ) end
				if self.ent2:IsValid( ) then undo.AddEntity( self.ent2 ) end
				undo.SetCustomUndoText( "Undone " .. self.PrintName )
				undo.SetPlayer( self.Owner)
			undo.Finish( )
			self:Remove( )
		end)
	end

	function ENT:OnTakeDamage( )
		self.ent2:DoAnimationEvent( "combine_advisor_big_pain" )
		
		--self.ent1:Output( "OnFoundPlayer" , "self.efect2, StopEffect, Advisor Stun, 1, -1" )
		--self.ent1:SetKeyValue( "OnFoundPlayer" , "self.efect2, StartEffect, Advisor Stun, 0, -1" )
	end
end