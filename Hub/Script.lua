repeat wait() until game and game:IsLoaded()
local games = {
  [""] = { ["Link"] = "" },
	["1224212277"] = {
		["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/MadCity.lua"
	},
	["60100179"] = {
		["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/Area51Haxx.lua"
	},
	["961409234"] = {
		["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/BloodMoonTycoon.lua"
	},
	["3461453"] = {
		["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/TreasureQuest.lua"
	},
	["16170943"] = {
		["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/RiseoftheDead.lua"
	},
	["4484634"] = {
		["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/WorldZero.lua"
	},
	["606849621"] = {
		["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/Jailbreak.lua"
	},
	["5182200788"] = {
		["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/VehicleWeightLifting.lua"
	},
	["1122519450"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/TitanSimulator.lua"
	},
        ["28382335"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/SurvivalZombieTycoon.lua"
	},
        ["2986677229"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/GiantHaxx.lua"
	},
	["100952125"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/InnovationIncSpaceship.lua"
	},
	["3652625463"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/LiftingSimulator.lua"
	},
        ["8328351891"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/MegaMansionTycoon.lua"
	},
	["5104202731"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/FLbeta.lua"
	},
	["8737602449"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/PlsDonate.lua"
	},
	["1747207098"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/DrinkHaxx.lua"
	},
	["10631181587"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/StoneMinerSimulator2.lua"
	},
	["9957252500"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/LiftingPowerSimulator.lua"
	},
	["1304603528"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/ShoutingSimulator.lua"
	},
	["1033860623"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/GrannyHub/Scripts/InnovationArcticBase.lua"
	}
}
local pages = game:GetService"AssetService":GetGamePlacesAsync()
while wait() do
	for i, place in pairs(pages:GetCurrentPage()) do
		local gotgame = games[tostring(place.PlaceId)]
		local gotgameL = games[tostring(game.CreatorId)]
		if gotgame then
			return loadstring(game:HttpGet(gotgame.Link))()
		end
		if gotgameL then
			return loadstring(game:HttpGet(gotgameL.Link))()
		end
	end
	if pages.IsFinished then break end
	pages:AdvanceToNextPageAsync()
end
loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Scripts/GameNotSupported.lua"))()
return true