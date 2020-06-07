--------------------------
-- Chat de radio InGame --
--     por Jougito      --
--------------------------

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/' .. Config.Command,  'Manda un mensaje en el chat de radio', { { name = 'Mensaje', help = 'Mensaje que quieres enviar al chat de radio' } })
	TriggerEvent('chat:addSuggestion', '/' .. Config.rCommand,  'Manda un mensaje en el chat de Policía - EMS', { { name = 'Mensaje', help = 'Mensaje que quieres enviar al chat de Policía - EMS' } })
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

-- Radio

RegisterNetEvent('r:Message')
AddEventHandler('r:Message', function(uID, uName, args, pJob)

	local sId = PlayerId()
	local pId = GetPlayerFromServerId(uID)
	
	if pId ~= sId then
		if PlayerData.job.name == pJob then
			if pJob == Jobs.Police then
				TriggerEvent('chat:addMessage', { args = { "[".. Label.Police .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Police })
			elseif pJob == Jobs.Ambulance then
				TriggerEvent('chat:addMessage', { args = { "[".. Label.Ambulance .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Ambulance })
			elseif pJob == Jobs.Taxi then
				TriggerEvent('chat:addMessage', { args = { "[".. Label.Taxi .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Taxi })
			elseif pJob == Jobs.BaduBar then
				TriggerEvent('chat:addMessage', { args = { "[".. Label.BaduBar .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.BaduBar })
			elseif pJob == Jobs.Mechanic then
				TriggerEvent('chat:addMessage', { args = { "[".. Label.Mechanic .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Mechanic })
			elseif pJob == Jobs.Casino then
				TriggerEvent('chat:addMessage', { args = { "[".. Label.Casino .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Casino })
			elseif pJob == Jobs.WeazelNews then
				TriggerEvent('chat:addMessage', { args = { "[".. Label.WeazelNews .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.WeazelNews })
			elseif pJob == Jobs.SecuroServ then
				TriggerEvent('chat:addMessage', { args = { "[".. Label.SecuroServ .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.SecuroServ })
			end
		end
	end
end)

-- Radio Policía - EMS

RegisterNetEvent('rr:Message')
AddEventHandler('rr:Message', function(uID, uName, args)

	local sId = PlayerId()
	local pId = GetPlayerFromServerId(uID)
	
	if pId ~= sId then
		if PlayerData.job.name == Jobs.Police or PlayerData.job.name == Jobs.Ambulance or PlayerData.job.name == Jobs.State then
			TriggerEvent('chat:addMessage', { args = { "[".. Label.PoliceEMS .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.PoliceEMS })
		end
	end	
end)
