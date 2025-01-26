wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,370,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti Afk"ca.TextColor3=Color3.new(0,1,1)
ca.TextSize=22;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,370,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,370,0,21)_b.Font=Enum.Font.Arial;_b.Text="Made by luca#5432"
_b.TextColor3=Color3.new(0,1,1)_b.TextSize=20;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377,0)
ab.Size=UDim2.new(0,370,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="Status: Active"
ab.TextColor3=Color3.new(0,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="Roblox tried kicking you buy I didnt let them!"wait(2)ab.Text="Status : Active"end)
local owner = "GYATT_DAMN1"

local cap = 45 -- FPS CAP

-- OWNER TABLE
local owners = {
    [owner] = true  -- Original owner
}

local prefix = "!"

-- BOTS
local bots = {
    ["Bloxi_BotNo5"] = 5
}

if game.Players.LocalPlayer.Name == owner then
local TeleportTime = 0.1


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")


local localPlayer = Players.LocalPlayer

local function resetCameraSubject()
	if workspace.CurrentCamera and localPlayer.Character then
		local humanoid = localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			workspace.CurrentCamera.CameraSubject = humanoid
		end
	end
end

local plr = Players.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local gui = Instance.new("ScreenGui")
local btn = Instance.new("TextButton")

local toggle = false
local targetPos = Vector3.new(905, -500, 0)
local lastPos = hrp.Position
local velConn

gui.Parent = plr:WaitForChild("PlayerGui")

btn.Size = UDim2.new(0, 100, 0, 50)
btn.Position = UDim2.new(0.5, -50, 0.5, -25)
btn.Text = "Toggle OFF"
btn.BackgroundColor3 = Color3.new(0.7, 0.7, 0.7)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Draggable = true
btn.Parent = gui

local function createTween(targetCFrame)
    local tweenInfo = TweenInfo.new(TeleportTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    return TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
end

local function startVelLoop()
    velConn = RunService.Heartbeat:Connect(function()
        if toggle then
            hrp.Velocity = Vector3.new(0, 0, 0)
        end
    end)
end

local function stopVelLoop()
    if velConn then
        velConn:Disconnect()
        velConn = nil
    end
end

local function toggleTween()
    if toggle then
        toggle = false
        btn.Text = "OFF"
        btn.BackgroundColor3 = Color3.new(1, 0, 0)
        stopVelLoop()
        local tweenBack = createTween(CFrame.new(lastPos))
        tweenBack:Play()
        tweenBack.Completed:Wait()
        workspace.FallenPartsDestroyHeight = -500
        resetCameraSubject()
        if workspace:FindFirstChild("Gaze") then
            workspace.Gaze:Destroy()
        end
    else
    lastPos = hrp.Position
    local part = Instance.new("Part")
        part.Size = Vector3.new(4, 1, 4)
        part.Position = lastPos
        part.Anchored = true
        part.CanCollide = false
        part.Transparency = 0.5
        part.Name = "Gaze"
        part.Parent = game.Workspace
        workspace.CurrentCamera.CameraSubject = part
        toggle = true
        btn.Text = "ON"
        btn.BackgroundColor3 = Color3.new(0, 1, 0)
        
        wait()
        workspace.FallenPartsDestroyHeight = -1000
        local tweenToTarget = createTween(CFrame.new(targetPos))
        tweenToTarget:Play()
        tweenToTarget.Completed:Wait()
        startVelLoop()
        
    end
end

btn.MouseButton1Click:Connect(toggleTween)
loadstring(game:HttpGet('https://raw.githubusercontent.com/bloxi123/Roblox-Scripts/refs/heads/main/antibang.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end

if game.Players.LocalPlayer.Name ~= owner then
setfpscap(cap)
-- VARIABLES
local ownerplayer = game.Players:FindFirstChild(owner)
local ownerchar = ownerplayer.Character
local ownerhm = ownerchar.Humanoid
local ownerhrp = ownerchar.HumanoidRootPart
local bot = game.Players.LocalPlayer
local botchar = bot.Character
local bothm = botchar.Humanoid
local bothrp = botchar.HumanoidRootPart
local orbiting = false
local repeating = nil
local mirroring = nil
local stacked = false
local spinning = false
local emoteLooping = false
local petting = nil
local dizzyEffect = false
local sleeping = false
local beingShy = false
local celebrating = false
local protecting = nil
local giant = nil
local wings = nil
-- LOCAL FUNCTIONS
-- Add this function near your other local functions
local function findPlayer(query)
    -- Special case for "me" - return the owner
    if query:lower() == "me" then
        for _, player in ipairs(game.Players:GetPlayers()) do
            if owners[player.Name] then
                return player
            end
        end
    end
    
    -- Normal player search
    query = query:lower()
    local matches = {}
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        -- Check both display name and username
        if player.DisplayName:lower():find(query) or player.Name:lower():find(query) then
            table.insert(matches, player)
        end
    end
    
    return matches[1] -- Return the first match found, or nil if no matches
end
local function chat(txt)
if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(txt,"All")
else
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(txt)
end
end
chat("Bloxi's Private Control Running")

-- Instead of just listening to owner's chat, listen to all players
game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg)
        -- Check if the player is whitelisted/owner
        if not owners[player.Name] then return end
        
        -- Your existing commands go here
        if msg:sub(1, #prefix + 6) == prefix.."rocket" then
            -- Update character references
            botchar = bot.Character
            bothm = botchar:WaitForChild("Humanoid")
            bothrp = botchar:WaitForChild("HumanoidRootPart")
            
            local height = tonumber(msg:sub(#prefix + 8))
            if height then
                chat("Target Height: " .. height .. " studs")
                task.wait(1)
                chat("Launching in 3")
                task.wait(1)
                chat("Launching in 2")
                task.wait(1)
                chat("Launching in 1")
                task.wait(1)
                chat("GO!!")
                
                -- Rocket launch logic
                local startPos = bothrp.Position.Y
                local targetPos = startPos + height
                
                -- Anchor the HumanoidRootPart
                bothrp.Anchored = false
                workspace.Gravity = 0
                -- Spin and rise
                while bothrp.Position.Y < targetPos and botchar and bothrp do
                    bothrp.CFrame = bothrp.CFrame + Vector3.new(0,2,0)
                    task.wait()
                end
                
                -- Reset character (this will automatically unanchor)
                bothm.Health = 0
                workspace.Gravity = 192
            end
        end

        if msg:sub(1, #prefix + 2) == prefix.."rs" then
            chat("Resetting...")
            -- Store current position before resetting
            local lastPosition = bothrp.CFrame
            bothm.Health = 0
            
            -- Wait for respawn and teleport back to stored position
            task.wait(game.Players.RespawnTime + 0.5)
            botchar = bot.Character or bot.CharacterAdded:Wait()
            bothm = botchar:WaitForChild("Humanoid")
            bothrp = botchar:WaitForChild("HumanoidRootPart")
            task.wait(0.1)
            bothrp.CFrame = lastPosition
        end

        if msg:sub(1, #prefix + 4) == prefix.."quit" then
        chat("Quitting script!")
        
        -- Clean up variables
        owner = nil
        bots = {}
        prefix = nil
     
        getgenv().Running = false

        script:Destroy()
        return
        end

        if msg:sub(1, #prefix + 4) == prefix.."test" then
            chat("Test success")
        end

        if msg:sub(1, #prefix + 2) == prefix.."rj" then
            chat("Rejoining...")
            local ts = game:GetService("TeleportService")
            local p = game:GetService("Players").LocalPlayer
            ts:Teleport(game.PlaceId, p)
        end

        if msg:sub(1, #prefix + 6) == prefix.."follow" then
            local targetName = msg:sub(#prefix + 8) -- Get the name after "!follow "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if following then
                chat("Already following someone! Use !unfollow first")
                return
            end
            
            following = true
            chat("Following " .. targetPlayer.DisplayName)
            
            task.spawn(function()
                while following and botchar and bothm do
                    -- Update character references
                    botchar = bot.Character
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    -- Move to target's position
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        bothm:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
                    end
                    task.wait(0.1)
                end
            end)
        end

        if msg:sub(1, #prefix + 8) == prefix.."unfollow" then
            if following then
                following = false
                chat("Following disabled")
            else
                chat("Not currently following anyone!")
            end
        end

        if msg:sub(1, #prefix + 6) == prefix.."moveto" then
            local targetName = msg:sub(#prefix + 8) -- Get the name after "!moveto "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            -- Update character references
            botchar = bot.Character
            bothm = botchar:WaitForChild("Humanoid")
            
            -- Move to target's position
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                chat("Moving to " .. targetPlayer.DisplayName)
                bothm:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
            end
        end

        if msg:sub(1, #prefix + 5) == prefix.."orbit" then
            local args = msg:sub(#prefix + 7):split(" ")
            local targetName = args[1]
            local speed = tonumber(args[2]) or 1
            local radius = tonumber(args[3]) or 5
            
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            -- Check if trying to orbit self
            if targetPlayer.Name == bot.Name then
                chat("Cannot orbit yourself!")
                return
            end
            
            if orbiting then
                chat("Already orbiting! Use !unorbit first")
                return
            end
            
            orbiting = true
            workspace.Gravity = 0  -- Set gravity to 0 while orbiting
            chat(string.format("Orbiting %s (Speed: %d, Radius: %d)", targetPlayer.DisplayName, speed, radius))
            
            local angle = 0
            task.spawn(function()
                while orbiting and botchar and bothrp do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Check if target still exists and has character
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetCFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                        
                        -- Calculate new position
                        local offset = CFrame.Angles(0, math.rad(angle), 0) * Vector3.new(radius, 0, 0)
                        local newPos = targetCFrame * CFrame.new(offset)
                        
                        -- Make bot face the target while orbiting
                        bothrp.CFrame = CFrame.new(newPos.Position, targetPlayer.Character.HumanoidRootPart.Position)
                        
                        -- Increment angle based on speed
                        angle = angle + speed
                        if angle >= 360 then angle = 0 end
                    end
                    task.wait()
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."unorbit" then
            if orbiting then
                orbiting = false
                workspace.Gravity = 192  -- Reset gravity to default
                chat("Stopped orbiting")
            else
                chat("Not currently orbiting anyone!")
            end
        end

        if msg:sub(1, #prefix + 6) == prefix.."lineup" then
            local args = msg:sub(#prefix + 8):split(" ")
            local targetName = args[1]
            local side = args[2] and args[2]:lower()
            
            if not side or not (side == "left" or side == "right" or side == "back" or side == "front") then
                chat("Usage: !lineup <player> <left/right/back/front>")
                return
            end
            
            local targetPlayer = findPlayer(targetName)
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            -- Get my number from the bots table
            local myNumber = bots[bot.Name] or 1
            
            -- Update character references
            botchar = bot.Character
            bothrp = botchar:WaitForChild("HumanoidRootPart")
            local targetHRP = targetPlayer.Character:WaitForChild("HumanoidRootPart")
            
            -- First: Match target's exact CFrame
            bothrp.CFrame = targetHRP.CFrame
            
            -- Second: Calculate offset based on target's orientation
            local rightVector = targetHRP.CFrame.RightVector
            local forwardVector = targetHRP.CFrame.LookVector
            
            local offset
            if side == "left" then
                offset = -rightVector * (2 + (myNumber * 4))  -- Negative right is left
            elseif side == "right" then
                offset = rightVector * (2 + (myNumber * 4))
            elseif side == "back" then
                offset = -forwardVector * (2 + (myNumber * 4))  -- Negative forward is back
            elseif side == "front" then
                offset = forwardVector * (2 + (myNumber * 4))
            end
            
            -- Apply offset while keeping orientation
            bothrp.CFrame = targetHRP.CFrame + offset
        end

        -- Add these new commands
        if msg:sub(1, #prefix + 3) == prefix.."wl+" then
            local targetName = msg:sub(#prefix + 5) -- Get name after "!wl+ "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if owners[targetPlayer.Name] then
                chat(targetPlayer.DisplayName .. " is already whitelisted!")
                return
            end
            
            owners[targetPlayer.Name] = true
            chat("Whitelisted " .. targetPlayer.DisplayName)
        end

        if msg:sub(1, #prefix + 3) == prefix.."wl-" then
            local targetName = msg:sub(#prefix + 5) -- Get name after "!wl- "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if targetPlayer.Name == "BloxiAstra" then  -- Protect original owner
                chat("Cannot unwhitelist the original owner!")
                return
            end
            
            if not owners[targetPlayer.Name] then
                chat(targetPlayer.DisplayName .. " is not whitelisted!")
                return
            end
            
            owners[targetPlayer.Name] = nil
            chat("Unwhitelisted " .. targetPlayer.DisplayName)
        end

        if msg:sub(1, #prefix + 4) == prefix.."goto" then
            local targetName = msg:sub(#prefix + 6) -- Get name after "!goto "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            -- Update character references
            botchar = bot.Character
            bothrp = botchar:WaitForChild("HumanoidRootPart")
            
            -- Teleport to target's position
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                chat("Teleporting to " .. targetPlayer.DisplayName)
                bothrp.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            end
        end

        if msg:sub(1, #prefix + 3) == prefix.."say" then
            local message = msg:sub(#prefix + 5) -- Get everything after "!say "
            
            if message == "" then
                chat("Usage: !say <message>")
                return
            end
            
            chat(message)
        end

        if msg:sub(1, #prefix + 6) == prefix.."repeat" then
            local targetName = msg:sub(#prefix + 8)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if repeating then
                chat("Already repeating someone! Use !unrepeat first")
                return
            end
            
            repeating = targetPlayer
            chat("Now repeating " .. targetPlayer.DisplayName)
            
            targetPlayer.Chatted:Connect(function(message)
                if repeating == targetPlayer then
                    chat(message)
                end
            end)
        end

        if msg:sub(1, #prefix + 8) == prefix.."unrepeat" then
            if not repeating then
                chat("Not currently repeating anyone!")
                return
            end
            
            chat("Stopped repeating " .. repeating.DisplayName)
            repeating = nil
        end

        if msg:sub(1, #prefix + 5) == prefix.."stack" then
            local targetName = msg:sub(#prefix + 7)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if stacked then
                chat("Already stacked! Use !unstack first")
                return
            end
            
            stacked = targetPlayer
            workspace.Gravity = 0 -- Zero gravity for stable stacking
            
            -- Calculate position in stack based on bot number
            local myPosition = bots[bot.Name] or 1
            local spacing = 4 -- Height between each bot
            
            -- Enable noclip
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            task.spawn(function()
                while stacked == targetPlayer do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Stack on top with offset based on position
                        local stackOffset = Vector3.new(0, spacing * (myPosition - 1), 0)
                        bothrp.CFrame = targetHRP.CFrame + stackOffset
                    end
                    task.wait()
                end
                
                -- Clean up
                if connection then
                    connection:Disconnect()
                end
            end)
        end
        
        if msg:sub(1, #prefix + 7) == prefix.."unstack" then
            if stacked then
                stacked = nil
                workspace.Gravity = 192 -- Restore normal gravity
                chat("Stack formation broken!")
            else
                chat("Not currently stacked!")
            end
        end

        if msg:sub(1, #prefix + 4) == prefix.."jump" then
            -- Update character references
            botchar = bot.Character
            bothm = botchar:WaitForChild("Humanoid")
            
            bothm.Jump = true
            chat("Jumped!")
        end

        if msg:sub(1, #prefix + 6) == prefix.."mirror" then
            local targetName = msg:sub(#prefix + 8)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if mirroring then
                chat("Already mirroring! Use !unmirror first")
                return
            end
            
            mirroring = targetPlayer
            chat("Mirroring " .. targetPlayer.DisplayName)
            
            -- Store animation tracks
            local runTrack = nil
            local walkTrack = nil
            local jumpTrack = nil
            local fallTrack = nil
            local idleTrack = nil
            
            task.spawn(function()
                while mirroring == targetPlayer do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    local animator = bothm:WaitForChild("Animator")
                    
                    if targetPlayer.Character then
                        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local targetHum = targetPlayer.Character:FindFirstChild("Humanoid")
                        local targetAnimate = targetPlayer.Character:FindFirstChild("Animate")
                        local botAnimate = botchar:FindFirstChild("Animate")
                        
                        if targetHRP and targetHum and targetAnimate and botAnimate then
                            -- Mirror position and movement
                            bothrp.CFrame = targetHRP.CFrame
                            
                            -- Mirror walking animation and movement
                            if targetHum.MoveDirection.Magnitude > 0 then
                                bothm:Move(targetHum.MoveDirection)
                                if bothm.WalkSpeed ~= targetHum.WalkSpeed then
                                    bothm.WalkSpeed = targetHum.WalkSpeed
                                end
                                
                                -- Load and play run/walk animations with adjusted speed
                                if targetHum.WalkSpeed > 6 then  -- Lowered threshold
                                    if not runTrack then
                                        runTrack = animator:LoadAnimation(botAnimate.run.RunAnim)
                                    end
                                    if not runTrack.IsPlaying then
                                        if walkTrack and walkTrack.IsPlaying then
                                            walkTrack:Stop()
                                        end
                                        runTrack:Play()
                                        runTrack:AdjustSpeed(1.25)  -- Speed up run animation
                                    end
                                else
                                    if not walkTrack then
                                        walkTrack = animator:LoadAnimation(botAnimate.walk.WalkAnim)
                                    end
                                    if not walkTrack.IsPlaying then
                                        if runTrack and runTrack.IsPlaying then
                                            runTrack:Stop()
                                        end
                                        walkTrack:Play()
                                        walkTrack:AdjustSpeed(1.25)  -- Speed up walk animation
                                    end
                                end
                            else
                                bothm:Move(Vector3.new(0, 0, 0))
                                -- Stop movement animations
                                if runTrack and runTrack.IsPlaying then
                                    runTrack:Stop()
                                end
                                if walkTrack and walkTrack.IsPlaying then
                                    walkTrack:Stop()
                                end
                            end
                            
                            -- Mirror states
                            if targetHum.Jump then
                                bothm.Jump = true
                            end
                            
                            -- Mirror humanoid states
                            if targetHum:GetState() ~= bothm:GetState() then
                                -- Common states to mirror
                                if targetHum:GetState() == Enum.HumanoidStateType.Jumping then
                                    bothm.Jump = true
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Climbing then
                                    bothm.Jump = true
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Seated then
                                    bothm.Sit = true
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Swimming then
                                    bothm:ChangeState(Enum.HumanoidStateType.Swimming)
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Running then
                                    bothm:Move(targetHum.MoveDirection)
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Ragdoll then
                                    bothm:ChangeState(Enum.HumanoidStateType.Ragdoll)
                                end
                            end
                        end
                    end
                    task.wait()
                end
                
                -- Clean up animations when stopping
                if runTrack then runTrack:Stop() end
                if walkTrack then walkTrack:Stop() end
                if jumpTrack then jumpTrack:Stop() end
                if fallTrack then fallTrack:Stop() end
                if idleTrack then idleTrack:Stop() end
            end)
        end

        if msg:sub(1, #prefix + 8) == prefix.."unmirror" then
            if not mirroring then
                chat("Not currently mirroring anyone!")
                return
            end
            
            chat("Stopped mirroring " .. mirroring.DisplayName)
            mirroring = nil
        end

        if msg:sub(1, #prefix + 9) == prefix.."formation" then
            local formation = msg:sub(#prefix + 11):lower()
            local validFormations = {
                ["circle"] = true,
                ["line"] = true,
                ["triangle"] = true,
                ["square"] = true
            }
            
            if not validFormations[formation] then
                chat("Invalid formation! Use: circle, line, triangle, or square")
                return
            end
            
            -- Get all bots
            local bots = {}
            for _, player in ipairs(game.Players:GetPlayers()) do
                if table.find(bots, player.Name) then
                    table.insert(bots, player)
                end
            end
            
            -- Update character references
            botchar = bot.Character
            bothrp = botchar:WaitForChild("HumanoidRootPart")
            
            local spacing = 5
            local centerPos = bothrp.Position
            
            if formation == "circle" then
                local angle = 360 / #bots
                for i, bot in ipairs(bots) do
                    local rad = math.rad(angle * i)
                    local offset = Vector3.new(math.cos(rad) * spacing, 0, math.sin(rad) * spacing)
                    bot.Character.HumanoidRootPart.CFrame = CFrame.new(centerPos + offset)
                end
            elseif formation == "line" then
                for i, bot in ipairs(bots) do
                    bot.Character.HumanoidRootPart.CFrame = CFrame.new(centerPos + Vector3.new(spacing * i, 0, 0))
                end
            elseif formation == "triangle" then
                local positions = {
                    Vector3.new(0, 0, 0),
                    Vector3.new(spacing, 0, spacing),
                    Vector3.new(-spacing, 0, spacing)
                }
                for i, bot in ipairs(bots) do
                    if positions[i] then
                        bot.Character.HumanoidRootPart.CFrame = CFrame.new(centerPos + positions[i])
                    end
                end
            elseif formation == "square" then
                local positions = {
                    Vector3.new(-spacing, 0, -spacing),
                    Vector3.new(spacing, 0, -spacing),
                    Vector3.new(-spacing, 0, spacing),
                    Vector3.new(spacing, 0, spacing)
                }
                for i, bot in ipairs(bots) do
                    if positions[i] then
                        bot.Character.HumanoidRootPart.CFrame = CFrame.new(centerPos + positions[i])
                    end
                end
            end
            
            chat("Formed " .. formation .. " formation!")
        end

        if msg:sub(1, #prefix + 5) == prefix.."dance" then
            local danceType = msg:sub(#prefix + 7):lower()
            local validDances = {
                ["1"] = "dance",
                ["2"] = "dance2",
                ["3"] = "dance3",
                ["cheer"] = "cheer",
                ["laugh"] = "laugh",
                ["point"] = "point",
                ["wave"] = "wave"
            }
            
            if not validDances[danceType] then
                chat("Invalid dance! Use: 1, 2, 3, cheer, laugh, point, or wave")
                return
            end
            
            -- Update character references
            botchar = bot.Character
            
            botchar.Animate.PlayEmote:Invoke(validDances[danceType])
            chat("Dancing: " .. validDances[danceType])
        end

        if msg:sub(1, #prefix + 4) == prefix.."cmds" then
            if bots[bot.Name] == 1 then  -- Only bot number 1 sends the command list
                chat("=== BLOXIS CONTROLLER COMMANDS ===")
                task.wait(0.05)
                chat("BASIC: test, rs, rj, quit, wl+ [player], wl- [player]")
                task.wait(0.05)
                chat("MOVEMENT: follow [player], unfollow, moveto [player], goto [player]")
                task.wait(0.05)
                chat("FORMATIONS: lineup [player] [side], circle [player], protect [player]")
                task.wait(0.05)
                chat("ATTACKS: attack [player] [duration], circleattack [player] [duration], spnattack [player] [duration]")
                task.wait(0.05)
                chat("FUN: wave [duration], pyramid, followtrain [duration], scatter [duration]")
                task.wait(0.05)
                chat("EMOTES: dance [1/2/3], trick [roll/beg/backflip], playdead")
            end
        end

        if msg:sub(1, #prefix + 6) == prefix.."circle" then
            local targetName = msg:sub(#prefix + 8)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if orbiting then
                chat("Already circling! Use !unorbit first")
                return
            end
            
            orbiting = true
            workspace.Gravity = 0  -- Set gravity to 0
            chat("Surrounding " .. targetPlayer.DisplayName)
            
            local angle = 0
            local radius = 5  -- Fixed radius for surrounding
            task.spawn(function()
                while orbiting and botchar and bothrp do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Check if target still exists and has character
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetCFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                        
                        -- Calculate new position
                        local offset = CFrame.Angles(0, math.rad(angle), 0) * Vector3.new(radius, 0, 0)
                        local newPos = targetCFrame * CFrame.new(offset)
                        
                        -- Make bot face the target while circling
                        bothrp.CFrame = CFrame.new(newPos.Position, targetPlayer.Character.HumanoidRootPart.Position)
                        
                        -- Increment angle
                        angle = angle + 2  -- Slower rotation
                        if angle >= 360 then angle = 0 end
                    end
                    task.wait()
                end
                workspace.Gravity = 192  -- Reset gravity
            end)
        end

        if msg:sub(1, #prefix + 4) == prefix.."spin" then
            local speed = tonumber(msg:sub(#prefix + 6)) or 10
            
            if spinning then
                chat("Already spinning! Wait for it to finish")
                return
            end
            
            spinning = true
            chat("Spinning at speed: " .. speed)
            
            local angle = 0
            task.spawn(function()
                while spinning and angle < 360 * 2 do  -- 2 full rotations
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Spin in place
                    local currentPos = bothrp.Position
                    bothrp.CFrame = CFrame.new(currentPos) * CFrame.Angles(0, math.rad(angle), 0)
                    
                    -- Increment angle based on speed
                    angle = angle + speed
                    task.wait()
                end
                spinning = false
            end)
        end

        if msg:sub(1, #prefix + 9) == prefix.."emoteloop" then
            local emotes = {"dance", "dance2", "dance3", "cheer", "laugh", "point", "wave"}
            local currentEmote = 1
            
            if emoteLooping then
                chat("Already looping emotes! Use !unemote to stop")
                return
            end
            
            emoteLooping = true
            chat("Starting emote loop!")
            
            task.spawn(function()
                while emoteLooping do
                    -- Update character references
                    botchar = bot.Character
                    
                    -- Play current emote
                    botchar.Animate.PlayEmote:Invoke(emotes[currentEmote])
                    chat("Emote: " .. emotes[currentEmote])
                    
                    -- Move to next emote
                    currentEmote = currentEmote + 1
                    if currentEmote > #emotes then
                        currentEmote = 1
                    end
                    
                    task.wait(4)  -- Wait between emotes
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."copyall" then
            local targetName = msg:sub(#prefix + 9)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if copying then
                chat("Already copying someone! Use !uncopy first")
                return
            end
            
            copying = targetPlayer
            chat("Copying everything from " .. targetPlayer.DisplayName)
            
            -- Connect to chat events
            local chatConnection = targetPlayer.Chatted:Connect(function(message)
                if copying == targetPlayer then
                    chat(message)
                end
            end)
            
            task.spawn(function()
                while copying == targetPlayer do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    if targetPlayer.Character then
                        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local targetHum = targetPlayer.Character:FindFirstChild("Humanoid")
                        
                        if targetHRP and targetHum then
                            -- Copy position and movement
                            bothrp.CFrame = targetHRP.CFrame
                            bothm:Move(targetHum.MoveDirection)
                            
                            -- Copy animations and states
                            if targetHum.Jump then
                                bothm.Jump = true
                            end
                            
                            -- Copy emotes (if playing)
                            if targetPlayer.Character:FindFirstChild("Animate") then
                                for _, track in ipairs(targetHum:GetPlayingAnimationTracks()) do
                                    if track.Animation and track.Animation.AnimationId then
                                        bothm:LoadAnimation(track.Animation):Play()
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
                
                -- Clean up
                if chatConnection then
                    chatConnection:Disconnect()
                end
            end)
        end

        -- Stop commands
        if msg:sub(1, #prefix + 7) == prefix.."unemote" then
            if emoteLooping then
                emoteLooping = false
                chat("Stopped emote loop")
            else
                chat("Not currently looping emotes!")
            end
        end

        if msg:sub(1, #prefix + 7) == prefix.."uncopy" then
            if copying then
                chat("Stopped copying " .. copying.DisplayName)
                copying = nil
            else
                chat("Not currently copying anyone!")
            end
        end

        -- Pet command with tween formations
        if msg:sub(1, #prefix + 3) == prefix.."pet" then
            local targetName = msg:sub(#prefix + 5)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if petting then
                chat("Already being a pet! Use !unpet first")
                return
            end
            
            petting = targetPlayer
            chat("Following " .. targetPlayer.DisplayName .. " like a pet!")
            
            -- Enable noclip and zero gravity
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                            part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end)
            
            task.spawn(function()
                while petting == targetPlayer do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    if targetPlayer.Character then
                        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if targetHRP then
                            -- Calculate row and column based on bot number
                            local row = math.floor((bots[bot.Name] - 1) / 3)
                            local col = (bots[bot.Name] - 1) % 3
                            
                            -- Get target's orientation vectors
                            local rightVector = targetHRP.CFrame.RightVector
                            local forwardVector = targetHRP.CFrame.LookVector
                            
                            -- Calculate offset based on row and column
                            local offset
                            if col == 0 then
                                offset = -rightVector * 5  -- Left side
                            elseif col == 1 then
                                offset = Vector3.new(0, 0, 0)  -- Center
                            elseif col == 2 then
                                offset = rightVector * 5  -- Right side
                            end
                            
                            -- Add row offset (behind target)
                            offset = offset - (forwardVector * (5 + (row * 4)))
                            
                            -- Add height offset
                            offset = offset + Vector3.new(0, 3, 0)
                            
                            -- Create tween to move smoothly
                            local targetPos = targetHRP.CFrame + offset
                            local tweenInfo = TweenInfo.new(
                                0.5,  -- Time
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                            
                            local tween = game:GetService("TweenService"):Create(
                                bothrp,
                                tweenInfo,
                                {CFrame = targetPos}
                            )
                            tween:Play()
                            
                            -- Make bot face the target
                            bothrp.CFrame = CFrame.new(bothrp.Position, targetHRP.Position)
                        end
                    end
                    task.wait(0.1)
                end
                
                -- Clean up connection when stopped
                if connection then
                    connection:Disconnect()
                end
                
                -- Reset parts when stopped
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                            part.AssemblyLinearVelocity = Vector3.new(0, -196.2, 0)  -- Reset gravity
                        end
                    end
                end
            end)
        end

        if msg:sub(1, #prefix + 5) == prefix.."dizzy" then
            if dizzyEffect then
                chat("Already dizzy!")
                return
            end
            
            dizzyEffect = true
            chat("Getting dizzy...")
            
            task.spawn(function()
                local angle = 0
                while dizzyEffect do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    -- Stumble in a wobbly circle
                    local radius = math.sin(angle/2) * 2
                    local wobbleX = math.cos(angle) * radius
                    local wobbleZ = math.sin(angle) * radius
                    
                    -- Move in wobbly pattern
                    local currentPos = bothrp.Position
                    bothrp.CFrame = CFrame.new(currentPos + Vector3.new(wobbleX, 0, wobbleZ)) 
                        * CFrame.Angles(0, math.rad(angle), math.rad(math.sin(angle/4) * 15))
                    
                    angle = angle + 5
                    task.wait()
                end
            end)
            
            -- Auto-stop after 10 seconds
            task.delay(10, function()
                dizzyEffect = false
                chat("Not dizzy anymore!")
            end)
        end

        if msg:sub(1, #prefix + 5) == prefix.."sleep" then
            if sleeping then
                chat("Already sleeping!")
                return
            end
            
            sleeping = true
            chat("Getting sleepy... zZz")
            
            -- Update character references
            botchar = bot.Character
            bothm = botchar:WaitForChild("Humanoid")
            
            -- Lay down
            bothm.Sit = true
            task.wait(0.5)
            
            -- Play sleep animation if available
            if botchar:FindFirstChild("Animate") then
                botchar.Animate.PlayEmote:Invoke("sleep")
            end
            
            -- Add "zZz" chat every few seconds
            task.spawn(function()
                while sleeping do
                    chat("zZz...")
                    task.wait(5)
                end
            end)
        end

        if msg:sub(1, #prefix + 3) == prefix.."shy" then
            if beingShy then
                chat("Already being shy!")
                return
            end
            
            beingShy = true
            chat("*acts shy*")
            
            -- Update character references
            botchar = bot.Character
            bothm = botchar:WaitForChild("Humanoid")
            
            task.spawn(function()
                while beingShy do
                    -- Play shy animation or emote
                    if botchar:FindFirstChild("Animate") then
                        botchar.Animate.PlayEmote:Invoke("wave")
                        task.wait(2)
                        botchar.Animate.PlayEmote:Invoke("point")
                    end
                    
                    -- Look down and shuffle
                    bothm.MoveDirection = Vector3.new(math.random(-1, 1), 0, math.random(-1, 1))
                    task.wait(3)
                end
            end)
            
            -- Auto-stop after 15 seconds
            task.delay(15, function()
                beingShy = false
                chat("*feels better now*")
            end)
        end

        if msg:sub(1, #prefix + 9) == prefix.."celebrate" then
            if celebrating then
                chat("Already celebrating!")
                return
            end
            
            celebrating = true
            chat("Time to celebrate! 🎉")
            
            task.spawn(function()
                while celebrating do
                    -- Update character references
                    botchar = bot.Character
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    -- Random jumps
                    if math.random(1, 3) == 1 then
                        bothm.Jump = true
                    end
                    
                    -- Cycle through happy emotes
                    if botchar:FindFirstChild("Animate") then
                        local celebrationEmotes = {"dance", "dance2", "dance3", "cheer", "wave"}
                        local randomEmote = celebrationEmotes[math.random(1, #celebrationEmotes)]
                        botchar.Animate.PlayEmote:Invoke(randomEmote)
                    end
                    
                    task.wait(2)
                end
            end)
            
            -- Auto-stop after 20 seconds
            task.delay(20, function()
                celebrating = false
                chat("What a great celebration! 🎊")
            end)
        end

        -- Stop commands
        if msg:sub(1, #prefix + 5) == prefix.."unpet" then
            if petting then
                chat("Stopped being a pet!")
                petting = nil
            else
                chat("Not currently being a pet!")
            end
        end

        if msg:sub(1, #prefix + 7) == prefix.."undizzy" then
            dizzyEffect = false
            chat("Stopped being dizzy!")
        end

        if msg:sub(1, #prefix + 7) == prefix.."unsleep" then
            if sleeping then
                sleeping = false
                chat("Waking up!")
            else
                chat("Not currently sleeping!")
            end
        end

        if msg:sub(1, #prefix + 5) == prefix.."unshy" then
            beingShy = false
            chat("Feeling confident now!")
        end

        if msg:sub(1, #prefix + 11) == prefix.."uncelebrate" then
            celebrating = false
            chat("Celebration ended! 🎊")
        end

        if msg:sub(1, #prefix + 6) == prefix.."attack" then
            local args = msg:sub(#prefix + 8):split(" ")
            local targetName = args[1]
            local duration = tonumber(args[2]) or 10
            
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if targetPlayer.Name == bot.Name then
                chat("Cannot attack yourself!")
                return
            end
            
            chat("Attacking " .. targetPlayer.DisplayName .. " for " .. duration .. " seconds!")
            
            -- Enable noclip during attack
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            -- Store original gravity
            local originalGravity = workspace.Gravity
            workspace.Gravity = 0
            
            task.spawn(function()
                local startTime = tick()
                local lastMessageTime = 0
                while (tick() - startTime) < duration do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Random offset calculations
                        local angle = math.random() * math.pi * 2
                        local radius = math.random(3, 8)
                        local height = math.random(-2, 4)
                        
                        -- Calculate new position
                        local offset = Vector3.new(
                            math.cos(angle) * radius,
                            height,
                            math.sin(angle) * radius
                        )
                        
                        -- Move to position
                        local targetPos = targetHRP.Position + offset
                        bothrp.CFrame = CFrame.new(targetPos, targetHRP.Position)
                        
                        -- Random attack animations
                        if botchar:FindFirstChild("Animate") and math.random(1, 5) == 1 then
                            local attacks = {"punch", "point"}
                            botchar.Animate.PlayEmote:Invoke(attacks[math.random(1, #attacks)])
                        end
                        
                        -- Chat messages with 2.5 second delay
                        local currentTime = tick()
                        if currentTime - lastMessageTime > 2.5 and math.random(1, 25) == 1 then
                            local messages = {
                                "Attack!",
                                "Get them!",
                                "Charge!",
                                "No escape!",
                                "*aggressive noises*"
                            }
                            chat(messages[math.random(1, #messages)])
                            lastMessageTime = currentTime
                        end
                        
                        task.wait(0.1)
                    end
                end
                
                -- Clean up
                if connection then
                    connection:Disconnect()
                end
                workspace.Gravity = originalGravity
                
                -- Reset parts collision
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
                
                chat("Attack finished!")
            end)
        end

        if msg:sub(1, #prefix + 11) == prefix.."circleattack" then
            local args = msg:sub(#prefix + 13):split(" ")
            local targetName = args[1]
            local duration = tonumber(args[2]) or 10
            local radius = tonumber(args[3]) or 5
            
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            chat("Circle attacking " .. targetPlayer.DisplayName .. " for " .. duration .. " seconds!")
            
            -- Enable noclip
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            local angle = (bots[bot.Name] or 1) * 120 -- Spread bots evenly
            
            task.spawn(function()
                local startTime = tick()
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Calculate position in circle
                        local offset = CFrame.Angles(0, math.rad(angle), 0) * Vector3.new(radius, math.random(-1, 3), 0)
                        local newPos = targetHRP.CFrame * CFrame.new(offset)
                        
                        -- Move and face target
                        bothrp.CFrame = CFrame.new(newPos.Position, targetHRP.Position)
                        
                        -- Random attack animations
                        if botchar:FindFirstChild("Animate") and math.random(1, 5) == 1 then
                            local attacks = {"punch", "point"}
                            botchar.Animate.PlayEmote:Invoke(attacks[math.random(1, #attacks)])
                        end
                        
                        angle = angle + 5 -- Rotate around target
                    end
                    task.wait(0.1)
                end
                
                if connection then
                    connection:Disconnect()
                end
                chat("Circle attack finished!")
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."protect" then
            local targetName = msg:sub(#prefix + 9)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if protecting then
                chat("Already protecting someone! Use !unprotect first")
                return
            end
            
            protecting = targetPlayer
            chat("Protecting " .. targetPlayer.DisplayName)
            
            -- Calculate position based on bot number
            local botCount = 0
            for _ in pairs(bots) do botCount = botCount + 1 end
            local angle = (bots[bot.Name] or 1) * (360 / botCount)
            
            task.spawn(function()
                while protecting == targetPlayer do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Calculate position in protective circle
                        local rad = math.rad(angle)
                        local offset = Vector3.new(math.cos(rad) * 5, 0, math.sin(rad) * 5)
                        bothrp.CFrame = CFrame.new(targetHRP.Position + offset, targetHRP.Position)
                        
                        -- Look outward for threats
                        angle = angle + 1
                    end
                    task.wait(0.1)
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."scatter" then
            local duration = tonumber(msg:sub(#prefix + 9)) or 5
            
            chat("Scattering for " .. duration .. " seconds!")
            
            task.spawn(function()
                local startTime = tick()
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    -- Random direction and distance
                    local angle = math.random() * math.pi * 2
                    local distance = math.random(10, 20)
                    local targetPos = bothrp.Position + Vector3.new(
                        math.cos(angle) * distance,
                        0,
                        math.sin(angle) * distance
                    )
                    
                    -- Move to random position
                    bothm:MoveTo(targetPos)
                    
                    if math.random(1, 3) == 1 then
                        chat("Aaah!")
                    end
                    
                    task.wait(1)
                end
                chat("Scatter finished!")
            end)
        end

        if msg:sub(1, #prefix + 8) == prefix.."spnattack" then
            local args = msg:sub(#prefix + 10):split(" ")
            local targetName = args[1]
            local duration = tonumber(args[2]) or 10
            
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            chat("Spin attacking " .. targetPlayer.DisplayName .. " for " .. duration .. " seconds!")
            
            task.spawn(function()
                local startTime = tick()
                local spinAngle = 0
                
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Calculate spinning position
                        local offset = CFrame.Angles(0, math.rad(spinAngle), 0) * Vector3.new(5, 0, 0)
                        local targetPos = targetHRP.Position + offset
                        
                        -- Move and spin
                        bothrp.CFrame = CFrame.new(targetPos) * CFrame.Angles(0, math.rad(spinAngle), 0)
                        
                        spinAngle = spinAngle + 10
                        
                        if botchar:FindFirstChild("Animate") and math.random(1, 5) == 1 then
                            botchar.Animate.PlayEmote:Invoke("point")
                        end
                    end
                    task.wait(0.1)
                end
                chat("Spin attack finished!")
            end)
        end

        if msg:sub(1, #prefix + 10) == prefix.."followtrain" then
            local duration = tonumber(msg:sub(#prefix + 12)) or 15
            
            -- Calculate position in train based on bot number
            local myPosition = bots[bot.Name] or 1
            local spacing = 3
            
            task.spawn(function()
                local startTime = tick()
                local angle = 0
                
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Follow in a wavy line
                    local basePos = game.Players[owner].Character.HumanoidRootPart.Position
                    local offset = Vector3.new(
                        math.sin(angle + (myPosition * 0.5)) * 2,
                        0,
                        -spacing * myPosition
                    )
                    
                    -- Move to position
                    bothrp.CFrame = CFrame.new(basePos + offset)
                    
                    -- Wave effect
                    angle = angle + 0.1
                    
                    task.wait()
                end
            end)
        end

        if msg:sub(1, #prefix + 4) == prefix.."wave" then
            local duration = tonumber(msg:sub(#prefix + 6)) or 10
            
            task.spawn(function()
                local startTime = tick()
                local myPosition = bots[bot.Name] or 1
                
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Create wave effect based on position
                    local basePos = game.Players[owner].Character.HumanoidRootPart.Position
                    local waveOffset = math.sin(tick() * 2 + (myPosition * 0.5)) * 2
                    
                    local offset = Vector3.new(
                        myPosition * 3,  -- Space bots horizontally
                        waveOffset,      -- Up/down wave motion
                        0
                    )
                    
                    bothrp.CFrame = CFrame.new(basePos + offset)
                    task.wait()
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."pyramid" then
            -- Calculate position in pyramid based on bot number
            local myPosition = bots[bot.Name] or 1
            local spacing = 4
            local level = math.floor((myPosition-1) / 3)  -- Determine which level of pyramid
            local posInLevel = (myPosition-1) % 3         -- Position within that level
            
            task.spawn(function()
                botchar = bot.Character
                bothrp = botchar:WaitForChild("HumanoidRootPart")
                
                local basePos = game.Players[owner].Character.HumanoidRootPart.Position
                local offset = Vector3.new(
                    (posInLevel * spacing) - spacing,  -- Horizontal position
                    level * spacing,                   -- Vertical position (height)
                    -level * spacing                   -- Depth (moving back as we go up)
                )
                
                -- Move to pyramid position
                bothrp.CFrame = CFrame.new(basePos + offset)
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."tornado" then
            local duration = tonumber(msg:sub(#prefix + 9)) or 10
            
            task.spawn(function()
                local startTime = tick()
                local myPosition = bots[bot.Name] or 1
                local angle = myPosition * 45
                local height = 0
                
                -- Enable noclip
                local connection
                connection = game:GetService("RunService").Stepped:Connect(function()
                    if botchar then
                        for _, part in ipairs(botchar:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
                
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Calculate tornado position
                    local basePos = game.Players[owner].Character.HumanoidRootPart.Position
                    local radius = 3 + (height/3)
                    
                    local offset = Vector3.new(
                        math.cos(math.rad(angle)) * radius,
                        height,
                        math.sin(math.rad(angle)) * radius
                    )
                    
                    -- Move to position with spin
                    bothrp.CFrame = CFrame.new(basePos + offset) * CFrame.Angles(0, math.rad(angle * 2), 0)
                    
                    -- Update tornado
                    angle = angle + 15
                    height = height + 0.2
                    
                    if height > 15 then height = 0 end
                    
                    task.wait()
                end
                
                if connection then connection:Disconnect() end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."explode" then
            local power = tonumber(msg:sub(#prefix + 9)) or 50
            
            task.spawn(function()
                workspace.Gravity = 0 -- Zero gravity for better explosion control
                
                botchar = bot.Character
                bothrp = botchar:WaitForChild("HumanoidRootPart")
                
                -- Calculate explosion direction based on bot number
                local myPosition = bots[bot.Name] or 1
                local totalBots = 0
                for _ in pairs(bots) do totalBots = totalBots + 1 end
                local angle = (myPosition * (360/totalBots))
                
                -- Launch bot
                local force = Vector3.new(
                    math.cos(math.rad(angle)) * power,
                    power/2,
                    math.sin(math.rad(angle)) * power
                )
                
                bothrp.Velocity = force
                
                -- Reset gravity after a delay
                task.wait(3)
                workspace.Gravity = 192
            end)
        end

        if msg:sub(1, #prefix + 10) == prefix.."linefollow" then
            local targetName = msg:sub(#prefix + 12) -- Get name after "!linefollow "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Target player not found!")
                return
            end
            
            if lineFollowing then
                chat("Already in line formation! Use !unlinefollow first")
                return
            end
            
            -- Get my number and determine who to follow
            local myNumber = bots[bot.Name] or 1
            local followTarget
            
            if myNumber == 1 then
                -- Bot 1 follows target player
                followTarget = targetPlayer
                chat("Following " .. targetPlayer.DisplayName)
            else
                -- Other bots follow the bot before them
                for botName, botNumber in pairs(bots) do
                    if botNumber == (myNumber - 1) then
                        followTarget = game.Players:FindFirstChild(botName)
                        chat("Following " .. botName)
                        break
                    end
                end
            end
            
            if not followTarget then
                chat("Could not find target to follow!")
                return
            end
            
            -- Start following in line
            lineFollowing = followTarget
            local spacing = 4 -- Distance between bots
            
            task.spawn(function()
                while lineFollowing == followTarget do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    if followTarget.Character and followTarget.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = followTarget.Character.HumanoidRootPart
                        
                        -- Calculate position behind target
                        local behindPosition = targetHRP.Position - (targetHRP.CFrame.LookVector * spacing)
                        
                        -- Move to position
                        bothm:MoveTo(behindPosition)
                        
                        -- Make bot face the same direction as target
                        bothrp.CFrame = CFrame.new(bothrp.Position, 
                            bothrp.Position + targetHRP.CFrame.LookVector)
                    end
                    task.wait(0.1)
                end
            end)
        end
        
        if msg:sub(1, #prefix + 12) == prefix.."unlinefollow" then
            if not lineFollowing then
                chat("Not currently in line formation!")
                return
            end
            
            local targetName = lineFollowing.Name
            lineFollowing = nil
            chat("Stopped line following " .. targetName)
        end
        
        if msg:sub(1, #prefix + 9) == prefix.."clearchat" then
            local TextChatService = game:GetService("TextChatService")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            
            local function chatMessage(str)
                str = tostring(str)
                if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                    TextChatService.TextChannels.RBXGeneral:SendAsync(str)
                else
                    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
                end
            end
        
            local blob = "\u{000D}"
            chatMessage(".".. blob .. blob .. " ".. blob .." ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. "Bloxi's Private Control")
        end
        
       
        
        if msg:sub(1, #prefix + 5) == prefix.."giant" then
            local targetName = msg:sub(#prefix + 7)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if giant then
                chat("Already in giant formation! Use !ungiant first")
                return
            end
            
            -- Body part mappings with R6/R15 support
            local bodyParts = {
                [1] = { -- Head
                    offset = Vector3.new(0, 5, 0),
                    r15part = "Head",
                    r6part = "Head"
                },
                [2] = { -- Torso/UpperTorso
                    offset = Vector3.new(0, 0, 0),
                    r15part = "UpperTorso",
                    r6part = "Torso"
                },
                [3] = { -- Left Arm
                    offset = Vector3.new(5, 0, 0), -- 5 studs out from torso
                    r15part = "LeftHand",
                    r6part = "Left Arm"
                },
                [4] = { -- Right Arm
                    offset = Vector3.new(-5, 0, 0), -- 5 studs out from torso
                    r15part = "RightHand",
                    r6part = "Right Arm"
                },
                [5] = { -- Left Leg
                    offset = Vector3.new(2, -5, 0),
                    r15part = "LeftFoot",
                    r6part = "Left Leg"
                },
                [6] = { -- Right Leg
                    offset = Vector3.new(-2, -5, 0),
                    r15part = "RightUpperLeg",
                    r6part = "Right Leg"
                }
            }
            
            local myPosition = bots[bot.Name] or 1
            local myPart = bodyParts[myPosition]
            
            if not myPart then return end
            
            giant = targetPlayer
            workspace.Gravity = 0
            
            -- Enable noclip and platformstand
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    local humanoid = botchar:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.PlatformStand = true
                    end
                    
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            task.spawn(function()
                while giant == targetPlayer do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character then
                        local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        -- Check for R6 or R15 part
                        local targetPart = targetPlayer.Character:FindFirstChild(myPart.r15part) or 
                                         targetPlayer.Character:FindFirstChild(myPart.r6part)
                        
                        if targetRoot and targetPart then
                            -- Get the relative offset from target's root to the part
                            local relativeOffset = targetRoot.CFrame:ToObjectSpace(targetPart.CFrame)
                            
                            -- Base position 6 studs up and 10 studs left of player
                            local basePosition = targetRoot.Position + 
                                (targetRoot.CFrame.RightVector * -10) + 
                                Vector3.new(0, 6, 0)
                            
                            -- Create the base CFrame for the giant
                            local baseCFrame = CFrame.new(basePosition) * targetRoot.CFrame.Rotation
                            
                            -- Apply the same relative movement as the target's part
                            local finalPos = baseCFrame * relativeOffset
                            
                            -- Add the fixed offset for the giant formation
                            finalPos = finalPos * CFrame.new(
                                myPart.offset.X,
                                myPart.offset.Y,
                                myPart.offset.Z
                            )
                            
                            -- Move to position
                            bothrp.CFrame = finalPos
                        end
                    end
                    task.wait()
                end
                
                -- Clean up
                if connection then
                    connection:Disconnect()
                end
                
                -- Disable platformstand when done
                if botchar and botchar:FindFirstChild("Humanoid") then
                    botchar.Humanoid.PlatformStand = false
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."ungiant" then
            if giant then
                giant = nil
                workspace.Gravity = 192
                
                -- Disable platformstand
                if botchar and botchar:FindFirstChild("Humanoid") then
                    botchar.Humanoid.PlatformStand = false
                end
            else
                chat("Not in giant formation!")
            end
        end
        if msg:sub(1, #prefix + 5) == prefix.."wings" then
            local targetName = msg:sub(#prefix + 7)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if wings then
                chat("Already in wings formation! Use !unwings first")
                return
            end
            
            -- Get wing position based on bot number (1-6)
            local myPosition = bots[bot.Name] or 1
            if myPosition > 6 then
                chat("Not needed for wings formation")
                return
            end
            
            wings = targetPlayer
            workspace.Gravity = 0
            
            -- Enable noclip
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            task.spawn(function()
                local isLeftWing = myPosition <= 3
                local wingPos = isLeftWing and myPosition or (myPosition - 3)
                
                while wings == targetPlayer do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Use universal time for synchronized flapping
                        local flapAngle = math.sin(tick() * 0.8) -- Slower flapping speed
                        
                        -- Base wing position calculations
                        local side = isLeftWing and 1 or -1
                        local baseOffset = Vector3.new(
                            side * (1.5 + wingPos * 1.5), -- Horizontal spread
                            4 + flapAngle * 1.5 + wingPos, -- Higher position + flap movement
                            4 - (wingPos * 1.5) -- Much more behind target
                        )
                        
                        -- Rotate offset based on target's orientation
                        local rotatedOffset = targetHRP.CFrame:VectorToWorldSpace(baseOffset)
                        local targetPos = targetHRP.Position + rotatedOffset
                        
                        -- Calculate wing angle based on flap position
                        local wingTilt = math.rad(20 * flapAngle) -- Wing tilt for flapping
                        local targetRot = targetHRP.CFrame.Rotation
                            * CFrame.Angles(wingTilt, 0, side * math.rad(20))
                        
                        -- Move to position with rotation
                        bothrp.CFrame = CFrame.new(targetPos) * targetRot
                    end
                    task.wait()
                end
                
                if connection then
                    connection:Disconnect()
                end
            end)
        end
        if msg:sub(1, #prefix + 7) == prefix.."unwings" then
            if wings then
                wings = nil
                workspace.Gravity = 192
                chat("Wings formation broken!")
            else
                chat("Not in wings formation!")
            end
        end
    end)
end)

-- Also connect for players already in game
for _, player in ipairs(game.Players:GetPlayers()) do
    player.Chatted:Connect(function(msg)
        -- Check if the player is whitelisted/owner
        if not owners[player.Name] then return end
        
        -- Your existing commands go here

        if msg:sub(1, #prefix + 2) == prefix.."rs" then
            chat("Resetting...")
            -- Store current position before resetting
            local lastPosition = bothrp.CFrame
            bothm.Health = 0
            
            -- Wait for respawn and teleport back to stored position
            task.wait(game.Players.RespawnTime + 0.5)
            botchar = bot.Character or bot.CharacterAdded:Wait()
            bothm = botchar:WaitForChild("Humanoid")
            bothrp = botchar:WaitForChild("HumanoidRootPart")
            task.wait(0.1)
            bothrp.CFrame = lastPosition
        end

        if msg:sub(1, #prefix + 4) == prefix.."quit" then
        chat("Quitting script!")
        
        -- Clean up variables
        owner = nil
        bots = {}
        prefix = nil
     
        getgenv().Running = false

        script:Destroy()
        return
        end

        if msg:sub(1, #prefix + 4) == prefix.."test" then
            chat("Test success")
        end

        if msg:sub(1, #prefix + 2) == prefix.."rj" then
            chat("Rejoining...")
            local ts = game:GetService("TeleportService")
            local p = game:GetService("Players").LocalPlayer
            ts:Teleport(game.PlaceId, p)
        end

        if msg:sub(1, #prefix + 6) == prefix.."follow" then
            local targetName = msg:sub(#prefix + 8) -- Get the name after "!follow "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if following then
                chat("Already following someone! Use !unfollow first")
                return
            end
            
            following = true
            chat("Following " .. targetPlayer.DisplayName)
            
            task.spawn(function()
                while following and botchar and bothm do
                    -- Update character references
                    botchar = bot.Character
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    -- Move to target's position
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        bothm:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
                    end
                    task.wait(0.1)
                end
            end)
        end

        if msg:sub(1, #prefix + 8) == prefix.."unfollow" then
            if following then
                following = false
                chat("Following disabled")
            else
                chat("Not currently following anyone!")
            end
        end

        if msg:sub(1, #prefix + 6) == prefix.."moveto" then
            local targetName = msg:sub(#prefix + 8) -- Get the name after "!moveto "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            -- Update character references
            botchar = bot.Character
            bothm = botchar:WaitForChild("Humanoid")
            
            -- Move to target's position
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                chat("Moving to " .. targetPlayer.DisplayName)
                bothm:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
            end
        end

        if msg:sub(1, #prefix + 5) == prefix.."orbit" then
            local args = msg:sub(#prefix + 7):split(" ")
            local targetName = args[1]
            local speed = tonumber(args[2]) or 1
            local radius = tonumber(args[3]) or 5
            
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            -- Check if trying to orbit self
            if targetPlayer.Name == bot.Name then
                chat("Cannot orbit yourself!")
                return
            end
            
            if orbiting then
                chat("Already orbiting! Use !unorbit first")
                return
            end
            
            orbiting = true
            workspace.Gravity = 0  -- Set gravity to 0 while orbiting
            chat(string.format("Orbiting %s (Speed: %d, Radius: %d)", targetPlayer.DisplayName, speed, radius))
            
            local angle = 0
            task.spawn(function()
                while orbiting and botchar and bothrp do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Check if target still exists and has character
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetCFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                        
                        -- Calculate new position
                        local offset = CFrame.Angles(0, math.rad(angle), 0) * Vector3.new(radius, 0, 0)
                        local newPos = targetCFrame * CFrame.new(offset)
                        
                        -- Make bot face the target while orbiting
                        bothrp.CFrame = CFrame.new(newPos.Position, targetPlayer.Character.HumanoidRootPart.Position)
                        
                        -- Increment angle based on speed
                        angle = angle + speed
                        if angle >= 360 then angle = 0 end
                    end
                    task.wait()
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."unorbit" then
            if orbiting then
                orbiting = false
                workspace.Gravity = 192  -- Reset gravity to default
                chat("Stopped orbiting")
            else
                chat("Not currently orbiting anyone!")
            end
        end

        if msg:sub(1, #prefix + 6) == prefix.."lineup" then
            local args = msg:sub(#prefix + 8):split(" ")
            local targetName = args[1]
            local side = args[2] and args[2]:lower()
            
            if not side or not (side == "left" or side == "right" or side == "back" or side == "front") then
                chat("Usage: !lineup <player> <left/right/back/front>")
                return
            end
            
            local targetPlayer = findPlayer(targetName)
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            -- Get my number from the bots table
            local myNumber = bots[bot.Name] or 1
            
            -- Update character references
            botchar = bot.Character
            bothrp = botchar:WaitForChild("HumanoidRootPart")
            local targetHRP = targetPlayer.Character:WaitForChild("HumanoidRootPart")
            
            -- First: Match target's exact CFrame
            bothrp.CFrame = targetHRP.CFrame
            
            -- Second: Calculate offset based on target's orientation
            local rightVector = targetHRP.CFrame.RightVector
            local forwardVector = targetHRP.CFrame.LookVector
            
            local offset
            if side == "left" then
                offset = -rightVector * (2 + (myNumber * 4))  -- Negative right is left
            elseif side == "right" then
                offset = rightVector * (2 + (myNumber * 4))
            elseif side == "back" then
                offset = -forwardVector * (2 + (myNumber * 4))  -- Negative forward is back
            elseif side == "front" then
                offset = forwardVector * (2 + (myNumber * 4))
            end
            
            -- Apply offset while keeping orientation
            bothrp.CFrame = targetHRP.CFrame + offset
        end

        -- Add these new commands
        if msg:sub(1, #prefix + 3) == prefix.."wl+" then
            local targetName = msg:sub(#prefix + 5) -- Get name after "!wl+ "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if owners[targetPlayer.Name] then
                chat(targetPlayer.DisplayName .. " is already whitelisted!")
                return
            end
            
            owners[targetPlayer.Name] = true
            chat("Whitelisted " .. targetPlayer.DisplayName)
        end

        if msg:sub(1, #prefix + 3) == prefix.."wl-" then
            local targetName = msg:sub(#prefix + 5) -- Get name after "!wl- "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if targetPlayer.Name == "BloxiAstra" then  -- Protect original owner
                chat("Cannot unwhitelist the original owner!")
                return
            end
            
            if not owners[targetPlayer.Name] then
                chat(targetPlayer.DisplayName .. " is not whitelisted!")
                return
            end
            
            owners[targetPlayer.Name] = nil
            chat("Unwhitelisted " .. targetPlayer.DisplayName)
        end

        if msg:sub(1, #prefix + 4) == prefix.."goto" then
            local targetName = msg:sub(#prefix + 6) -- Get name after "!goto "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            -- Update character references
            botchar = bot.Character
            bothrp = botchar:WaitForChild("HumanoidRootPart")
            
            -- Teleport to target's position
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                chat("Teleporting to " .. targetPlayer.DisplayName)
                bothrp.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            end
        end

        if msg:sub(1, #prefix + 3) == prefix.."say" then
            local message = msg:sub(#prefix + 5) -- Get everything after "!say "
            
            if message == "" then
                chat("Usage: !say <message>")
                return
            end
            
            chat(message)
        end

        if msg:sub(1, #prefix + 6) == prefix.."repeat" then
            local targetName = msg:sub(#prefix + 8)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if repeating then
                chat("Already repeating someone! Use !unrepeat first")
                return
            end
            
            repeating = targetPlayer
            chat("Now repeating " .. targetPlayer.DisplayName)
            
            targetPlayer.Chatted:Connect(function(message)
                if repeating == targetPlayer then
                    chat(message)
                end
            end)
        end

        if msg:sub(1, #prefix + 8) == prefix.."unrepeat" then
            if not repeating then
                chat("Not currently repeating anyone!")
                return
            end
            
            chat("Stopped repeating " .. repeating.DisplayName)
            repeating = nil
        end

        if msg:sub(1, #prefix + 5) == prefix.."stack" then
            local targetName = msg:sub(#prefix + 7)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if stacked then
                chat("Already stacked! Use !unstack first")
                return
            end
            
            stacked = targetPlayer
            workspace.Gravity = 0 -- Zero gravity for stable stacking
            
            -- Calculate position in stack based on bot number
            local myPosition = bots[bot.Name] or 1
            local spacing = 4 -- Height between each bot
            
            -- Enable noclip
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            task.spawn(function()
                while stacked == targetPlayer do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Stack on top with offset based on position
                        local stackOffset = Vector3.new(0, spacing * (myPosition - 1), 0)
                        bothrp.CFrame = targetHRP.CFrame + stackOffset
                    end
                    task.wait()
                end
                
                -- Clean up
                if connection then
                    connection:Disconnect()
                end
            end)
        end
        
        if msg:sub(1, #prefix + 7) == prefix.."unstack" then
            if stacked then
                stacked = nil
                workspace.Gravity = 192 -- Restore normal gravity
                chat("Stack formation broken!")
            else
                chat("Not currently stacked!")
            end
        end

        if msg:sub(1, #prefix + 4) == prefix.."jump" then
            -- Update character references
            botchar = bot.Character
            bothm = botchar:WaitForChild("Humanoid")
            
            bothm.Jump = true
            chat("Jumped!")
        end

        if msg:sub(1, #prefix + 6) == prefix.."mirror" then
            local targetName = msg:sub(#prefix + 8)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if mirroring then
                chat("Already mirroring! Use !unmirror first")
                return
            end
            
            mirroring = targetPlayer
            chat("Mirroring " .. targetPlayer.DisplayName)
            
            -- Store animation tracks
            local runTrack = nil
            local walkTrack = nil
            local jumpTrack = nil
            local fallTrack = nil
            local idleTrack = nil
            
            task.spawn(function()
                while mirroring == targetPlayer do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    local animator = bothm:WaitForChild("Animator")
                    
                    if targetPlayer.Character then
                        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local targetHum = targetPlayer.Character:FindFirstChild("Humanoid")
                        local targetAnimate = targetPlayer.Character:FindFirstChild("Animate")
                        local botAnimate = botchar:FindFirstChild("Animate")
                        
                        if targetHRP and targetHum and targetAnimate and botAnimate then
                            -- Mirror position and movement
                            bothrp.CFrame = targetHRP.CFrame
                            
                            -- Mirror walking animation and movement
                            if targetHum.MoveDirection.Magnitude > 0 then
                                bothm:Move(targetHum.MoveDirection)
                                if bothm.WalkSpeed ~= targetHum.WalkSpeed then
                                    bothm.WalkSpeed = targetHum.WalkSpeed
                                end
                                
                                -- Load and play run/walk animations with adjusted speed
                                if targetHum.WalkSpeed > 6 then  -- Lowered threshold
                                    if not runTrack then
                                        runTrack = animator:LoadAnimation(botAnimate.run.RunAnim)
                                    end
                                    if not runTrack.IsPlaying then
                                        if walkTrack and walkTrack.IsPlaying then
                                            walkTrack:Stop()
                                        end
                                        runTrack:Play()
                                        runTrack:AdjustSpeed(1.25)  -- Speed up run animation
                                    end
                                else
                                    if not walkTrack then
                                        walkTrack = animator:LoadAnimation(botAnimate.walk.WalkAnim)
                                    end
                                    if not walkTrack.IsPlaying then
                                        if runTrack and runTrack.IsPlaying then
                                            runTrack:Stop()
                                        end
                                        walkTrack:Play()
                                        walkTrack:AdjustSpeed(1.25)  -- Speed up walk animation
                                    end
                                end
                            else
                                bothm:Move(Vector3.new(0, 0, 0))
                                -- Stop movement animations
                                if runTrack and runTrack.IsPlaying then
                                    runTrack:Stop()
                                end
                                if walkTrack and walkTrack.IsPlaying then
                                    walkTrack:Stop()
                                end
                            end
                            
                            -- Mirror states
                            if targetHum.Jump then
                                bothm.Jump = true
                            end
                            
                            -- Mirror humanoid states
                            if targetHum:GetState() ~= bothm:GetState() then
                                -- Common states to mirror
                                if targetHum:GetState() == Enum.HumanoidStateType.Jumping then
                                    bothm.Jump = true
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Climbing then
                                    bothm.Jump = true
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Seated then
                                    bothm.Sit = true
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Swimming then
                                    bothm:ChangeState(Enum.HumanoidStateType.Swimming)
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Running then
                                    bothm:Move(targetHum.MoveDirection)
                                elseif targetHum:GetState() == Enum.HumanoidStateType.Ragdoll then
                                    bothm:ChangeState(Enum.HumanoidStateType.Ragdoll)
                                end
                            end
                        end
                    end
                    task.wait()
                end
                
                -- Clean up animations when stopping
                if runTrack then runTrack:Stop() end
                if walkTrack then walkTrack:Stop() end
                if jumpTrack then jumpTrack:Stop() end
                if fallTrack then fallTrack:Stop() end
                if idleTrack then idleTrack:Stop() end
            end)
        end

        if msg:sub(1, #prefix + 8) == prefix.."unmirror" then
            if not mirroring then
                chat("Not currently mirroring anyone!")
                return
            end
            
            chat("Stopped mirroring " .. mirroring.DisplayName)
            mirroring = nil
        end

        if msg:sub(1, #prefix + 9) == prefix.."formation" then
            local formation = msg:sub(#prefix + 11):lower()
            local validFormations = {
                ["circle"] = true,
                ["line"] = true,
                ["triangle"] = true,
                ["square"] = true
            }
            
            if not validFormations[formation] then
                chat("Invalid formation! Use: circle, line, triangle, or square")
                return
            end
            
            -- Get all bots
            local bots = {}
            for _, player in ipairs(game.Players:GetPlayers()) do
                if table.find(bots, player.Name) then
                    table.insert(bots, player)
                end
            end
            
            -- Update character references
            botchar = bot.Character
            bothrp = botchar:WaitForChild("HumanoidRootPart")
            
            local spacing = 5
            local centerPos = bothrp.Position
            
            if formation == "circle" then
                local angle = 360 / #bots
                for i, bot in ipairs(bots) do
                    local rad = math.rad(angle * i)
                    local offset = Vector3.new(math.cos(rad) * spacing, 0, math.sin(rad) * spacing)
                    bot.Character.HumanoidRootPart.CFrame = CFrame.new(centerPos + offset)
                end
            elseif formation == "line" then
                for i, bot in ipairs(bots) do
                    bot.Character.HumanoidRootPart.CFrame = CFrame.new(centerPos + Vector3.new(spacing * i, 0, 0))
                end
            elseif formation == "triangle" then
                local positions = {
                    Vector3.new(0, 0, 0),
                    Vector3.new(spacing, 0, spacing),
                    Vector3.new(-spacing, 0, spacing)
                }
                for i, bot in ipairs(bots) do
                    if positions[i] then
                        bot.Character.HumanoidRootPart.CFrame = CFrame.new(centerPos + positions[i])
                    end
                end
            elseif formation == "square" then
                local positions = {
                    Vector3.new(-spacing, 0, -spacing),
                    Vector3.new(spacing, 0, -spacing),
                    Vector3.new(-spacing, 0, spacing),
                    Vector3.new(spacing, 0, spacing)
                }
                for i, bot in ipairs(bots) do
                    if positions[i] then
                        bot.Character.HumanoidRootPart.CFrame = CFrame.new(centerPos + positions[i])
                    end
                end
            end
            
            chat("Formed " .. formation .. " formation!")
        end

        if msg:sub(1, #prefix + 5) == prefix.."dance" then
            local danceType = msg:sub(#prefix + 7):lower()
            local validDances = {
                ["1"] = "dance",
                ["2"] = "dance2",
                ["3"] = "dance3",
                ["cheer"] = "cheer",
                ["laugh"] = "laugh",
                ["point"] = "point",
                ["wave"] = "wave"
            }
            
            if not validDances[danceType] then
                chat("Invalid dance! Use: 1, 2, 3, cheer, laugh, point, or wave")
                return
            end
            
            -- Update character references
            botchar = bot.Character
            
            botchar.Animate.PlayEmote:Invoke(validDances[danceType])
            chat("Dancing: " .. validDances[danceType])
        end

        if msg:sub(1, #prefix + 4) == prefix.."cmds" then
            if bots[bot.Name] == 1 then  -- Only bot number 1 sends the command list
                chat("=== BLOXIS CONTROLLER COMMANDS ===")
                task.wait(0.05)
                chat("BASIC: test, rs, rj, quit, wl+ [player], wl- [player]")
                task.wait(0.05)
                chat("MOVEMENT: follow [player], unfollow, moveto [player], goto [player]")
                task.wait(0.05)
                chat("FORMATIONS: lineup [player] [side], circle [player], protect [player]")
                task.wait(0.05)
                chat("ATTACKS: attack [player] [duration], circleattack [player] [duration], spnattack [player] [duration]")
                task.wait(0.05)
                chat("FUN: wave [duration], pyramid, followtrain [duration], scatter [duration]")
                task.wait(0.05)
                chat("EMOTES: dance [1/2/3], trick [roll/beg/backflip], playdead")
            end
        end

        if msg:sub(1, #prefix + 6) == prefix.."circle" then
            local targetName = msg:sub(#prefix + 8)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if orbiting then
                chat("Already circling! Use !unorbit first")
                return
            end
            
            orbiting = true
            workspace.Gravity = 0  -- Set gravity to 0
            chat("Surrounding " .. targetPlayer.DisplayName)
            
            local angle = 0
            local radius = 5  -- Fixed radius for surrounding
            task.spawn(function()
                while orbiting and botchar and bothrp do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Check if target still exists and has character
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetCFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                        
                        -- Calculate new position
                        local offset = CFrame.Angles(0, math.rad(angle), 0) * Vector3.new(radius, 0, 0)
                        local newPos = targetCFrame * CFrame.new(offset)
                        
                        -- Make bot face the target while circling
                        bothrp.CFrame = CFrame.new(newPos.Position, targetPlayer.Character.HumanoidRootPart.Position)
                        
                        -- Increment angle
                        angle = angle + 2  -- Slower rotation
                        if angle >= 360 then angle = 0 end
                    end
                    task.wait()
                end
                workspace.Gravity = 192  -- Reset gravity
            end)
        end

        if msg:sub(1, #prefix + 4) == prefix.."spin" then
            local speed = tonumber(msg:sub(#prefix + 6)) or 10
            
            if spinning then
                chat("Already spinning! Wait for it to finish")
                return
            end
            
            spinning = true
            chat("Spinning at speed: " .. speed)
            
            local angle = 0
            task.spawn(function()
                while spinning and angle < 360 * 2 do  -- 2 full rotations
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Spin in place
                    local currentPos = bothrp.Position
                    bothrp.CFrame = CFrame.new(currentPos) * CFrame.Angles(0, math.rad(angle), 0)
                    
                    -- Increment angle based on speed
                    angle = angle + speed
                    task.wait()
                end
                spinning = false
            end)
        end

        if msg:sub(1, #prefix + 9) == prefix.."emoteloop" then
            local emotes = {"dance", "dance2", "dance3", "cheer", "laugh", "point", "wave"}
            local currentEmote = 1
            
            if emoteLooping then
                chat("Already looping emotes! Use !unemote to stop")
                return
            end
            
            emoteLooping = true
            chat("Starting emote loop!")
            
            task.spawn(function()
                while emoteLooping do
                    -- Update character references
                    botchar = bot.Character
                    
                    -- Play current emote
                    botchar.Animate.PlayEmote:Invoke(emotes[currentEmote])
                    chat("Emote: " .. emotes[currentEmote])
                    
                    -- Move to next emote
                    currentEmote = currentEmote + 1
                    if currentEmote > #emotes then
                        currentEmote = 1
                    end
                    
                    task.wait(4)  -- Wait between emotes
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."copyall" then
            local targetName = msg:sub(#prefix + 9)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if copying then
                chat("Already copying someone! Use !uncopy first")
                return
            end
            
            copying = targetPlayer
            chat("Copying everything from " .. targetPlayer.DisplayName)
            
            -- Connect to chat events
            local chatConnection = targetPlayer.Chatted:Connect(function(message)
                if copying == targetPlayer then
                    chat(message)
                end
            end)
            
            task.spawn(function()
                while copying == targetPlayer do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    if targetPlayer.Character then
                        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local targetHum = targetPlayer.Character:FindFirstChild("Humanoid")
                        
                        if targetHRP and targetHum then
                            -- Copy position and movement
                            bothrp.CFrame = targetHRP.CFrame
                            bothm:Move(targetHum.MoveDirection)
                            
                            -- Copy animations and states
                            if targetHum.Jump then
                                bothm.Jump = true
                            end
                            
                            -- Copy emotes (if playing)
                            if targetPlayer.Character:FindFirstChild("Animate") then
                                for _, track in ipairs(targetHum:GetPlayingAnimationTracks()) do
                                    if track.Animation and track.Animation.AnimationId then
                                        bothm:LoadAnimation(track.Animation):Play()
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
                
                -- Clean up
                if chatConnection then
                    chatConnection:Disconnect()
                end
            end)
        end

        -- Stop commands
        if msg:sub(1, #prefix + 7) == prefix.."unemote" then
            if emoteLooping then
                emoteLooping = false
                chat("Stopped emote loop")
            else
                chat("Not currently looping emotes!")
            end
        end

        if msg:sub(1, #prefix + 7) == prefix.."uncopy" then
            if copying then
                chat("Stopped copying " .. copying.DisplayName)
                copying = nil
            else
                chat("Not currently copying anyone!")
            end
        end

        -- Pet command with tween formations
        if msg:sub(1, #prefix + 3) == prefix.."pet" then
            local targetName = msg:sub(#prefix + 5)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if petting then
                chat("Already being a pet! Use !unpet first")
                return
            end
            
            petting = targetPlayer
            chat("Following " .. targetPlayer.DisplayName .. " like a pet!")
            
            -- Enable noclip and zero gravity
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                            part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end)
            
            task.spawn(function()
                while petting == targetPlayer do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    if targetPlayer.Character then
                        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if targetHRP then
                            -- Calculate row and column based on bot number
                            local row = math.floor((bots[bot.Name] - 1) / 3)
                            local col = (bots[bot.Name] - 1) % 3
                            
                            -- Get target's orientation vectors
                            local rightVector = targetHRP.CFrame.RightVector
                            local forwardVector = targetHRP.CFrame.LookVector
                            
                            -- Calculate offset based on row and column
                            local offset
                            if col == 0 then
                                offset = -rightVector * 5  -- Left side
                            elseif col == 1 then
                                offset = Vector3.new(0, 0, 0)  -- Center
                            elseif col == 2 then
                                offset = rightVector * 5  -- Right side
                            end
                            
                            -- Add row offset (behind target)
                            offset = offset - (forwardVector * (5 + (row * 4)))
                            
                            -- Add height offset
                            offset = offset + Vector3.new(0, 3, 0)
                            
                            -- Create tween to move smoothly
                            local targetPos = targetHRP.CFrame + offset
                            local tweenInfo = TweenInfo.new(
                                0.5,  -- Time
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                            
                            local tween = game:GetService("TweenService"):Create(
                                bothrp,
                                tweenInfo,
                                {CFrame = targetPos}
                            )
                            tween:Play()
                            
                            -- Make bot face the target
                            bothrp.CFrame = CFrame.new(bothrp.Position, targetHRP.Position)
                        end
                    end
                    task.wait(0.1)
                end
                
                -- Clean up connection when stopped
                if connection then
                    connection:Disconnect()
                end
                
                -- Reset parts when stopped
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                            part.AssemblyLinearVelocity = Vector3.new(0, -196.2, 0)  -- Reset gravity
                        end
                    end
                end
            end)
        end

        if msg:sub(1, #prefix + 5) == prefix.."dizzy" then
            if dizzyEffect then
                chat("Already dizzy!")
                return
            end
            
            dizzyEffect = true
            chat("Getting dizzy...")
            
            task.spawn(function()
                local angle = 0
                while dizzyEffect do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    -- Stumble in a wobbly circle
                    local radius = math.sin(angle/2) * 2
                    local wobbleX = math.cos(angle) * radius
                    local wobbleZ = math.sin(angle) * radius
                    
                    -- Move in wobbly pattern
                    local currentPos = bothrp.Position
                    bothrp.CFrame = CFrame.new(currentPos + Vector3.new(wobbleX, 0, wobbleZ)) 
                        * CFrame.Angles(0, math.rad(angle), math.rad(math.sin(angle/4) * 15))
                    
                    angle = angle + 5
                    task.wait()
                end
            end)
            
            -- Auto-stop after 10 seconds
            task.delay(10, function()
                dizzyEffect = false
                chat("Not dizzy anymore!")
            end)
        end

        if msg:sub(1, #prefix + 5) == prefix.."sleep" then
            if sleeping then
                chat("Already sleeping!")
                return
            end
            
            sleeping = true
            chat("Getting sleepy... zZz")
            
            -- Update character references
            botchar = bot.Character
            bothm = botchar:WaitForChild("Humanoid")
            
            -- Lay down
            bothm.Sit = true
            task.wait(0.5)
            
            -- Play sleep animation if available
            if botchar:FindFirstChild("Animate") then
                botchar.Animate.PlayEmote:Invoke("sleep")
            end
            
            -- Add "zZz" chat every few seconds
            task.spawn(function()
                while sleeping do
                    chat("zZz...")
                    task.wait(5)
                end
            end)
        end

        if msg:sub(1, #prefix + 3) == prefix.."shy" then
            if beingShy then
                chat("Already being shy!")
                return
            end
            
            beingShy = true
            chat("*acts shy*")
            
            -- Update character references
            botchar = bot.Character
            bothm = botchar:WaitForChild("Humanoid")
            
            task.spawn(function()
                while beingShy do
                    -- Play shy animation or emote
                    if botchar:FindFirstChild("Animate") then
                        botchar.Animate.PlayEmote:Invoke("wave")
                        task.wait(2)
                        botchar.Animate.PlayEmote:Invoke("point")
                    end
                    
                    -- Look down and shuffle
                    bothm.MoveDirection = Vector3.new(math.random(-1, 1), 0, math.random(-1, 1))
                    task.wait(3)
                end
            end)
            
            -- Auto-stop after 15 seconds
            task.delay(15, function()
                beingShy = false
                chat("*feels better now*")
            end)
        end

        if msg:sub(1, #prefix + 9) == prefix.."celebrate" then
            if celebrating then
                chat("Already celebrating!")
                return
            end
            
            celebrating = true
            chat("Time to celebrate! 🎉")
            
            task.spawn(function()
                while celebrating do
                    -- Update character references
                    botchar = bot.Character
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    -- Random jumps
                    if math.random(1, 3) == 1 then
                        bothm.Jump = true
                    end
                    
                    -- Cycle through happy emotes
                    if botchar:FindFirstChild("Animate") then
                        local celebrationEmotes = {"dance", "dance2", "dance3", "cheer", "wave"}
                        local randomEmote = celebrationEmotes[math.random(1, #celebrationEmotes)]
                        botchar.Animate.PlayEmote:Invoke(randomEmote)
                    end
                    
                    task.wait(2)
                end
            end)
            
            -- Auto-stop after 20 seconds
            task.delay(20, function()
                celebrating = false
                chat("What a great celebration! 🎊")
            end)
        end

        -- Stop commands
        if msg:sub(1, #prefix + 5) == prefix.."unpet" then
            if petting then
                chat("Stopped being a pet!")
                petting = nil
            else
                chat("Not currently being a pet!")
            end
        end

        if msg:sub(1, #prefix + 7) == prefix.."undizzy" then
            dizzyEffect = false
            chat("Stopped being dizzy!")
        end

        if msg:sub(1, #prefix + 7) == prefix.."unsleep" then
            if sleeping then
                sleeping = false
                chat("Waking up!")
            else
                chat("Not currently sleeping!")
            end
        end

        if msg:sub(1, #prefix + 5) == prefix.."unshy" then
            beingShy = false
            chat("Feeling confident now!")
        end

        if msg:sub(1, #prefix + 11) == prefix.."uncelebrate" then
            celebrating = false
            chat("Celebration ended! 🎊")
        end

        if msg:sub(1, #prefix + 6) == prefix.."attack" then
            local args = msg:sub(#prefix + 8):split(" ")
            local targetName = args[1]
            local duration = tonumber(args[2]) or 10
            
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if targetPlayer.Name == bot.Name then
                chat("Cannot attack yourself!")
                return
            end
            
            chat("Attacking " .. targetPlayer.DisplayName .. " for " .. duration .. " seconds!")
            
            -- Enable noclip during attack
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            -- Store original gravity
            local originalGravity = workspace.Gravity
            workspace.Gravity = 0
            
            task.spawn(function()
                local startTime = tick()
                local lastMessageTime = 0
                while (tick() - startTime) < duration do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Random offset calculations
                        local angle = math.random() * math.pi * 2
                        local radius = math.random(3, 8)
                        local height = math.random(-2, 4)
                        
                        -- Calculate new position
                        local offset = Vector3.new(
                            math.cos(angle) * radius,
                            height,
                            math.sin(angle) * radius
                        )
                        
                        -- Move to position
                        local targetPos = targetHRP.Position + offset
                        bothrp.CFrame = CFrame.new(targetPos, targetHRP.Position)
                        
                        -- Random attack animations
                        if botchar:FindFirstChild("Animate") and math.random(1, 5) == 1 then
                            local attacks = {"punch", "point"}
                            botchar.Animate.PlayEmote:Invoke(attacks[math.random(1, #attacks)])
                        end
                        
                        -- Chat messages with 2.5 second delay
                        local currentTime = tick()
                        if currentTime - lastMessageTime > 2.5 and math.random(1, 25) == 1 then
                            local messages = {
                                "Attack!",
                                "Get them!",
                                "Charge!",
                                "No escape!",
                                "*aggressive noises*"
                            }
                            chat(messages[math.random(1, #messages)])
                            lastMessageTime = currentTime
                        end
                        
                        task.wait(0.1)
                    end
                end
                
                -- Clean up
                if connection then
                    connection:Disconnect()
                end
                workspace.Gravity = originalGravity
                
                -- Reset parts collision
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
                
                chat("Attack finished!")
            end)
        end

        if msg:sub(1, #prefix + 11) == prefix.."circleattack" then
            local args = msg:sub(#prefix + 13):split(" ")
            local targetName = args[1]
            local duration = tonumber(args[2]) or 10
            local radius = tonumber(args[3]) or 5
            
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            chat("Circle attacking " .. targetPlayer.DisplayName .. " for " .. duration .. " seconds!")
            
            -- Enable noclip
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            local angle = (bots[bot.Name] or 1) * 120 -- Spread bots evenly
            
            task.spawn(function()
                local startTime = tick()
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Calculate position in circle
                        local offset = CFrame.Angles(0, math.rad(angle), 0) * Vector3.new(radius, math.random(-1, 3), 0)
                        local newPos = targetHRP.CFrame * CFrame.new(offset)
                        
                        -- Move and face target
                        bothrp.CFrame = CFrame.new(newPos.Position, targetHRP.Position)
                        
                        -- Random attack animations
                        if botchar:FindFirstChild("Animate") and math.random(1, 5) == 1 then
                            local attacks = {"punch", "point"}
                            botchar.Animate.PlayEmote:Invoke(attacks[math.random(1, #attacks)])
                        end
                        
                        angle = angle + 5 -- Rotate around target
                    end
                    task.wait(0.1)
                end
                
                if connection then
                    connection:Disconnect()
                end
                chat("Circle attack finished!")
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."protect" then
            local targetName = msg:sub(#prefix + 9)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if protecting then
                chat("Already protecting someone! Use !unprotect first")
                return
            end
            
            protecting = targetPlayer
            chat("Protecting " .. targetPlayer.DisplayName)
            
            -- Calculate position based on bot number
            local botCount = 0
            for _ in pairs(bots) do botCount = botCount + 1 end
            local angle = (bots[bot.Name] or 1) * (360 / botCount)
            
            task.spawn(function()
                while protecting == targetPlayer do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Calculate position in protective circle
                        local rad = math.rad(angle)
                        local offset = Vector3.new(math.cos(rad) * 5, 0, math.sin(rad) * 5)
                        bothrp.CFrame = CFrame.new(targetHRP.Position + offset, targetHRP.Position)
                        
                        -- Look outward for threats
                        angle = angle + 1
                    end
                    task.wait(0.1)
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."scatter" then
            local duration = tonumber(msg:sub(#prefix + 9)) or 5
            
            chat("Scattering for " .. duration .. " seconds!")
            
            task.spawn(function()
                local startTime = tick()
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    -- Random direction and distance
                    local angle = math.random() * math.pi * 2
                    local distance = math.random(10, 20)
                    local targetPos = bothrp.Position + Vector3.new(
                        math.cos(angle) * distance,
                        0,
                        math.sin(angle) * distance
                    )
                    
                    -- Move to random position
                    bothm:MoveTo(targetPos)
                    
                    if math.random(1, 3) == 1 then
                        chat("Aaah!")
                    end
                    
                    task.wait(1)
                end
                chat("Scatter finished!")
            end)
        end

        if msg:sub(1, #prefix + 8) == prefix.."spnattack" then
            local args = msg:sub(#prefix + 10):split(" ")
            local targetName = args[1]
            local duration = tonumber(args[2]) or 10
            
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            chat("Spin attacking " .. targetPlayer.DisplayName .. " for " .. duration .. " seconds!")
            
            task.spawn(function()
                local startTime = tick()
                local spinAngle = 0
                
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Calculate spinning position
                        local offset = CFrame.Angles(0, math.rad(spinAngle), 0) * Vector3.new(5, 0, 0)
                        local targetPos = targetHRP.Position + offset
                        
                        -- Move and spin
                        bothrp.CFrame = CFrame.new(targetPos) * CFrame.Angles(0, math.rad(spinAngle), 0)
                        
                        spinAngle = spinAngle + 10
                        
                        if botchar:FindFirstChild("Animate") and math.random(1, 5) == 1 then
                            botchar.Animate.PlayEmote:Invoke("point")
                        end
                    end
                    task.wait(0.1)
                end
                chat("Spin attack finished!")
            end)
        end

        if msg:sub(1, #prefix + 10) == prefix.."followtrain" then
            local duration = tonumber(msg:sub(#prefix + 12)) or 15
            
            -- Calculate position in train based on bot number
            local myPosition = bots[bot.Name] or 1
            local spacing = 3
            
            task.spawn(function()
                local startTime = tick()
                local angle = 0
                
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Follow in a wavy line
                    local basePos = game.Players[owner].Character.HumanoidRootPart.Position
                    local offset = Vector3.new(
                        math.sin(angle + (myPosition * 0.5)) * 2,
                        0,
                        -spacing * myPosition
                    )
                    
                    -- Move to position
                    bothrp.CFrame = CFrame.new(basePos + offset)
                    
                    -- Wave effect
                    angle = angle + 0.1
                    
                    task.wait()
                end
            end)
        end

        if msg:sub(1, #prefix + 4) == prefix.."wave" then
            local duration = tonumber(msg:sub(#prefix + 6)) or 10
            
            task.spawn(function()
                local startTime = tick()
                local myPosition = bots[bot.Name] or 1
                
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Create wave effect based on position
                    local basePos = game.Players[owner].Character.HumanoidRootPart.Position
                    local waveOffset = math.sin(tick() * 2 + (myPosition * 0.5)) * 2
                    
                    local offset = Vector3.new(
                        myPosition * 3,  -- Space bots horizontally
                        waveOffset,      -- Up/down wave motion
                        0
                    )
                    
                    bothrp.CFrame = CFrame.new(basePos + offset)
                    task.wait()
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."pyramid" then
            -- Calculate position in pyramid based on bot number
            local myPosition = bots[bot.Name] or 1
            local spacing = 4
            local level = math.floor((myPosition-1) / 3)  -- Determine which level of pyramid
            local posInLevel = (myPosition-1) % 3         -- Position within that level
            
            task.spawn(function()
                botchar = bot.Character
                bothrp = botchar:WaitForChild("HumanoidRootPart")
                
                local basePos = game.Players[owner].Character.HumanoidRootPart.Position
                local offset = Vector3.new(
                    (posInLevel * spacing) - spacing,  -- Horizontal position
                    level * spacing,                   -- Vertical position (height)
                    -level * spacing                   -- Depth (moving back as we go up)
                )
                
                -- Move to pyramid position
                bothrp.CFrame = CFrame.new(basePos + offset)
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."tornado" then
            local duration = tonumber(msg:sub(#prefix + 9)) or 10
            
            task.spawn(function()
                local startTime = tick()
                local myPosition = bots[bot.Name] or 1
                local angle = myPosition * 45
                local height = 0
                
                -- Enable noclip
                local connection
                connection = game:GetService("RunService").Stepped:Connect(function()
                    if botchar then
                        for _, part in ipairs(botchar:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
                
                while (tick() - startTime) < duration do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    -- Calculate tornado position
                    local basePos = game.Players[owner].Character.HumanoidRootPart.Position
                    local radius = 3 + (height/3)
                    
                    local offset = Vector3.new(
                        math.cos(math.rad(angle)) * radius,
                        height,
                        math.sin(math.rad(angle)) * radius
                    )
                    
                    -- Move to position with spin
                    bothrp.CFrame = CFrame.new(basePos + offset) * CFrame.Angles(0, math.rad(angle * 2), 0)
                    
                    -- Update tornado
                    angle = angle + 15
                    height = height + 0.2
                    
                    if height > 15 then height = 0 end
                    
                    task.wait()
                end
                
                if connection then connection:Disconnect() end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."explode" then
            local power = tonumber(msg:sub(#prefix + 9)) or 50
            
            task.spawn(function()
                workspace.Gravity = 0 -- Zero gravity for better explosion control
                
                botchar = bot.Character
                bothrp = botchar:WaitForChild("HumanoidRootPart")
                
                -- Calculate explosion direction based on bot number
                local myPosition = bots[bot.Name] or 1
                local totalBots = 0
                for _ in pairs(bots) do totalBots = totalBots + 1 end
                local angle = (myPosition * (360/totalBots))
                
                -- Launch bot
                local force = Vector3.new(
                    math.cos(math.rad(angle)) * power,
                    power/2,
                    math.sin(math.rad(angle)) * power
                )
                
                bothrp.Velocity = force
                
                -- Reset gravity after a delay
                task.wait(3)
                workspace.Gravity = 192
            end)
        end

        if msg:sub(1, #prefix + 5) == prefix.."giant" then
            local targetName = msg:sub(#prefix + 7)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if giant then
                chat("Already in giant formation! Use !ungiant first")
                return
            end
            
            -- Body part mappings with R6/R15 support
            local bodyParts = {
                [1] = { -- Head
                    offset = Vector3.new(0, 5, 0),
                    r15part = "Head",
                    r6part = "Head"
                },
                [2] = { -- Torso/UpperTorso
                    offset = Vector3.new(0, 0, 0),
                    r15part = "UpperTorso",
                    r6part = "Torso"
                },
                [3] = { -- Left Arm
                    offset = Vector3.new(5, 0, 0), -- 5 studs out from torso
                    r15part = "LeftHand",
                    r6part = "Left Arm"
                },
                [4] = { -- Right Arm
                    offset = Vector3.new(-5, 0, 0), -- 5 studs out from torso
                    r15part = "RightHand",
                    r6part = "Right Arm"
                },
                [5] = { -- Left Leg
                    offset = Vector3.new(2, -5, 0),
                    r15part = "LeftFoot",
                    r6part = "Left Leg"
                },
                [6] = { -- Right Leg
                    offset = Vector3.new(-2, -5, 0),
                    r15part = "RightUpperLeg",
                    r6part = "Right Leg"
                }
            }
            
            local myPosition = bots[bot.Name] or 1
            local myPart = bodyParts[myPosition]
            
            if not myPart then return end
            
            giant = targetPlayer
            workspace.Gravity = 0
            
            -- Enable noclip and platformstand
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    local humanoid = botchar:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.PlatformStand = true
                    end
                    
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            task.spawn(function()
                while giant == targetPlayer do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character then
                        local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        -- Check for R6 or R15 part
                        local targetPart = targetPlayer.Character:FindFirstChild(myPart.r15part) or 
                                         targetPlayer.Character:FindFirstChild(myPart.r6part)
                        
                        if targetRoot and targetPart then
                            -- Get the relative offset from target's root to the part
                            local relativeOffset = targetRoot.CFrame:ToObjectSpace(targetPart.CFrame)
                            
                            -- Base position 6 studs up and 10 studs left of player
                            local basePosition = targetRoot.Position + 
                                (targetRoot.CFrame.RightVector * -10) + 
                                Vector3.new(0, 6, 0)
                            
                            -- Create the base CFrame for the giant
                            local baseCFrame = CFrame.new(basePosition) * targetRoot.CFrame.Rotation
                            
                            -- Apply the same relative movement as the target's part
                            local finalPos = baseCFrame * relativeOffset
                            
                            -- Add the fixed offset for the giant formation
                            finalPos = finalPos * CFrame.new(
                                myPart.offset.X,
                                myPart.offset.Y,
                                myPart.offset.Z
                            )
                            
                            -- Move to position
                            bothrp.CFrame = finalPos
                        end
                    end
                    task.wait()
                end
                
                -- Clean up
                if connection then
                    connection:Disconnect()
                end
                
                -- Disable platformstand when done
                if botchar and botchar:FindFirstChild("Humanoid") then
                    botchar.Humanoid.PlatformStand = false
                end
            end)
        end

        if msg:sub(1, #prefix + 7) == prefix.."ungiant" then
            if giant then
                giant = nil
                workspace.Gravity = 192
                
                -- Disable platformstand
                if botchar and botchar:FindFirstChild("Humanoid") then
                    botchar.Humanoid.PlatformStand = false
                end
            else
                chat("Not in giant formation!")
            end
        end
        if msg:sub(1, #prefix + 5) == prefix.."wings" then
            local targetName = msg:sub(#prefix + 7)
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Player not found!")
                return
            end
            
            if wings then
                chat("Already in wings formation! Use !unwings first")
                return
            end
            
            -- Get wing position based on bot number (1-6)
            local myPosition = bots[bot.Name] or 1
            if myPosition > 6 then
                chat("Not needed for wings formation")
                return
            end
            
            wings = targetPlayer
            workspace.Gravity = 0
            
            -- Enable noclip
            local connection
            connection = game:GetService("RunService").Stepped:Connect(function()
                if botchar then
                    for _, part in ipairs(botchar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            task.spawn(function()
                local isLeftWing = myPosition <= 3
                local wingPos = isLeftWing and myPosition or (myPosition - 3)
                
                while wings == targetPlayer do
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart
                        
                        -- Use universal time for synchronized flapping
                        local flapAngle = math.sin(tick() * 0.8) -- Slower flapping speed
                        
                        -- Base wing position calculations
                        local side = isLeftWing and 1 or -1
                        local baseOffset = Vector3.new(
                            side * (1.5 + wingPos * 1.5), -- Horizontal spread
                            4 + flapAngle * 1.5 + wingPos, -- Higher position + flap movement
                            4 - (wingPos * 1.5) -- Much more behind target
                        )
                        
                        -- Rotate offset based on target's orientation
                        local rotatedOffset = targetHRP.CFrame:VectorToWorldSpace(baseOffset)
                        local targetPos = targetHRP.Position + rotatedOffset
                        
                        -- Calculate wing angle based on flap position
                        local wingTilt = math.rad(20 * flapAngle) -- Wing tilt for flapping
                        local targetRot = targetHRP.CFrame.Rotation
                            * CFrame.Angles(wingTilt, 0, side * math.rad(20))
                        
                        -- Move to position with rotation
                        bothrp.CFrame = CFrame.new(targetPos) * targetRot
                    end
                    task.wait()
                end
                
                if connection then
                    connection:Disconnect()
                end
            end)
        end
        if msg:sub(1, #prefix + 7) == prefix.."unwings" then
            if wings then
                wings = nil
                workspace.Gravity = 192
                chat("Wings formation broken!")
            else
                chat("Not in wings formation!")
            end
        end

        if msg:sub(1, #prefix + 9) == prefix.."clearchat" then
            local TextChatService = game:GetService("TextChatService")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            
            local function chatMessage(str)
                str = tostring(str)
                if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                    TextChatService.TextChannels.RBXGeneral:SendAsync(str)
                else
                    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
                end
            end
        
            local blob = "\u{000D}"
            chatMessage(".".. blob .. blob .. " ".. blob .." ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. " ".. blob .. "Bloxi's Private Control")
        end
        
       
        
        if msg:sub(1, #prefix + 10) == prefix.."linefollow" then
            local targetName = msg:sub(#prefix + 12) -- Get name after "!linefollow "
            local targetPlayer = findPlayer(targetName)
            
            if not targetPlayer then
                chat("Target player not found!")
                return
            end
            
            if lineFollowing then
                chat("Already in line formation! Use !unlinefollow first")
                return
            end
            
            -- Get my number and determine who to follow
            local myNumber = bots[bot.Name] or 1
            local followTarget
            
            if myNumber == 1 then
                -- Bot 1 follows target player
                followTarget = targetPlayer
                chat("Following " .. targetPlayer.DisplayName)
            else
                -- Other bots follow the bot before them
                for botName, botNumber in pairs(bots) do
                    if botNumber == (myNumber - 1) then
                        followTarget = game.Players:FindFirstChild(botName)
                        chat("Following " .. botName)
                        break
                    end
                end
            end
            
            if not followTarget then
                chat("Could not find target to follow!")
                return
            end
            
            -- Start following in line
            lineFollowing = followTarget
            local spacing = 4 -- Distance between bots
            
            task.spawn(function()
                while lineFollowing == followTarget do
                    -- Update character references
                    botchar = bot.Character
                    bothrp = botchar:WaitForChild("HumanoidRootPart")
                    bothm = botchar:WaitForChild("Humanoid")
                    
                    if followTarget.Character and followTarget.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = followTarget.Character.HumanoidRootPart
                        
                        -- Calculate position behind target
                        local behindPosition = targetHRP.Position - (targetHRP.CFrame.LookVector * spacing)
                        
                        -- Move to position
                        bothm:MoveTo(behindPosition)
                        
                        -- Make bot face the same direction as target
                        bothrp.CFrame = CFrame.new(bothrp.Position, 
                            bothrp.Position + targetHRP.CFrame.LookVector)
                    end
                    task.wait(0.1)
                end
            end)
        end
        
        if msg:sub(1, #prefix + 12) == prefix.."unlinefollow" then
            if not lineFollowing then
                chat("Not currently in line formation!")
                return
            end
            
            local targetName = lineFollowing.Name
            lineFollowing = nil
            chat("Stopped line following " .. targetName)
        end
        
        
        if msg:sub(1, #prefix + 7) == prefix.."ungiant" then
            if giant then
                giant = nil
                workspace.Gravity = 192
                
                -- Disable platformstand
                if botchar and botchar:FindFirstChild("Humanoid") then
                    botchar.Humanoid.PlatformStand = false
                end
            else
                chat("Not in giant formation!")
            end
        end
    end)
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/bloxi123/Roblox-Scripts/refs/heads/main/antibang.lua'))()
end

