ESX = exports['es_extended']:getSharedObject()

local WayeSupp = RageUI.CreateMenu('Supérette', 'Intéraction ..')
local WayeFood = RageUI.CreateSubMenu(WayeSupp, 'Supérette', 'Intéraction ..')
local WayeDrink = RageUI.CreateSubMenu(WayeSupp, 'Supérette', 'Intéraction ..')

WayeSupp.Closed = function()
    OpenMenu = false
end

function OpenShop()
    if OpenMenu then
        RageUI.Visible(WayeSupp, false)
        OpenMenu = false
        return
    else
        RageUI.Visible(WayeSupp, true)
        OpenMenu = true
            CreateThread(function()
            while OpenMenu do
                RageUI.IsVisible(WayeSupp, function()
                    RageUI.Button(WayeItem.NameButtonFood, nil, {RightLabel = '~l~→→'},true, {
                    }, WayeFood)

                    RageUI.Button(WayeItem.NameButtonDrink, nil, {RightLabel = '~l~→→'},true, {
                    }, WayeDrink)

                    RageUI.Line()

                    RageUI.Button('~r~Fermer le menu', nil, {RightLabel = '~l~→→'},true, {
                        onSelected = function()
                            RageUI.CloseAll()
                        end
                    })
                end)

                RageUI.IsVisible(WayeFood, function()
                    for k,v in pairs(WayeItem.Food) do
                        RageUI.Button(v.label, nil, {RightLabel = '~l~→→'},true, {
                            onSelected = function()
                                TriggerServerEvent('WayeShop:BuyFood', v.label, v.name, v.price)
                            end
                        })
                    end
                end)

                RageUI.IsVisible(WayeDrink, function()
                    for k,v in pairs(WayeItem.Drink) do
                        RageUI.Button(v.label, nil, {RightLabel = '~l~→→'},true, {
                            onSelected = function()
                                TriggerServerEvent('WayeShop:BuyDrink', v.label, v.name, v.price)
                            end
                        })
                    end
                end)
            Wait(0)
            end
        end)
    end
end