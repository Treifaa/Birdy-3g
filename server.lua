RegisterServerEvent('bip_pompier:pompier', function(rue, info, vehicule)
    TriggerClientEvent('bip_pompier:getService', -1, rue, info, vehicule)
end)