local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Rayfield:Notify({
   Title = "Executing Script",
   Content = "The Icon Hub Is Executing",
   Duration = 3,
   Image = 4483362458,
})

local Window = Rayfield:CreateWindow({
   Name = "Icon Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Icon Hub",
   LoadingSubtitle = "Last Updated 7/19/2025",
   ShowText = "Icon Hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes
   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
   ConfigurationSaving = {
      Enabled = true,
      FolderName = IconHub, -- Create a custom folder for your hub/game
      FileName = "Settings"
   },
   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Icon Hub | KeySystem",
      Subtitle = "Join our Discord to Obtain the key",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://raw.githubusercontent.com/EnderSlovakD/DismaneScripts/refs/heads/main/KeySystem"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
Rayfield:Notify({
   Title = "Executed Script",
   Content = "The Icon Hub is Succefully Executed",
   Duration = 3,
   Image = 4483362458,
})
local Tab = Window:CreateTab("🏠 Home", nil) -- Title, Image
local Section = Tab:CreateSection("Movement")
local Toggle = Tab:CreateToggle({
   Name = "Infinite Jump (PC Only)",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      _G.infinjump = not _G.infinjump
if _G.infinJumpStarted == nil then
	_G.infinJumpStarted = true
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})
local Button = Tab:CreateButton({
   Name = "Noclip",
   Callback = function()
   Rayfield:Notify({
   Title = "Icon Hub",
   Content = "The Noclip isn't Working Right Now",
   Duration = 5.5,
   Image = 4483362458,
})
   end,
})
local Slider = Tab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 1000},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(SValue)
      local Value = SValue
local player = game.Players.LocalPlayer
if not player.Character or not player.Character:FindFirstChild("Humanoid") then
    player.CharacterAdded:Wait()
end
player.Character:WaitForChild("Humanoid").WalkSpeed = Value
   end,
})
local Section = Tab:CreateSection("Executor")
Tab:CreateInput({
    Name = "Executor",
    PlaceholderText = "Insert",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        userCode = Text
    end,
})
Tab:CreateButton({
    Name = "Execute",
    Callback = function()
        local success, err = pcall(function()
            loadstring(userCode)()
        end)
        if not success then
            warn("Error: " .. tostring(err))
        end
    end
})
local Section = Tab:CreateSection("Others")
local Button = Tab:CreateButton({
   Name = "Un-Execute Icon Hub",
   Callback = function()
      Rayfield:Destroy()
   end,
})
local Button = Tab:CreateButton({
   Name = "Credits",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EnderSlovakD/DismaneScripts/refs/heads/main/Credits.lua"))()
   end,
})
local Tab = Window:CreateTab("🎮 Games", nil)
local Button = Tab:CreateButton({
   Name = "Dead Rails | Ez Win",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Dead Rails | Bonds",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHub/main/loader.lua"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Grow a Garden",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Ink Game",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/fqfqfqfqwgqghadfaffg/TeslHubCode/refs/heads/main/bob"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Dig It",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/refs/heads/main/FrostByte/Initiate.lua"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Murder Mystery 2",
   Callback = function()
      loadstring(game:HttpGet('loadstring(game:HttpGet("https://soluna-script.vercel.app/murder-mystery-2.lua",true))()'))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Rivals (PC)",
   Callback = function()
      loadstring(game:HttpGet(('https://raw.githubusercontent.com/blackowl1231/ZYPHERION/refs/heads/main/main.lua')))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Rivals Key System (Mobile)",
   Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-Duck-Hub-29794"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Steal a Brainrot",
   Callback = function()
	loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ffdfeadf0af798741806ea404682a938.lua"))() 
   end,
})
 local Tab = Window:CreateTab("💼 Admin", nil) -- Title, Image
local Button = Tab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Dex",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
   end,
})
local Button = Tab:CreateButton({
    Name = "UNC Test",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/refs/heads/main/UNCCheckEnv.lua"))()
    end,
})
local Button = Tab:CreateButton({
    Name = "OwO Dances",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/FWwdST5Y"))()
    end,
})
