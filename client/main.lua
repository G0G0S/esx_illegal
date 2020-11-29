Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local menuOpen = false
local wasOpen = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.DrugDealer.coords, true) < 1.5
		or GetDistanceBetweenCoords(coords, Config.CircleZones.DrugDealer2.coords2, true) < 1.5
        --or GetDistanceBetweenCoords(coords, Config.CircleZones.DrugDealer3.coords3, true) < 1.5
        --or GetDistanceBetweenCoords(coords, Config.CircleZones.DrugDealer4.coords4, true) < 1.5
		--or GetDistanceBetweenCoords(coords, Config.CircleZones.DrugDealer5.coords5, true) < 1.5
		then
			if not menuOpen then
				ESX.ShowHelpNotification(_U('dealer_prompt'))

				if IsControlJustReleased(0, 38) then
					if not IsPedInAnyVehicle(playerPed, true) then
						if Config.RequireCopsOnline then
							ESX.TriggerServerCallback('esx_illegal:EnoughCops', function(cb)
								if cb then
									wasOpen = true
									OpenDrugShop()
								else
									ESX.ShowNotification(_U('cops_notenough'))
								end
							end, Config.Cops.DrugDealer)
						else
							wasOpen = true
							OpenDrugShop()
						end
					else
						ESX.ShowNotification(_U('need_on_foot'))
					end
				end
			else
				Citizen.Wait(500)
			end
		else
			if wasOpen then
				wasOpen = false
				ESX.UI.Menu.CloseAll()
			end

			Citizen.Wait(500)
		end
	end
end)

function OpenDrugShop()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen = true

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = Config.DrugDealerItems[v.name]

		if price and v.count > 0 then
			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(v.label, _U('dealer_item', ESX.Math.GroupDigits(price))),
				name = v.name,
				price = price,

				-- menu properties
				type = 'slider',
				value = v.count,
				min = 1,
				max = v.count
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_shop', {
		title    = _U('dealer_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('esx_illegal:sellDrug', data.current.name, data.current.value)
	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

function CreateBlipCircle(coords, text, radius, color, sprite)
	
	if Config.EnableMapsBlimps then
		local blip = AddBlipForRadius(coords, radius)

		SetBlipHighDetail(blip, true)
		SetBlipColour(blip, 1)
		SetBlipAlpha (blip, 128)

		-- create a blip in the middle
		blip = AddBlipForCoord(coords)

		SetBlipHighDetail(blip, true)
		SetBlipSprite (blip, sprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(text)
		EndTextCommandSetBlipName(blip)
	end
end

Citizen.CreateThread(function()
	if Config.EnableMapsBlimps then
		for k,zone in pairs(Config.CircleZones) do
			if zone.enabled then
				CreateBlipCircle(zone.blimpcoords, zone.name, zone.radius, zone.color, zone.sprite)
				CreateBlipCircle(zone.blimpcoords2, zone.name2, zone.radius2, zone.color2, zone.sprite2)
				--CreateBlipCircle(zone.blimpcoords3, zone.name3, zone.radius3, zone.color3, zone.sprite3)
				--CreateBlipCircle(zone.blimpcoords4, zone.name4, zone.radius4, zone.color4, zone.sprite4)
				--CreateBlipCircle(zone.blimpcoords5, zone.name5, zone.radius5, zone.color5, zone.sprite5)
			end
		end
	end
end)