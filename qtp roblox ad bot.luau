spawn(function()
local n = 0
loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/More-Scripts/refs/heads/main/Anthony's%20ACL"))()
while wait(8) do
n=n+2
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create notification
StarterGui:SetCore("SendNotification", {
    Title = "AK ADMIN",
    Text = "You need to change your Roblox Language to Қазақ тілі so it won't get tagged",
    Duration = 5
})

local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Function to send a chat message
local function chatMessage(str)
    str = tostring(str)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local generalChannel = TextChatService:FindFirstChild("TextChannels")
        if generalChannel then
            generalChannel = generalChannel:FindFirstChild("RBXGeneral")
            if generalChannel then
                generalChannel:SendAsync(str)
            else
                warn("RBXGeneral channel not found!") 
            end
        else
            warn("TextChannels not found!")
        end
    else
        local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents then
            local chatEvent = chatEvents:FindFirstChild("SayMessageRequest")
            if chatEvent then
                chatEvent:FireServer(str, "All")
            else
                warn("SayMessageRequest event not found!")
            end
        else
            warn("DefaultChatSystemChatEvents not found!")
        end
    end
end

-- Invisible character for new lines
local blob = ""

-- ASCII art message (only for new chat system)
local asciiMessage = blob .. "\r" ..
    "       _/       _//   _//  " .. blob .. "\r" ..
    "     _/ //     _//  _//   " .. blob .. "\r" ..
    "    _/  _//    _// _//    " .. blob .. "\r" ..
    "   _/    _//   _/  _/      " .. blob .. "\r" ..
    "  _////// _//  _//  _// " .. blob .. "\r" ..
    " _//       _// _//   _//  " .. blob .. "\r" ..
    "_//         _//_//     _//"

-- Formatted message (common for both systems)
wait(0.1)
local newMessage = blob .. "\r" ..
"🔥 AK ADMIN 🔥" .. blob .. "\r" ..
"--------------" .. blob .. "\r" ..
"Pụṛc̣ḥạṣẹ Ḷịf̣ẹṭiṃẹ!" .. blob .. "\r" ..
"---------------" .. blob .. "\r" ..
"Or use points for free!" .. blob .. "\r" ..
"---------------" .. blob .. "\r" ..
"👉 ḍịṣcọrḍ.gg/gJgRuwC3MP 👈" 

-- New message for the old chat system (without ASCII art)
local oldMessage = "🔥 AK ADMIN 🔥  Pụṛc̣ḥạṣẹ Ḷịf̣ẹṭiṃẹ! Or use points for free! 👉 ḍịṣcọrḍ.gg/gJgRuwC3MP 👈"

-- Send the ASCII art message only for the new chat system
if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    chatMessage(asciiMessage)
end

wait(0.3)

-- Send the appropriate message based on the chat system
local function sendMessage()
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        -- New chat system
        chatMessage(newMessage)
    else
        -- Old chat system
        chatMessage(oldMessage)
    end
end

-- Retry mechanism in case the message fails to send
local retries = 3
while retries > 0 do
    local success, err = pcall(sendMessage)
    if success then
        break
    else
        warn("Failed to send message: " .. err)
        retries = retries - 1
        wait(1) -- Wait before retrying
    end
end

if retries == 0 then
    warn("Failed to send message after multiple attempts.")
end
if n >= 25 then
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end

function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Desc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Desc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.playing) > 0 and tonumber(v.playing) < tonumber(v.maxPlayers) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- Start the teleport process
Teleport()
end
end
end)
pcall(function()
local players = game:GetService"Players"
spawn(function()
while wait() do
for i,plr in pairs(players:GetChildren()) do
wait(4)
local char = plr.Character
local hrp = char:FindFirstChild"HumanoidRootPart"
local myhrp = game.Players.LocalPlayer.Character:FindFirstChild"HumanoidRootPart"
myhrp.CFrame = hrp.CFrame
end
end
end)
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
if queueteleport then
    local teleportScript = [[
        loadstring(game:HttpGet('https://raw.githubusercontent.com/bloxi123/Roblox-Scripts/refs/heads/main/qtp%20roblox%20ad%20bot.luau'))()
    ]]
    queueteleport(teleportScript)
    print("Script queued for execution upon teleport.")
else
    warn("Queue on teleport is not supported on this executor.")
end
end)
