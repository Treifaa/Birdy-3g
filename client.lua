local function openMenuGestion()
    SendNUIMessage({
        action = "showui4",

    })
    SetNuiFocus(true, true)
end

Citizen.CreateThread(function()
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    while ESX == nil do Wait(500) end
    ESX.PlayerData = ESX.GetPlayerData()
    
    while true do   
        local timer = 750
        if ESX.PlayerData.job.name == config.nameJob then 
            local coordsp = GetEntityCoords(PlayerPedId())
            local dist = #(coordsp - config.posMenu)
            if dist <= 5.0 then
                timer = 1
                DrawMarker(6,config.posMenu.x, config.posMenu.y, config.posMenu.z-1.00, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.7, 0.7, 0.7, 0, 155, 255, 200, false, false, true, false, false, false, false, false)

                if dist <= 1.0 and IsControlJustPressed(1,51) then
                    Citizen.Wait(100)
                    openMenuGestion() 
                end
            end
        else
            timer = 10000
        end
        Citizen.Wait(timer)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('bip_pompier:getService')
AddEventHandler('bip_pompier:getService', function(rue, info, vehicule) 
    if ESX.PlayerData.job and ESX.PlayerData.job.name == config.nameJob then    
        SendNUIMessage({
            action = "showui2",
            vehicule = 'Vehicule : '..vehicule,
            rue = 'RUE : '..rue,    
            info = 'INFO : '..info,
            timer = config.time*1000
        })
    end
end)

RegisterNUICallback('button', function(value, cb)
    TriggerServerEvent("bip_pompier:pompier",value.rue, value.info, value.veh) 
    SetNuiFocus(false, false)
end)

RegisterNUICallback('close', function(value, cb)
    SetNuiFocus(false, false)
end)