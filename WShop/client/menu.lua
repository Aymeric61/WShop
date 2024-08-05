ESX = exports['es_extended']:getSharedObject()

CreateThread(function()
    while true do
        for _,v in pairs(WayeShop.Pos) do
        local interval = 500
        local posPlayer = GetEntityCoords(PlayerPedId())
        local point = v.pos
        local dist = #(posPlayer-point)
        if dist <= 3.0 then
            DrawMarker(21, v.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0.7, 0.7, 0.7, 119, 163, 69, 0.5, true, true, 2, false, nil, nil, false)
            if dist <= 1.5 then
                Visual.Subtitle('Appuyer sur ~p~[E]~s~ pour ouvrir le ~p~Magasin')
                if IsControlJustPressed(1, 51) then
                    OpenShop()
                end
            end
        end
        end
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(WayeShop.Pos) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite(blip, 59)
        SetBlipDisplay(blip, 2)
        SetBlipColour(blip, 2)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Supérette')
        EndTextCommandSetBlipName(blip)
    end
end)