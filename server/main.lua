--------------------------
-- Chat de radio InGame --
--     por Jougito      --
--------------------------

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand(Config.Command, function(source, args, rawCommand)

	args = table.concat(args, ' ')

	local uID = source
    local uName = GetPlayerName(uID)
	local xPlayer = ESX.GetPlayerFromId(uID)
	local pJob = xPlayer.job.name
	
	if args ~= "" then

		if Config.JouBot then	
			TriggerEvent('JouBot:ToDiscord', 'chat', uName .. ' (ID: ' .. uID .. ')', '/' .. Config.Command .. ' ' .. args, 'steam', true, uID, TTS)
		end

		if pJob == Jobs.Police then
			TriggerClientEvent('chat:addMessage', uID, { args = { "[".. Label.Police .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Police })
			TriggerClientEvent('r:Message', -1, uID, uName, args, pJob)
		elseif pJob == Jobs.Ambulance then
			TriggerClientEvent('chat:addMessage', uID, { args = { "[".. Label.Ambulance .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Ambulance })
			TriggerClientEvent('r:Message', -1, uID, uName, args, pJob)
		elseif pJob == Jobs.Taxi then
			TriggerClientEvent('chat:addMessage', uID, { args = { "[".. Label.Taxi .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Taxi })
			TriggerClientEvent('r:Message', -1, uID, uName, args, pJob)
		elseif pJob == Jobs.BaduBar then
			TriggerClientEvent('chat:addMessage', uID, { args = { "[".. Label.BaduBar .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.BaduBar })
			TriggerClientEvent('r:Message', -1, uID, uName, args, pJob)
		elseif pJob == Jobs.Mechanic then
			TriggerClientEvent('chat:addMessage', uID, { args = { "[".. Label.Mechanic .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Mechanic })
			TriggerClientEvent('r:Message', -1, uID, uName, args, pJob)
		elseif pJob == Jobs.Casino then
			TriggerClientEvent('chat:addMessage', uID, { args = { "[".. Label.Casino .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.Casino })
			TriggerClientEvent('r:Message', -1, uID, uName, args, pJob)
		elseif pJob == Jobs.WeazelNews then
			TriggerClientEvent('chat:addMessage', uID, { args = { "[".. Label.WeazelNews .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.WeazelNews })
			TriggerClientEvent('r:Message', -1, uID, uName, args, pJob)
		elseif pJob == Jobs.SecuroServ then
			TriggerClientEvent('chat:addMessage', uID, { args = { "[".. Label.SecuroServ .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.SecuroServ })
			TriggerClientEvent('r:Message', -1, uID, uName, args, pJob)
		else
			TriggerClientEvent('chat:addMessage', uID, { args = { "[Radio]: ", "^7No tienes permisos para hablar por este chat" }, color = Color.WeazelNews })
		end
	end
	
end, false)

RegisterCommand(Config.rCommand, function(source, args, rawCommand)

	args = table.concat(args, ' ')

	local uID = source
    local uName = GetPlayerName(uID)
	local xPlayer = ESX.GetPlayerFromId(uID)
	local pJob = xPlayer.job.name
	
	if args ~= "" then				

		if Config.JouBot then	
			TriggerEvent('JouBot:ToDiscord', 'chat', uName .. ' (ID: ' .. uID .. ')', '/' .. Config.rCommand .. ' ' .. args, 'steam', true, uID, TTS)
		end

		if pJob == Jobs.Police or pJob == Jobs.Ambulance or pJob == Jobs.State then
			TriggerClientEvent('chat:addMessage', uID, { args = { "[".. Label.PoliceEMS .."] ".. uName .." (".. uID .."): ", "^7".. args }, color = Color.PoliceEMS })
			TriggerClientEvent('rr:Message', -1, uID, uName, args)
		else
			TriggerClientEvent('chat:addMessage', uID, { args = { "[Radio]: ", "^7No tienes permisos para hablar por este chat" }, color = Color.WeazelNews })
		end
	end
	
end, false)

-- Version Checking - DON'T TOUCH THIS

local CurrentVersion = '1.0.0'
local GithubResourceName = 'Factions-Chat'

PerformHttpRequest('https://raw.githubusercontent.com/Jougito/FiveM_Resources/master/' .. GithubResourceName .. '/VERSION', function(Error, NewestVersion, Header)
	PerformHttpRequest('https://raw.githubusercontent.com/Jougito/FiveM_Resources/master/' .. GithubResourceName .. '/CHANGELOG', function(Error, Changes, Header)
		print('\n')
        print('[Factions Chat] Checking for updates...')
        print('')
        print('[Factions Chat] Current version: ' .. CurrentVersion)
        print('[Factions Chat] Updater version: ' .. NewestVersion)
        print('')
		if CurrentVersion ~= NewestVersion then
			print('[Factions Chat] Your script is outdated!')
			print('')
            print('[Factions Chat] CHANGELOG ' .. NewestVersion .. ':')
            print('')
            print(Changes)
            print('')
            print('[Factions Chat] You are not running the newest stable version of Factions Chat. Please update: https://github.com/Jougito/Factions-Chat')
		else
			print('[Factions Chat] Your script is up-to-update')
		end
		print('\n')
	end)
end)
