ESX = nil
local nmin = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('greentime:job')
AddEventHandler('greentime:job', function(Type, mins)
local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'police' then
		nmin = mins
		if Type == "G" then
			TriggerClientEvent("greentime:on", -1, nmin)
		elseif Type == "O" then
			TriggerClientEvent("orangetime:on", -1, nmin)
		elseif Type == "R" then
			TriggerClientEvent("redtime:on", -1, nmin)
		elseif Type == "F" then
			TriggerClientEvent("greentime:off", -1)
		end
	end
end)