local games = {
        ["DrinkHaxx.lau"] = 1747207098,
	["MadCity.lua"] = 1224212277,
	["Area51Haxx.lua"] = 60100179,
	["BloodMoonTycoon.lua"] = 961409234,
	["TreasureQuest.lua"] = 3461453,
	["RiseoftheDead.lua"] = 16170943,
	["WorldZero.lua"] = 4484634,
	["Jailbreak.lua"] = 606849621,
	["VehicleWeightLifting.lua"] = 5182200788,
	["TitanSimulator.lua"] = 1122519450,
	["SurvivalZombieTycoon.lua"] = 28382335,
	["GiantHaxx.lua"] = 2986677229,
	["InnovationIncSpaceship.lua"] = 100952125,
	["LiftingSimulator.lua"] = 3652625463,
	["MegaMansionTycoon.lua"] = 8328351891,
	["FLbeta.lua"] = 5104202731,
	["PlsDonate.lua"] = 8737602449,
	["StoneMinerSimulator2.lua"] = 10631181587,
	["LiftingPowerSimulator.lua"] = 9957252500,
	["ShoutingSimulator.lua"] = 1304603528,
	["InnovationArcticBase.lua"] = 1033860623,
	["VehicleLegends.lua"] = 4566572536,
	["RoboticSimulator.lua"] = 1953438140,
	["LumberSimulator2.lua"] = 1351649689,
	["NinjaLegends.lua"] = 3956818381,
	["UltraPowerTycoon.lua"] = 8146731988,
	["SuperHeroTycoon.lua"] = 574407221,
	["IceBreaker.lua"] = 139613645,
	["DragonBladeRPG.lua"] = 7279999673,
	["MagicPunchingSimulator.lua"] = 10182167049,
	["MurderMystery2.lua"] = 142823291,
	["ReaperSimulator2.lua"] = 4828705676,
	["BoxingLeague.lua"] = 5134082,
	["SPTS.lua"] = 11312500614,
	["Knockout.lua"] = 5984992258,
	["WeaponFightingSimulator.lua"] = 8554378337,
	["BloxFruit.lua"] = 2753915549,
	["PrisonLife.lua"] = 155615604,
	["UltimateLiftingSimulator.lua"] = 2472820296,
	["ShadovisRpg.lua"] = 9585537847,
	["TextingSimulator.lua"] = 2580982329,
	["GorillaSimulator.lua"] = 1378712700,
	["ZombieAttack.lua"] = 1240123653,
	["DestructionSimulator.lua"] = 2248408710,
	["HideandSeekExtreme.lua"] = 205224386,
	["MuscleLegends.lua"] = 3623096087,
	["GergoLiftingSimulator.lua"] = 11479042514,
	["MonkeyTycoon.lua"] = 11400511154
}

local obbygames = {
	8712817601,
	5972698540,
	3587619225,
	9099326192,
	9372570969,
	6878620017,
	7027306580,
	3072832953,
	6153766069,
	9295827626,
	7378813434,
	2028593804,
	1946695497,
	1451599116,
	1428472551,
	7952502098,
	6496746583
}

for i,v in next, games do
	for q,e in next, obbygames do
		if game.PlaceId == v then
			return loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Scripts/" .. i))()
		end
		if game.CreatorId == v then
			return loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Scripts/" .. i))()
		end
		if game.PlaceId == e then
			return loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Scripts/ObbyScript.lua"))()
		end
	end
end
