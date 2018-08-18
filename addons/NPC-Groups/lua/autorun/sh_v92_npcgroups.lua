
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
--	NPCGroups Addon by NeoTanks
--	Profile Link:	http://steamcommunity.com/id/TheDreadedNeotank/
--	Updates & Maintenance by V92
--	Profile Link:	http://steamcommunity.com/id/JesseVanover/
--	Please add us both as contributors if you make any derivatives of this addon!
--	Leave a comment and a link on the Workshop page to your derivative!
--	Workshop Link:	http://steamcommunity.com/sharedfiles/filedetails/?id=136077464
------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
--	Setting up Workshop Auto-DL just in case...
if SERVER then	resource.AddWorkshop("136077464") end

if !ConVarExists("vnt_debug_prints") then		CreateClientConVar( "vnt_debug_prints", '0', true, false ) end

if !ConVarExists( "npcg_randomyaw" ) then CreateConVar( "npcg_randomyaw", "1", {	FCVAR_REPLICATED, FCVAR_ARCHIVE } ) end
if !ConVarExists( "npcg_spawner_wavetime" ) then CreateConVar( "npcg_spawner_wavetime", "10", {	FCVAR_REPLICATED, FCVAR_ARCHIVE } ) end
if !ConVarExists( "npcg_longvision" ) then					CreateConVar(	"npcg_longvision",					"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_weapondrop" ) then					CreateConVar(	"npcg_weapondrop",					"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_pickupguns" ) then					CreateConVar(	"npcg_pickupguns",					"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_alyx_alyxgun" ) then				CreateConVar(	"npcg_alyx_alyxgun",				"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_manhackcount" ) then				CreateConVar(	"npcg_manhackcount", 				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_grenadecount" ) then				CreateConVar(	"npcg_grenadecount", 				"5",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_patrol_toggle" ) then				CreateConVar(	"npcg_patrol_toggle",				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_ignorepushing" ) then				CreateConVar(	"npcg_ignorepushing",				"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_random_rebels" ) then				CreateConVar(	"npcg_random_rebels",				"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_vortchargearmor" ) then				CreateConVar(	"npcg_vortchargearmor",				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_regenhealth_ally" ) then			CreateConVar(	"npcg_regenhealth_ally",			"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_regenhealth_vort" ) then			CreateConVar(	"npcg_regenhealth_vort",			"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_rollermineburied" ) then			CreateConVar(	"npcg_rollermineburied", 			"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_stalker_beampower" ) then 			CreateConVar(	"npcg_stalker_beampower",			"2",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_combine_tacticalvar" ) then 		CreateConVar(	"npcg_combine_tacticalvar",			"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_clawscanner_striderscout" ) then	CreateConVar(	"npcg_clawscanner_striderscout",	"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
--	Squad Special NPC Toggles
if !ConVarExists( "npcg_squaddies_vort" ) then				CreateConVar(	"npcg_squaddies_vort",				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squaddies_zmbs" ) then				CreateConVar(	"npcg_squaddies_zmbs",				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squaddies_hunter" ) then			CreateConVar(	"npcg_squaddies_hunter",			"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squaddies_worker" ) then			CreateConVar(	"npcg_squaddies_worker",			"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squaddies_cpscanner" ) then			CreateConVar(	"npcg_squaddies_cpscanner",		"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
--	Dice
if !ConVarExists( "npcg_medicchance" ) then					CreateConVar(	"npcg_medicchance", 			"16",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_zombietorsochance" ) then			CreateConVar(	"npcg_zombietorsochance", 			"4",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_rebelresupplychance" ) then			CreateConVar(	"npcg_rebelresupplychance", 			"16",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
--	Wake Radii
if !ConVarExists( "npcg_wakeradius_cp" ) then				CreateConVar(	"npcg_wakeradius_cp", 				"200",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_dog" ) then				CreateConVar(	"npcg_wakeradius_dog",				"500",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_cmb" ) then				CreateConVar(	"npcg_wakeradius_cmb",				"200",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_zmb" ) then				CreateConVar(	"npcg_wakeradius_zmb",				"100",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_vort" ) then				CreateConVar(	"npcg_wakeradius_vort",				"500",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_human" ) then			CreateConVar(	"npcg_wakeradius_human", 			"150",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_scanner" ) then			CreateConVar(	"npcg_wakeradius_scanner",			"300",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
--	Squad Toggles
if !ConVarExists( "npcg_squad_human" ) then					CreateConVar(	"npcg_squad_human",	 				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squad_zombie" ) then				CreateConVar(	"npcg_squad_zombie", 				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squad_combine" ) then				CreateConVar(	"npcg_squad_combine", 				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squad_antlion" ) then				CreateConVar(	"npcg_squad_antlion", 				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squad_vortslave" ) then				CreateConVar(	"npcg_squad_vortslave",				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
--	Accuracy
if !ConVarExists( "npcg_accuracy_cp" ) then					CreateConVar(	"npcg_accuracy_cp",					"2",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_accuracy_alyx" ) then				CreateConVar(	"npcg_accuracy_alyx",				"4",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_accuracy_monk" ) then				CreateConVar(	"npcg_accuracy_monk",				"4",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_accuracy_rebel" ) then				CreateConVar(	"npcg_accuracy_rebel",				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_accuracy_barney" ) then				CreateConVar(	"npcg_accuracy_barney",				"4",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_accuracy_citizen" ) then			CreateConVar(	"npcg_accuracy_citizen",			"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_accuracy_combine" ) then			CreateConVar(	"npcg_accuracy_combine",			"4",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
--	Zombify Toggles
if !ConVarExists( "npcg_zombify_npc" ) then					CreateConVar(	"npcg_zombify_npc",					"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_zombify_ply" ) then					CreateConVar(	"npcg_zombify_ply",					"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
--	Customizable squads
if !ConVarExists( "npcg_custom_model_cp" ) then				CreateConVar(	"npcg_custom_model_cp",				"models/police.mdl", 						{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_custom_model_rebel" ) then			CreateConVar(	"npcg_custom_model_rebel",			"models/humans/group01/male_09.mdl", 		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_custom_model_combine" ) then		CreateConVar(	"npcg_custom_model_combine",		"models/combine_soldier_prisonguard.mdl", 	{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end

if !ConVarExists( "npcg_antlion_startburrow" ) then CreateConVar(	"npcg_antlion_startburrow", 		"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_antlion_eludeburrow" ) then CreateConVar(	"npcg_antlion_eludeburrow", 		"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_antlion_alertrange" ) then CreateConVar(	"npcg_antlion_alertrange", 			"8192",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_antlion_barktoggle" ) then CreateConVar(	"npcg_antlion_barktoggle", 			"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_antlion_cavern" ) then CreateConVar(	"npcg_antlion_cavern", 				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_randomizer_antlion" ) then CreateConVar(	"npcg_randomizer_antlion",			"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_wakeradius_antlion" ) then CreateConVar(	"npcg_wakeradius_antlion",			"500",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_squad_antlion" ) then CreateConVar(	"npcg_squad_antlion", 				"1",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_healthoverride_antlion" ) then CreateConVar(	"npcg_healthoverride_antlion",	 	"125",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end
if !ConVarExists( "npcg_healthvariant_antlion" ) then CreateConVar(	"npcg_healthvariant_antlion",	 	"0",		{	FCVAR_REPLICATED, FCVAR_ARCHIVE }	) end

local	function NPCGroupsConVars(Panel)
	
	Panel:AddControl(	"Header",		{	Text = "HL2 NPC Ragdoll Settings",	Description = "Standard engine ragdoll settings.\nI can't make these save between map change,\nso use the auto execute files in your GMod folder to set them."	}) 						
	
	Panel:AddControl(	"Header",		{	Text = "NPCGRagLife",	Description = "How long ragdolls stay before fading.\nNote: The fade CVar overrides this!"	}) 						
	Panel:AddControl(	"Slider",		{	Label = "Ragdoll Lifetime",	Type = "Integer",	Min = 1,	Max = 60,	Command = "g_ragdoll_fadespeed",	})
	
	Panel:AddControl(	"Header",		{	Text = "NPCGRagMax",	Description = "How many dead ragdolls stay before fading. Having a lot can gank your FPS!"	}) 	
	Panel:AddControl(	"Slider",		{	Label = "Max Ragdolls",	Type = "Integer",	Min = 0,	Max = 64,	Command = "g_ragdoll_maxcount",	})
	Panel:AddControl(	"Header",		{	Text = "NPCGRagMaxImp",	Description = "How many dead important NPC ragdolls stay before fading. Having a lot can gank your FPS!"	}) 	
	Panel:AddControl(	"Slider",		{	Label = "Important Ragdolls",	Type = "Integer",	Min = 0,	Max = 64,	Command = "g_ragdoll_important_maxcount",	})
	
	Panel:AddControl(	"CheckBox",		{	Label = "Citizens resist explosions?",						Command = "npc_citizen_explosive_resist"	}) 
	Panel:AddControl(	"Header",		{	Text = "NPCGCitizenExpl",	Description = "Can citizens resist explosive damages?"	}) 							
	
	Panel:AddControl(	"Header",		{	Text = "NPCGroups Settings",	Description = "Settings for the NPCG Addon.\nChanges take place for new NPCs only.\nSorry, that's how the game engine works - I can't change that."	}) 						
	
	Panel:AddControl(	"Header",		{	Text = "NPCGRandomYaw",	Description = "Do NPCs spawn with random yaw angles?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Random Spawn Yaw?",	Command = "npcg_randomyaw"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGLongVis",	Description = "Can NPCs see you from parsecs away?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Long Visibility?",	Command = "npcg_longvision"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGDrop",	Description = "This may cause lag if you kill a tonne of them without picking up the guns!"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "NPCs DON'T drop weapons?",	Command = "npcg_weapondrop"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGRebPickup",	Description = "Might mess with their accuracy settings - be warned!"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "NPCs can pick up loose guns?",	Command = "npcg_pickupguns"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGGiveWay",	Description = "Do NPCs move away if you get too close to them?\nChecked = don't give way"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "NPCs don't give way to players?",	Command = "npcg_ignorepushing"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGRandReb",	Description = "May cause lag - best left turned off!"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Do Citizens have random faces?",						Command = "npcg_random_rebels"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGRegenAlly",	Description = "Do vital allies regen health?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Vital Ally HP Regen",	Command = "npcg_regenhealth_ally"	}) 

	Panel:AddControl(	"Header",		{	Text = "NPCGRegenVort",	Description = "Do Vorts regen health?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Vort HP Regen",	Command = "npcg_regenhealth_vort"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGVortCharge",	Description = "Can Vorts charge your armour?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Vort Armor Charge",	Command = "npcg_vortchargearmor"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGAntlionGCavern",	Description = "Antlion Guards use 'Cavern Behavior' instead of normal?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Antlions Guard Cavern",	Command = "npcg_antlion_cavern"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGAntlionGBark",	Description = "Can Antlion Guards call for help?\nNote: Undo does not remove called-in Antlions!"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Antlions Guard Barking",	Command = "npcg_antlion_barktoggle"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGAntlionEludeBurrow",	Description = "Should Antlions burrow when you get out of range?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Antlions burrow when eluded",	Command = "npcg_antlion_eludeburrow"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGAntlionAlertRange",	Description = "Range of Antlion's alert distance; ties in with the burrow when eluded setting.\nKeep in mind that Antlions rely on sound, not sight."	}) 	
	Panel:AddControl(	"Slider",		{	Label = "Antlion alert distance",	Type = "Integer",	Min = 0,	Max = 8192,	Command = "npcg_antlion_alertrange",	})
	Panel:AddControl(	"Header",		{	Text = "NPCGRMBuried",	Description = "Should Rollermines start buried?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Rollermines spawn buried",	Command = "npcg_rollermineburied"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGClawScannerScout",	Description = "Claw Scanners Act as Scouts for Striders?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Claws Scout for Striders",	Command = "npcg_clawscanner_striderscout"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGCmbSoldierTactVar",	Description = "Combine Soldier Tactical Behaviors\n0 = Normal\n1 = Keep Advancing\n2 = Advance until within 30 ft then normal"	}) 						
	Panel:AddControl(	"Slider",		{	Label = "Soldier Tactics",	Type = "Integer",	Min = 0,	Max = 2,	Command = "npcg_combine_tacticalvar",	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGCmbSoldierAR2Drop",	Description = "Combine Elite AR2 Alt-Fire Dropping"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "AR2 Alt Drop",	Command = "npcg_cmbelite_ar2altdrop",	}) 

	Panel:AddControl(	"Header",		{	Text = "NPCGCrabCatch",	Description = "Should headcrabs turn NPCs into zombies on death?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Zombify (NPC)",	Command = "npcg_zombify_npc"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGPlyCrabCatch",	Description = "Should headcrabs turn players into zombies on death?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Zombify (Player)",	Command = "npcg_zombify_ply"	}) 
	
	Panel:AddControl(	"Header",		{	Text = "NPCGSquad",	Description = "Do NPCGs use squads?"	}) 						
	Panel:AddControl(	"CheckBox",		{	Label = "Squads - Humans",	Command = "npcg_squad_human"	}) 
	Panel:AddControl(	"CheckBox",		{	Label = "Squads - Antlions",	Command = "npcg_squad_antlion"	}) 
	Panel:AddControl(	"CheckBox",		{	Label = "Squads - Zombies",	Command = "npcg_squad_zombie"	}) 
	Panel:AddControl(	"CheckBox",		{	Label = "Squads - Combine",	Command = "npcg_squad_combine"	}) 
	Panel:AddControl(	"CheckBox",		{	Label = "Squads - Vort Slaves",	Command = "npcg_squad_vortslave"	}) 

	Panel:AddControl(	"Header",		{	Text = "NPCGZombieTorsoDice",	Description = "Chance for Zombies to spawn as torsos?"	}) 						
	Panel:AddControl(	"Slider",		{	Label = "Torso Chance 1/",	Type = "Integer",	Min = 1,	Max = 32,	Command = "npcg_zombietorsochance"	})
	
	Panel:AddControl(	"Header",		{	Text = "NPCGRebelMedicDice",	Description = "Chance for Rebels to spawn as medics?"	}) 						
	Panel:AddControl(	"Slider",		{	Label = "Medic Chance 1/",	Type = "Integer",	Min = 1,	Max = 32,	Command = "npcg_medicchance"	})
	
	Panel:AddControl(	"Header",		{	Text = "NPCGRebelAmmoDice",	Description = "Chance for Rebels to Spawn as ammo givers?"	}) 						
	Panel:AddControl(	"Slider",		{	Label = "Ammo Chance 1/",	Type = "Integer",	Min = 1,	Max = 32,	Command = "npcg_rebelresupplychance"	})
	
	Panel:AddControl(	"Header",		{	Text = "NPCGGren",	Description = "How many grenades do you want NPCs to have?"	}) 						
	Panel:AddControl(	"Slider",		{	Label = "Grenade Count",	Type = "Integer",	Min = 0,	Max = 25,	Command = "npcg_grenadecount"	})
	
	Panel:AddControl(	"Header",		{	Text = "NPCGHack",	Description = "How many Manhacks do you want CPs to have?\nRemember that undoing the entity does not remove the hacks!"	}) 						
	Panel:AddControl(	"Slider",		{	Label = "Manhack Count",	Type = "Integer",	Min = 0,	Max = 25,	Command = "npcg_manhackcount"	})
	
	Panel:AddControl(	"Header",		{	Text = "NPCGACC",	Description = "On a scale of Stormtrooper (0) to USN SEAL Sniper (4), how accurate do you want your NPCs to be?"	}) 						
	Panel:AddControl(	"Slider",		{	Label = "Accuracy - Citizens",	Type = "Integer",	Min = 0,	Max = 4,	Command = "npcg_accuracy_citizen",	})
	Panel:AddControl(	"Slider",		{	Label = "Accuracy - Rebels",	Type = "Integer",	Min = 0,	Max = 4,	Command = "npcg_accuracy_rebel",	})
	Panel:AddControl(	"Slider",		{	Label = "Accuracy - Monk",	Type = "Integer",	Min = 0,	Max = 4,	Command = "npcg_accuracy_monk",	})
	Panel:AddControl(	"Slider",		{	Label = "Accuracy - Alyx",	Type = "Integer",	Min = 0,	Max = 4,	Command = "npcg_accuracy_alyx",	})
	Panel:AddControl(	"Slider",		{	Label = "Accuracy - Barney",	Type = "Integer",	Min = 0,	Max = 4,	Command = "npcg_accuracy_barney",	})
	Panel:AddControl(	"Slider",		{	Label = "Accuracy - CP",	Type = "Integer",	Min = 0,	Max = 4,	Command = "npcg_accuracy_cp",	})
	Panel:AddControl(	"Slider",		{	Label = "Accuracy - Combine",	Type = "Integer",	Min = 0,	Max = 4,	Command = "npcg_accuracy_combine",	})
	Panel:AddControl(	"Header",		{	Text = "NPCGNotice",	Description = "NPCGroups by NeoTanks\nSteam Workshop Version/Updates by V92\n\nIf you want to make some kind of derivative of this addon, please contact V92! He can help you!"	})
	
end
local 	function NPCGroupsToolMenu() spawnmenu.AddToolMenuOption( "Options", "V92", "NPCGCVars", "NPC Groups", "", "", NPCGroupsConVars) end
hook.Add( "PopulateToolMenu", "NPCGroupsToolMenu", NPCGroupsToolMenu)
--	When I wrote this, there was a need for it, but as of this sentence being written, there are several alternatives you can use. If you really want to use this, Go ahead, just don't upload it anywhere
local	_CVTOGZMBFYNPC	=	GetConVarNumber( "npcg_zombify_npc" )
local	function npcgNPCZombification( vic, atk, kil )
	if _CVTOGZMBFYNPC != 0 then
		local	_V			=	vic
		local	_K			=	kil
		local	_KC			=	kil:GetClass()
		local	_CMDL		=	{	"models/combine_super_soldier.mdl",	"models/combine_soldier_prisonguard.mdl", "models/combine_soldier.mdl"	}
		local	_IMDL		=	{	"models/gman.mdl", "models/gman_high.mdl", "models/vortigaunt.mdl", "models/vortigaunt_blue.mdl", "models/vortigaunt_doctor.mdl", "models/vortigaunt_slave.mdl", "models/dog.mdl", "models/hunter.mdl", "models/ministrider.mdl", "models/advisor.mdl", "models/antlion.mdl", "models/antlion_worker.mdl", "models/antlion_guard.mdl", "models/barnacle.mdl", "models/crow.mdl", "models/pigeon.mdl", "models/seagull.mdl",	"models/ichthyosaur.mdl", "models/roller.mdl", "models/combine_turrets/ceiling_turret.mdl", "models/combine_turrets/floor_turret.mdl", "models/combine_turrets/ground_turret.mdl", "models/strider.mdl"	}
		local	_HDCT		=	{	"npc_headcrab", "npc_headcrab_fast", "npc_headcrab_black"	}
		local	_HDCS		=	"npc_headcrab"
		local	_HDCF		=	"npc_headcrab_fast"
		local	_HDCP		=	"npc_headcrab_black"
		local	_ZMBS		=	"npc_zombie"
		local	_ZMBF		=	"npc_fastzombie"
		local	_ZMBP		=	"npc_poisonzombie"
		local	_ZMBC		=	"npc_zombine"
		local	_NPC		=	nil
		if (_V:IsNPC() and _K:IsNPC()) and not table.HasValue( _IMDL, _V:GetModel() ) and table.GetKeys( _HDCT ) then
			if GetConVarNumber( "VNT_Debug_Prints" ) != 0 then	print("NPC Zombification - Function Run") end
			if (_KC == _HDCF or _KC == _HDCS or _KC == _HDCP) and table.HasValue( _CMDL, _V:GetModel() ) then
				if GetConVarNumber( "VNT_Debug_Prints" ) != 0 then	print("NPC Zombification - Zombine") end
				_V:Remove()
				_K:Remove()
				_NPC = ents.Create(_ZMBC)
				_NPC:SetPos(_V:GetPos())
				_NPC:SetAngles( Angle( 0, _V:GetAngles().y, 0 ) )
				_NPC:Spawn()
				_NPC:Activate()
			else
				if _KC == _HDCS then
					if GetConVarNumber( "VNT_Debug_Prints" ) != 0 then	print("NPC Zombification - Zombie") end
					_V:Remove()
					_K:Remove()
					_NPC = ents.Create(_ZMBS)
					_NPC:SetPos(_V:GetPos())
					_NPC:SetAngles( Angle( 0, _V:GetAngles().y, 0 ) )
					_NPC:Spawn()
					_NPC:Activate()
				end
				if _KC == _HDCF then
					if GetConVarNumber( "VNT_Debug_Prints" ) != 0 then	print("NPC Zombification - Fast Zombie") end
					_V:Remove()
					_K:Remove()
					_NPC = ents.Create(_ZMBF)
					_NPC:SetPos(_V:GetPos())
					_NPC:SetAngles( Angle( 0, _V:GetAngles().y, 0 ) )
					_NPC:Spawn()
					_NPC:Activate()
				end
				if _KC == _HDCP then
					if GetConVarNumber( "VNT_Debug_Prints" ) != 0 then	print("NPC Zombification - Poison Zombie") end
					_V:Remove()
					_K:Remove()
					_NPC = ents.Create(_ZMBP)
					_NPC:SetPos(_V:GetPos())
					_NPC:SetAngles( Angle( 0, _V:GetAngles().y, 0 ) )
					_NPC:Spawn()
					_NPC:Activate()
				end
			end
		end
	end

	if _CVTOGZMBFYNPC != 0 then
		hook.Add("OnNPCKilled", "npcgNPCZombification", npcgNPCZombification)
	else
		hook.Remove("npcgNPCZombification")
	end

end

local _CVTOGZMBFYPLY = GetConVarNumber( "npcg_zombify_ply" )
local function npcgPLYZombification( vic, atk, kil )
	if _CVTOGZMBFYPLY != 0 then
		local	_P			=	debug.getregistry().Player
		local	_V			=	vic
		local	_K			=	kil
		local	_KC			=	kil:GetClass()
		local	_HDCT		=	{	"npc_headcrab", "npc_headcrab_fast", "npc_headcrab_black"	}
		local	_HDCS		=	"npc_headcrab"
		local	_HDCF		=	"npc_headcrab_fast"
		local	_HDCP		=	"npc_headcrab_black"
		local	_ZMBS		=	"npc_zombie"
		local	_ZMBF		=	"npc_fastzombie"
		local	_ZMBP		=	"npc_poisonzombie"
		local	_NPC		=	nil
		if !_V:IsNPC() and table.GetKeys( _HDCT ) then
			if _KC == _HDCS then
				if GetConVarNumber( "VNT_Debug_Prints" ) != 0 then	print("Player Zombification - Zombie") end
				_V:GetRagdollEntity():Remove()
				_K:Remove()
				_NPC = ents.Create(_ZMBS)
				_NPC:SetPos(_V:GetPos())
				_NPC:SetAngles( Angle( 0, _V:GetAngles().y, 0 ) )
				_NPC:Spawn()
				_NPC:Activate()
			end
			if _KC == _HDCF then
				if GetConVarNumber( "VNT_Debug_Prints" ) != 0 then	print("Player Zombification - Fast Zombie") end
				_V:GetRagdollEntity():Remove()
				_K:Remove()
				_NPC = ents.Create(_ZMBF)
				_NPC:SetPos(_V:GetPos())
				_NPC:SetAngles( Angle( 0, _V:GetAngles().y, 0 ) )
				_NPC:Spawn()
				_NPC:Activate()
			end
			if _KC == _HDCP then
				if GetConVarNumber( "VNT_Debug_Prints" ) != 0 then	print("Player Zombification - Poison Zombie") end
				_V:GetRagdollEntity():Remove()
				_K:Remove()
				_NPC = ents.Create(_ZMBP)
				_NPC:SetPos(_V:GetPos())
				_NPC:SetAngles( Angle( 0, _V:GetAngles().y, 0 ) )
				_NPC:Spawn()
				_NPC:Activate()
			end
		end
	end

	if _CVTOGZMBFYNPC != 0 then
		hook.Add("PlayerDeath", "npcgPLYZombification", npcgPLYZombification)
	else
		hook.Remove("npcgPLYZombification")
	end

end

local	function NPCGroupsSpawn( _P, _NPC )
	local	_CVTOGCSTMMDLCMB	=	GetConVarString("npcg_custom_model_combine")
	local	_CVTOGCSTMMDLREB	=	GetConVarString("npcg_custom_model_rebel")
	local	_CVTOGCSTMMDLCP		=	GetConVarString("npcg_custom_model_cp")
	
	if _NPC == ("npcg_cstm_cmbft" or "npcg_cstm_cmbft_spawn") and not file.Exists( (_CVTOGCSTMMDLCMB), "GAME")then
		_P:ChatPrint("Non-existent model!\nProper usage:\n    npcg_custom_model_combine \"models/combine_super_soldier.mdl\"")
		--_NPC:Remove()
		return false
	end
	if _NPC == ("npcg_cstm_rebft" or "npcg_cstm_rebft_spawn") and !file.Exists( (_CVTOGCSTMMDLREB), "GAME") then
		--_NPC:Remove()
		_P:ChatPrint("Non-existent model!\nProper usage:\n    npcg_custom_model_rebel \"models/humans/group01/male01.mdl\"")
		return false
	end
	if _NPC == ("npcg_cstm_cpft" or "npcg_cstm_cpft_spawn") and !file.Exists( (_CVTOGCSTMMDLCP), "GAME") then
		--_NPC:Remove()
		_P:ChatPrint("Non-existent model!\nProper usage:\n    npcg_custom_model_cp \"models/police.mdl\"")
		return false
	end
end
hook.Add("PlayerSpawnNPC", "NPCGroupsSpawn", NPCGroupsSpawn)
local	function NPCGroupsSpawned( _P, _NPC ) _NPC.Owner = _P	end
hook.Add("PlayerSpawnedNPC", "NPCGroupsSpawned", NPCGroupsSpawned)
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
local Category = "NPCG: Resistance"
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
list.Set( "NPC", "npcgs_alyx", {	Name = "Alyx Vance",	Class = "npcgs_alyx",	Category = Category	} )
list.Set( "NPC", "npcgs_barney", {	Name = "Barney Calhoun",	Class = "npcgs_barney",	Category = Category	} )
list.Set( "NPC", "npcgs_eli", {	Name = "Eli Vance",	Class = "npcgs_eli",	Category = Category	} )
list.Set( "NPC", "npcgs_kleiner", {	Name = "Issac Kleiner",	Class = "npcgs_kleiner",	Category = Category	} )
list.Set( "NPC", "npcgs_magnusson", {	Name = "Arne Magnusson",	Class = "npcgs_magnusson",	Category = Category	} )
list.Set( "NPC", "npcgs_mossman", {	Name = "Judith Mossman",	Class = "npcgs_mossman",	Category = Category	} )
list.Set( "NPC", "npcgs_odessa", {	Name = "Odessa Cubbage",	Class = "npcgs_odessa",	Category = Category	} )
list.Set( "NPC", "npcgs_grigori", {	Name = "Father Grigori",	Class = "npcgs_grigori",	Category = Category	} )
list.Set( "NPC", "npcgs_civilian", {	Name = "Civilian",	Class = "npcgs_civilian",	Category = Category	} )
list.Set( "NPC", "npcgs_partisan", {	Name = "Partisan",	Class = "npcgs_partisan",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel", {	Name = "Rebel",	Class = "npcgs_rebel",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_hostile", {	Name = "Hostile Rebel",	Class = "npcgs_rebel_hostile",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_medic", {	Name = "Medic",	Class = "npcgs_rebel_medic",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_medic_hostile", {	Name = "Hostile Medic",	Class = "npcgs_rebel_medic_hostile",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_rkt", {	Name = "Rocketeer",	Class = "npcgs_rebel_rkt",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_rkt_hostile", {	Name = "Hostile Rocketeer",	Class = "npcgs_rebel_rkt_hostile",	Category = Category	} )
list.Set( "NPC", "npcgs_vort", {	Name = "Vortigaunt",	Class = "npcgs_vort",	Category = Category	} )
list.Set( "NPC", "npcgs_dog", {	Name = "D0G",	Class = "npcgs_dog",	Category = Category	} )

list.Set( "NPC", "npcg_cstm_rebft", {	Name = "Custom Rebel Fireteam",	Class = "npcg_cstm_rebft",	Category = Category	} )
list.Set( "NPC", "npcg_reb_baraly", {	Name = "Resistance Leaders",	Class = "npcg_reb_baraly",	Category = Category	} )
list.Set( "NPC", "npcg_reb_off", {	Name = "Resistance Officers",	Class = "npcg_reb_off",	Category = Category	} )
list.Set( "NPC", "npcg_reb_nlo", {	Name = "NLO Group",	Class = "npcg_reb_nlo",	Category = Category	} )
list.Set( "NPC", "npcg_reb_monk", {	Name = "Ravenholm Holdouts",	Class = "npcg_reb_monk",	Category = Category	} )
list.Set( "NPC", "npcg_reb_dog", {	Name = "D0G Pack",	Class = "npcg_reb_dog",	Category = Category	} )
list.Set( "NPC", "npcg_civilians", {	Name = "Civilians",	Class = "npcg_civilians",	Category = Category	})
list.Set( "NPC", "npcg_vortpack", {	Name = "Vortigaunts",	Class = "npcg_vortpack",	Category = Category	} )
list.Set( "NPC", "npcg_rebft", {	Name = "Rebel Fireteam",	Class = "npcg_rebft",	Category = Category	} )
list.Set( "NPC", "npcg_rebft_hostile", {	Name = "Rebel Fireteam (Hostile)",	Class = "npcg_rebft_hostile",	Category = Category	} )
list.Set( "NPC", "npcg_rebft_coward", {	Name = "Rebel Fireteam (Cowardly)",	Class = "npcg_rebft_coward",	Category = Category	} )
list.Set( "NPC", "npcg_rebsqd", {	Name = "Rebel Squad",	Class = "npcg_rebsqd",	Category = Category	} )
list.Set( "NPC", "npcg_partisan", {	Name = "Partisan Cell",	Class = "npcg_partisan",	Category = Category	} )
list.Set( "NPC", "npcg_partisan_hostile", {	Name = "Partisan Cell (Hostile)",	Class = "npcg_partisan_hostile",	Category = Category	} )
list.Set( "NPC", "npcg_partisan_coward", {	Name = "Partisan Cell (Cowardly)",	Class = "npcg_partisan_coward",	Category = Category	} )
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
local Category = "NPCG: Combine"
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
list.Set( "NPC", "npcgs_breen", {	Name = "Wallace Breen",	Class = "npcgs_breen",	Category = Category	} )
list.Set( "NPC", "npcgs_cscanner", {	Name = "City Scanner",	Class = "npcgs_cscanner",	Category = Category	} )
list.Set( "NPC", "npcgs_clawscanner", {	Name = "Claw Scanner",	Class = "npcgs_clawscanner",	Category = Category	} )
list.Set( "NPC", "npcgs_cptrooper", {	Name = "CP Trooper",	Class = "npcgs_cptrooper",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbsoldier", {	Name = "Soldier",	Class = "npcgs_cmbsoldier",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbsoldier_friendly", {	Name = "Soldier (Friendly)",	Class = "npcgs_cmbsoldier_friendly",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbshotgun", {	Name = "Shotgunner",	Class = "npcgs_cmbshotgun",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbshotgun_friendly", {	Name = "Shotgunner (Friendly)",	Class = "npcgs_cmbshotgun_friendly",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbelite", {	Name = "Elite",	Class = "npcgs_cmbelite",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbelite_friendly", {	Name = "Elite (Friendly)",	Class = "npcgs_cmbelite_friendly",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbnpguard", {	Name = "Prison Soldier",	Class = "npcgs_cmbnpguard",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbnpguard_friendly", {	Name = "Prison Soldier (Friendly)",	Class = "npcgs_cmbnpguard_friendly",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbnpsgguard", {	Name = "Prison Shotgunner",	Class = "npcgs_cmbnpsgguard",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbnpsgguard_friendly", {	Name = "Prison Shotgunner (Friendly)",	Class = "npcgs_cmbnpsgguard_friendly",	Category = Category	} )
list.Set( "NPC", "npcgs_rollermine", {	Name = "Rollermine",	Class = "npcgs_rollermine",	Category = Category	} )
list.Set( "NPC", "npcgs_manhack", {	Name = "Manhack",	Class = "npcgs_manhack",	Category = Category	} )
list.Set( "NPC", "npcgs_hunter", {	Name = "Hunter",	Class = "npcgs_hunter",	Category = Category	} )
list.Set( "NPC", "npcgs_vortslave", {	Name = "Vortigaunt Slave",	Class = "npcgs_vortslave",	Category = Category	} )

list.Set( "NPC", "npcg_cmb_off", {	Name = "Combine Officers",	Class = "npcg_cmb_off",	Category = Category	} )
list.Set( "NPC", "npcg_cmb_advisor", {	Name = "Advisor",	Class = "npcg_cmb_advisor",	Category = Category	} ) --	Shit's fucked, yo. Don't worry, I'll keep messing with it.
list.Set( "NPC", "npcg_cscanner", {	Name = "City Scanners",	Class = "npcg_cscanner",	Category = Category	} )
list.Set( "NPC", "npcg_clscanner", {	Name = "Claw Scanners",	Class = "npcg_clscanner",	Category = Category	} )
list.Set( "NPC", "npcg_cmbstalker", {	Name = "Stalkers",	Class = "npcg_cmbstalker",	Category = Category	} )
list.Set( "NPC", "npcg_cmbscout", {	Name = "Combine Scouts",	Class = "npcg_cmbscout",	Category = Category	} )
list.Set( "NPC", "npcg_manhacks", {	Name = "Manhack Pack",	Class = "npcg_manhacks",	Category = Category	} )
list.Set( "NPC", "npcg_rollermines", {	Name = "Rollermines",	Class = "npcg_rollermines",	Category = Category	} )
list.Set( "NPC", "npcg_hunterpack", {	Name = "Hunter Pack",	Class = "npcg_hunterpack",	Category = Category	} )
list.Set( "NPC", "npcg_hunterpack_friendly", {	Name = "Hunter Pack (Friendly)",	Class = "npcg_hunterpack_friendly",	Category = Category	} )
list.Set( "NPC", "npcg_vortslave", {	Name = "Vort Slaves",	Class = "npcg_vortslave",	Category = Category	} )
list.Set( "NPC", "npcg_prospektft", {	Name = "Prison Fireteam",	Class = "npcg_prospektft",	Category = Category	} )
list.Set( "NPC", "npcg_prospektsqd", {	Name = "Prison Squad",	Class = "npcg_prospektsqd",	Category = Category	} )
list.Set( "NPC", "npcg_cpscout", {	Name = "CP Scouts",	Class = "npcg_cpscout",	Category = Category	} )
list.Set( "NPC", "npcg_cpft", {	Name = "CP Fireteam",	Class = "npcg_cpft",	Category = Category	} )
list.Set( "NPC", "npcg_cpsqd", {	Name = "CP Squad",	Class = "npcg_cpsqd",	Category = Category	} )
list.Set( "NPC", "npcg_striderpack", {	Name = "Strider Pack",	Class = "npcg_striderpack",	Category = Category	} )
-- list.Set( "NPC", "npcg_cstm_cpft", {	Name = "Custom CP Fireteam",	Class = "npcg_cstm_cpft",	Category = Category	} )
list.Set( "NPC", "npcg_cpft_neutral", {	Name = "CP Fireteam (Neutral)",	Class = "npcg_cpft_neutral",	Category = Category	} )
list.Set( "NPC", "npcg_cmbft", {	Name = "Combine Fireteam",	Class = "npcg_cmbft",	Category = Category	} )
list.Set( "NPC", "npcg_cmbft_neutral", {	Name = "Combine Fireteam (Neutral)",	Class = "npcg_cmbft_neutral",	Category = Category	} )
list.Set( "NPC", "npcg_cmbft_coward", {	Name = "Combine Fireteam (Cowardly)",	Class = "npcg_cmbft_coward",	Category = Category	} )
list.Set( "NPC", "npcg_cmbsqd", {	Name = "Combine Squad",		Class = "npcg_cmbsqd",	Category = Category	} )
list.Set( "NPC", "npcg_cstm_cmbft", {	Name = "Custom Combine Fireteam",	Class = "npcg_cstm_cmbft",	Category = Category	} )
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
local Category = "NPCG: Antlions"
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
list.Set( "NPC", "npcg_antpack_friendly", {	Name = "Friendly Antlions",	Class = "npcg_antpack_friendly",	Category = Category	} )
list.Set( "NPC", "npcg_antguard", {	Name = "Antlion Guard Cohort",	Class = "npcg_antguard",	Category = Category	} )
list.Set( "NPC", "npcg_antguardian", {	Name = "Cavern Guard",	Class = "npcg_antguardian",	Category = Category	} )
list.Set( "NPC", "npcg_antpack", {	Name = "Antlion Pack",	Class = "npcg_antpack",	Category = Category	} )
list.Set( "NPC", "npcg_antswarm", {	Name = "Antlion Swarm",	Class = "npcg_antswarm",	Category = Category	} )
list.Set( "NPC", "npcgs_antlion", {	Name = "Antlion Soldier",	Class = "npcgs_antlion",	Category = Category	} )
list.Set( "NPC", "npcgs_antworker", {	Name = "Antlion Worker",	Class = "npcgs_antworker",	Category = Category	} )
list.Set( "NPC", "npcgs_antguard", {	Name = "Antlion Guard",	Class = "npcgs_antguard",	Category = Category	} )
list.Set( "NPC", "npcgs_antguardian", {	Name = "Antlion Guardian",	Class = "npcgs_antguardian",	Category = Category	} )
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
local Category = "NPCG: Zombies"
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
list.Set( "NPC", "npcg_zmb", {	Name = "Zombie Group",	Class = "npcg_zmb",	Category = Category	} )
list.Set( "NPC", "npcg_zmbpoison", {	Name = "Poison Zombie Group",	Class = "npcg_zmbpoison",	Category = Category	} )
list.Set( "NPC", "npcg_zmb_swarm", {	Name = "Zombie Swarm",	Class = "npcg_zmb_swarm",	Category = Category	} )
list.Set( "NPC", "npcg_zmbf", {	Name = "Fast Zombie Pack",	Class = "npcg_zmbf",	Category = Category	} )
list.Set( "NPC", "npcg_zmbf_swarm", {	Name = "Fast Zombie Swarm",	Class = "npcg_zmbf_swarm",	Category = Category	} )
list.Set( "NPC", "npcg_zmb_crabs", {	Name = "Headcrabs",	Class = "npcg_zmb_crabs",	Category = Category	} )
list.Set( "NPC", "npcg_zmb_crabsp", {	Name = "Poison Crabs",	Class = "npcg_zmb_crabsp",	Category = Category	} )
list.Set( "NPC", "npcg_zmbine", {	Name = "Zombine Strays",	Class = "npcg_zmbine",	Category = Category	} )
list.Set( "NPC", "npcgs_zmb", {	Name = "Zombie",	Class = "npcgs_zmb",	Category = Category	} )
list.Set( "NPC", "npcgs_zmbf", {	Name = "Fast Zombie",	Class = "npcgs_zmbf",	Category = Category	} )
list.Set( "NPC", "npcgs_zmbp", {	Name = "Poison Zombie",	Class = "npcgs_zmbp",	Category = Category	} )
list.Set( "NPC", "npcgs_zmbs", {	Name = "Zombine",	Class = "npcgs_zmbs",	Category = Category	} )
list.Set( "NPC", "npcgs_crab", {	Name = "Headcrab",	Class = "npcgs_crab",	Category = Category	} )
list.Set( "NPC", "npcgs_crabf", {	Name = "Fast Headcrab",	Class = "npcgs_crabf",	Category = Category	} )
list.Set( "NPC", "npcgs_crabp", {	Name = "Poison Headcrab",	Class = "npcgs_crabp",	Category = Category	} )
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
local Category = "NPCG: Animals"
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
list.Set( "NPC", "npcgs_crow", {	Name = "Crow",	Class = "npcgs_crow",	Category = Category	} )
list.Set( "NPC", "npcgs_seagull", {	Name = "Seagull",	Class = "npcgs_seagull",	Category = Category	} )
list.Set( "NPC", "npcgs_pigeon", {	Name = "Pigeon",	Class = "npcgs_pigeon",	Category = Category	} )
list.Set( "NPC", "npcg_crow", {	Name = "Crows",	Class = "npcg_crow",	Category = Category	} )
list.Set( "NPC", "npcg_pigeon", {	Name = "Pigeons",	Class = "npcg_pigeon",	Category = Category	} )
list.Set( "NPC", "npcg_seagull", {	Name = "Seagulls",	Class = "npcg_seagull",	Category = Category	} )
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
local Category = "NPCG: Spawners"
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
list.Set( "NPC", "npcgs_crow_spawn", {	Name = "Crow",	Class = "npcgs_crow_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_seagull_spawn", {	Name = "Seagull",	Class = "npcgs_seagull_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_pigeon_spawn", {	Name = "Pigeon",	Class = "npcgs_pigeon_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_zmb_spawn", {	Name = "Zombie",	Class = "npcgs_zmb_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_zmbf_spawn", {	Name = "Fast Zombie",	Class = "npcgs_zmbf_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_zmbp_spawn", {	Name = "Poison Zombie",	Class = "npcgs_zmbp_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_zmbs_spawn", {	Name = "Zombine",	Class = "npcgs_zmbs_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_crab_spawn", {	Name = "Headcrab",	Class = "npcgs_crab_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_crabf_spawn", {	Name = "Fast Headcrab",	Class = "npcgs_crabf_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_crabp_spawn", {	Name = "Poison Headcrab",	Class = "npcgs_crabp_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_antlion_spawn", {	Name = "Antlion Soldier",	Class = "npcgs_antlion_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_antworker_spawn", {	Name = "Antlion Worker",	Class = "npcgs_antworker_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_antguard_spawn", {	Name = "Antlion Guard",	Class = "npcgs_antguard_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_antguardian_spawn", {	Name = "Antlion Guardian",	Class = "npcgs_antguardian_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_breen_spawn", {	Name = "Wallace Breen",	Class = "npcgs_breen_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cscanner_spawn", {	Name = "City Scanner",	Class = "npcgs_cscanner_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_clawscanner_spawn", {	Name = "Claw Scanner",	Class = "npcgs_clawscanner_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cptrooper_spawn", {	Name = "Civil Protection",	Class = "npcgs_cptrooper_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbsoldier_spawn", {	Name = "Soldier",	Class = "npcgs_cmbsoldier_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbsoldier_friendly_spawn", {	Name = "Soldier (Friendly)",	Class = "npcgs_cmbsoldier_friendly_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbshotgun_spawn", {	Name = "Shotgunner",	Class = "npcgs_cmbshotgun_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbshotgun_friendly_spawn", {	Name = "Shotgunner (Friendly)",	Class = "npcgs_cmbshotgun_friendly_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbelite_spawn", {	Name = "Elite",	Class = "npcgs_cmbelite_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbelite_friendly_spawn", {	Name = "Elite (Friendly)",	Class = "npcgs_cmbelite_friendly_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbnpguard_spawn", {	Name = "Prison Soldier",	Class = "npcgs_cmbnpguard_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbnpguard_friendly_spawn", {	Name = "Prison Soldier (Friendly)",	Class = "npcgs_cmbnpguard_friendly_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbnpsgguard_spawn", {	Name = "Prison Shotgunner",	Class = "npcgs_cmbnpsgguard_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_cmbnpsgguard_friendly_spawn", {	Name = "Prison Shotgunner (Friendly)",	Class = "npcgs_cmbnpsgguard_friendly_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_rollermine_spawn", {	Name = "Rollermine",	Class = "npcgs_rollermine_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_manhack_spawn", {	Name = "Manhack",	Class = "npcgs_manhack_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_hunter_spawn", {	Name = "Hunter",	Class = "npcgs_hunter_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_vortslave_spawn", {	Name = "Vortigaunt Slave",	Class = "npcgs_vortslave_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_alyx_spawn", {	Name = "Alyx Vance",	Class = "npcgs_alyx_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_barney_spawn", {	Name = "Barney Calhoun",	Class = "npcgs_barney_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_eli_spawn", {	Name = "Eli Vance",	Class = "npcgs_eli_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_kleiner_spawn", {	Name = "Issac Kleiner",	Class = "npcgs_kleiner_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_magnusson_spawn", {	Name = "Arne Magnusson",	Class = "npcgs_magnusson_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_mossman_spawn", {	Name = "Judith Mossman",	Class = "npcgs_mossman_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_odessa_spawn", {	Name = "Odessa Cubbage",	Class = "npcgs_odessa_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_grigori_spawn", {	Name = "Father Grigori",	Class = "npcgs_grigori_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_civilian_spawn", {	Name = "Civilian",	Class = "npcgs_civilian_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_partisan_spawn", {	Name = "Partisan",	Class = "npcgs_partisan_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_spawn", {	Name = "Rebel",	Class = "npcgs_rebel_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_hostile_spawn", {	Name = "Rebel (Hostile)",	Class = "npcgs_rebel_hostile_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_medic_spawn", {	Name = "Medic",	Class = "npcgs_rebel_medic_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_medic_hostile_spawn", {	Name = "Medic (Hostile)",	Class = "npcgs_rebel_medic_hostile_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_rkt_spawn", {	Name = "Rocketeer",	Class = "npcgs_rebel_rkt_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_rebel_rkt_hostile_spawn", {	Name = "Rocketeer (Hostile)",	Class = "npcgs_rebel_rkt_hostile_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_vort_spawn", {	Name = "Vortigaunt",	Class = "npcgs_vort_spawn",	Category = Category	} )
list.Set( "NPC", "npcgs_dog_spawn", {	Name = "D0G",	Class = "npcgs_dog_spawn",	Category = Category	} )

list.Set( "NPC", "npcg_antpack_spawn", {	Name = "Antlion Pack",	Class = "npcg_antpack_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_rebft_spawn", {	Name = "Rebel Fireteam",	Class = "npcg_rebft_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_rebft_hostile_spawn", {	Name = "Rebel Fireteam (Hostile)",	Class = "npcg_rebft_hostile_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_rebft_neutral_spawn", {	Name = "Rebel Fireteam (Neutral)",	Class = "npcg_rebft_neutral_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_civilians_spawn", {	Name = "Civilians",	Class = "npcg_civilians_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_cmbft_spawn", {	Name = "Combine Fireteam",	Class = "npcg_cmbft_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_cmbft_neutral_spawn", {	Name = "Combine Fireteam (Neutral)",	Class = "npcg_cmbft_neutral_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_vortpack_spawn", {	Name = "Vortigaunt Pack",	Class = "npcg_vortpack_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_vortslave_spawn", {	Name = "Vort Slave Pack",	Class = "npcg_vortslave_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_partisan_spawn", {	Name = "Partisan Fireteam",	Class = "npcg_partisan_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_partisan_hostile_spawn", {	Name = "Partisan Fireteam (Hostile)",	Class = "npcg_partisan_hostile_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_hunterpack_spawn", {	Name = "Hunter Pack",	Class = "npcg_hunterpack_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_hunterpack_friendly_spawn", {	Name = "Hunter Pack (Friendly)",	Class = "npcg_hunterpack_friendly_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_prospektft_spawn", {	Name = "Prison Guard Fireteam",	Class = "npcg_prospektft_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_cpft_spawn", {	Name = "CP Fireteam",	Class = "npcg_cpft_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_cpft_neutral_spawn", {	Name = "CP Fireteam (Neutral)",	Class = "npcg_cpft_neutral_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_zmb_spawn", {	Name = "Zombie Pack",	Class = "npcg_zmb_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_zmbpoison_spawn", {	Name = "Poison Zombie Pack",	Class = "npcg_zmbpoison_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_zmbf_spawn", {	Name = "Fast Zombie Pack",	Class = "npcg_zmbf_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_zmbine_spawn", {	Name = "Zombine Pack",	Class = "npcg_zmbine_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_manhacks_spawn", {	Name = "Manhack Pack",	Class = "npcg_manhacks_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_rollermines_spawn", {	Name = "Rollermine Cluster",	Class = "npcg_rollermines_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_clscanner_spawn", {	Name = "Claw Scanner Flock",	Class = "npcg_clscanner_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_cscanner_spawn", {	Name = "City Scanner Flock",	Class = "npcg_cscanner_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_cmbstalker_spawn", {	Name = "Stalker Cluster",	Class = "npcg_cmbstalker_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_zmb_crabs_spawn", {	Name = "Headcrab Pack",	Class = "npcg_zmb_crabs_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_zmb_crabsp_spawn", {	Name = "Poison Crab Pack",	Class = "npcg_zmb_crabsp_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_cstm_cmbft_spawn",  {	Name = "Custom Combine Fireteam",	Class = "npcg_cstm_cmbft_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_cstm_cpft_spawn", {	Name = "Custom CP Fireteam",	Class = "npcg_cstm_cpft_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_cstm_rebft_spawn", {	Name = "Custom Rebel Fireteam",	Class = "npcg_cstm_rebft_spawn",	Category = Category	} )
