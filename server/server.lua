local resourceName = GetCurrentResourceName()
local currentVersion = GetResourceMetadata(resourceName, "version", 0)
local versionURL = "https://raw.githubusercontent.com/BehrTheDon/behr_clothingcommands/main/fxmanifest.lua"

if Config.VersionCheckEnabled == true then
    Citizen.CreateThread(function()
        PerformHttpRequest(versionURL, function(code, data, headers)
            if code == 200 then
                local latestVersion = string.match(data, "version%s+'([^']+)'")

                if latestVersion then
                    if latestVersion ~= currentVersion then
                        print("^3[" .. resourceName .. "]^0 Update available!")
                        print("^3Current: ^0" .. currentVersion .. " | ^2Latest: ^0" .. latestVersion)
                        print("^5Get the latest version at: ^0https://github.com/BehrTheDon/behr_clothingcommands")
                    else
                        print("^2[" .. resourceName .. "]^0 is up to date! (v" .. currentVersion .. ")")
                    end
                else
                    print("^1[" .. resourceName .. "]^0 Couldn't parse latest version.")
                end
            else
                print("^1[" .. resourceName .. "]^0 Failed to fetch version info. HTTP Code: " .. code)
            end
        end, "GET", "", {})
    end)
end