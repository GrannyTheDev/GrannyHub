local quick = loadstring(game:HttpGet('https://raw.githubusercontent.com/Belkworks/quick/master/init.lua'))();

local s = quick.Service;

local workspace = s.Workspace;
local replicatedStorage = s.ReplicatedStorage;
local currentCamera = workspace.CurrentCamera;
local players = s.Players;
local virtualUser = s.VirtualUser;
local tweenService = s.TweenService;
local runService = s.RunService;
local stepped = runService.Stepped;

local client = players.LocalPlayer;
local character = client.Character or client.CharacterAdded:Wait();
client.CharacterAdded:Connect(function(char)
    character = char;
end);

local function tween(obj, time, ...)
    local tween = tweenService:Create(obj, TweenInfo.new(time), ...);
    tween:Play();
    tween.Completed:Connect(function() tween:Destroy() end);
	return tween;
end;

local function getNodeFolder()
    for _, f in next, workspace.Scene:GetChildren() do
        if type(tonumber(f.Name)) == 'number' then
            return f;
        end;
    end;
end;

local function getANode()
    local d, e = math.huge;
    for _, v in next, getNodeFolder():GetChildren() do
        if (v:FindFirstChild('Prefab') and #v.Prefab:GetChildren() > 0) then
            local magnitude = client:DistanceFromCharacter(v.Position);
            
            if (magnitude <= d) then
                d = magnitude;
                e = v;
            end;
        end;
    end;
    return e;
end;