local me = game.Players.LocalPlayer
local gay = nil

for i,v in pairs(workspace:GetDescendants()) do
    if v.Name == "TextLabel" then
        if v.Text:match(me.DisplayName, 1, true) then
            gay = v
        end
    end
end


local bas = gay.Parent.Parent.Parent.Parent



local function parseNumber(str)
    str = str:lower():gsub(",", ""):gsub("%s","")
    str = str:gsub("%$", "") 
    str = str:gsub("/s", "") 

    local multiplier = 1
    if str:find("k") then
        multiplier = 1000
        str = str:gsub("k", "")
    elseif str:find("m") then
        multiplier = 1000000
        str = str:gsub("m", "")
    end

    local num = tonumber(str)
    if num then
        return num * multiplier
    else
        return nil
    end
end

local maxValue = nil
local maxObj = nil

for i,v in pairs(workspace.Plots:GetDescendants()) do
    if v.Name == "Generation" then
        local num = parseNumber(v.Text)
        if num then
            if v.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name ~= bas.Name then
            if not maxValue or num > maxValue then
                maxValue = num
                maxObj = v
            end
            end
        end
    end
end


local part = maxObj.Parent.Parent.Parent.Parent.Decorations.Part



local billboard = Instance.new("BillboardGui")
billboard.Adornee = part            
billboard.Size = UDim2.new(0, 200, 0, 50) 
billboard.StudsOffset = Vector3.new(0, 3, 0) 
billboard.AlwaysOnTop = true       
billboard.Parent = workspace       


if maxValue >= 1000000
then
    game.StarterGui:SetCore("SendNotification", {
    Title = "1kk+ found";
    Text = "";
    Duration = 3;       
})
end



local function formatNumber(num)
    if num >= 1e6 then
        return string.format("%.1fM/s", num/1e6)
    elseif num >= 1e3 then
        return string.format("%.1fK/s", num/1e3)
    else
        return string.format("%d/s", num)
    end
end

local formatted = formatNumber(maxValue)



billboard.Adornee = part            
billboard.Size = UDim2.new(0, 100, 0, 20) 
billboard.StudsOffset = Vector3.new(0, 3, 0) 
billboard.AlwaysOnTop = true       
billboard.Parent = workspace       


local textLabel = Instance.new("TextLabel")
textLabel.Parent = billboard
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = tostring(formatted)
textLabel.TextScaled = true
textLabel.TextColor3 = Color3.new(255/255, 0, 0)  
textLabel.TextStrokeTransparency = 0                       
textLabel.TextStrokeColor3 = Color3.new(0,0,0)            
textLabel.Font = Enum.Font.ArialBold

local dn = part.Parent.Parent.Spawn.Attachment.AnimalOverhead.DisplayName





local billboard2 = Instance.new("BillboardGui")
billboard2.Adornee = part            
billboard2.Size = UDim2.new(0, 100, 0, 20) 
billboard2.StudsOffset = Vector3.new(0, 8, 0) 
billboard2.AlwaysOnTop = true       
billboard2.Parent = workspace 

local textLabel = Instance.new("TextLabel")
textLabel.Parent = billboard2
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = tostring(dn.Text)
textLabel.TextScaled = true
textLabel.TextColor3 = Color3.new(255/255, 0, 0)   
textLabel.TextStrokeTransparency = 0                       
textLabel.TextStrokeColor3 = Color3.new(0,0,0)            
textLabel.Font = Enum.Font.ArialBold

local kal = maxObj.Parent.Parent.Parent.Parent
local ooo = kal.Decorations.Part



if maxValue
then
    game.StarterGui:SetCore("SendNotification", {
    Title = "Max value:";
    Text = tostring(formatted);
    Duration = 3;       
})
end

local partik = Instance.new("BoxHandleAdornment")
partik.Parent = workspace
partik.Size = Vector3.new(6, 1, 6)
partik.Transparency = 0.5
partik.ZIndex = 0
partik.AlwaysOnTop = true 
partik.Adornee = ooo
partik.Color3 = Color3.new(1,0,0)


