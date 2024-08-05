ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('WayeShop:BuyFood')
AddEventHandler('WayeShop:BuyFood', function(label, name, price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getMoney = xPlayer.getAccount('money').money
    local getBank = xPlayer.getAccount('bank').money

    function BuySucess(accountType)
        xPlayer.removeAccountMoney(accountType, price)
        xPlayer.addInventoryItem(name, 1)
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Apu', '~y~Supérette', 'Merci pour ton achat !', nil, 8)
    end

    if getMoney >= price then
        BuySucess('money')
    elseif getBank >= price then
        BuySucess('bank')
    else
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Apu', '~y~Supérette', 'Va chercher de l\'argent !', nil, 8)
    end

    print(getMoney..' - '..getBank)
end)

RegisterNetEvent('WayeShop:BuyDrink')
AddEventHandler('WayeShop:BuyDrink', function(label, name, price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getMoney = xPlayer.getAccount('money').money
    local getBank = xPlayer.getAccount('bank').money

    function BuySucess(accountType)
        xPlayer.removeAccountMoney(accountType, price)
        xPlayer.addInventoryItem(name, 1)
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Apu', '~y~Supérette', 'Merci pour ton achat !', nil, 8)
    end

    if getMoney >= price then
        BuySucess('money')
    elseif getBank >= price then
        BuySucess('bank')
    else
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Apu', '~y~Supérette', 'Va chercher de l\'argent !', nil, 8)
    end

    print(getMoney..' - '..getBank)
end)