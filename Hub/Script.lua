local games = {
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
	["DrinkHaxx.lua"] = 1747207098,
	["StoneMinerSimulator2.lua"] = 10631181587,
	["LiftingPowerSimulator.lua"] = 9957252500,
	["ShoutingSimulator.lua"] = 1304603528,
	["InnovationArcticBase.lua"] = 1033860623,
	["VehicleLegends.lua"] = 4566572536,
	["RoboticSimulator.lua"] = 1953438140,
	["LumberSimulator2.lua"] = 1351649689,
	["NinjaLegends.lua"] = 3956818381,
	["UltraPowerTycoon.lua"] = 8146731988,
	["SuperHeroTycoon.lua"] = 574407221
}


local pages = game:GetService"AssetService":GetGamePlacesAsync()
while wait() do
	for i, place in pairs(pages:GetCurrentPage()) do
		for i,v in next, games do 
			if game.PlaceId == v then
				return loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Scripts/" .. i))()
			end
			if game.CreatorId == v then
				return loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Scripts/" .. i))()
			end
		end
	end
	if pages.IsFinished then break end
	pages:AdvanceToNextPageAsync()
end

loadstring(game:HttpGet"https://grannythedev.github.io/GrannyHub/Scripts/GameNotSupported.lua")()
return true