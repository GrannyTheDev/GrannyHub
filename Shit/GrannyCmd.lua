if gethui then
     for i,v in pairs(gethui():GetChildren()) do
	  if v:IsA("ScreenGui") and v.Name == "GrannyCmd" then
		v:Destroy()
	  end
     end
elseif syn and syn.unprotect_gui then
     for i,v in pairs(game.CoreGui:GetChildren()) do
	  if v:IsA("ScreenGui") and v.Name == "GrannyCmd" then
                syn.unprotect_gui(v)
                v:Destroy()
          end
     end
else
     for i,v in pairs(game.CoreGui:GetChildren()) do
	  if v:IsA("ScreenGui") and v.Name == "GrannyCmd" then
	        v:Destroy()
	  end
     end
end

local GrannyCmd = Instance.new("ScreenGui")
GrannyCmd.Name = "GrannyCmd"
GrannyCmd.ResetOnSpawn = false

if gethui then
     GrannyCmd.Parent = gethui()
elseif syn and syn.protect_gui then
     syn.protect_gui(GrannyCmd)
     GrannyCmd.Parent = cloneref(game:GetService("CoreGui"))
else
     GrannyCmd.Parent = cloneref(game:GetService("CoreGui"))
end
