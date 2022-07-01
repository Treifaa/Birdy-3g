TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bip_pompier:pompier', function(rue, info, vehicule)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer.job.Name == config.nameJob then
        for _, v in pairs(GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(v)
            if xPlayer.job.Name == config.nameJob then
                TriggerClientEvent('bip_pompier:getService', v, rue, info, vehicule)
            end
        end
    end
end)