local mins = 0
local Type = "G"
local msg
------------------------------------------------------------
-------------------les commande mta3 w9t--------------------
------------------------------------------------------------
RegisterCommand("greentimeon", function(source, args, raw)

	if args[1] == nil then
		TriggerEvent("chatMessage", "^no arguments set",{0, 0, 0})
		return
	else
		mins = tonumber(args[1])
		Type = "G"
		TriggerServerEvent('greentime:job', Type, mins)
	end
end)
-------------------------------------------------------------
RegisterCommand("orangetimeon", function(source, args, raw)

	if args[1] == nil then
		TriggerEvent("chatMessage", "^no arguments set",{0, 0, 0})
		return
	else
		mins = tonumber(args[1])
		Type = "O"
		TriggerServerEvent('greentime:job', Type, mins)
	end
end)
-------------------------------------------------------------
RegisterCommand("redtimeon", function(source, args, raw)

	if args[1] == nil then
		TriggerEvent("chatMessage", "^no arguments set",{0, 0, 0})
		return
	else
		mins = tonumber(args[1])
		Type = "R"
		TriggerServerEvent('greentime:job', Type, mins)
	end
end)
-------------------------------------------------------------------
RegisterCommand("greentimeoff", function(source, args, raw)
		Type = "F"
		TriggerServerEvent('greentime:job', Type, mins)
end)
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
RegisterNetEvent("greentime:on")
AddEventHandler("greentime:on", function(nmin)
  msg = " وقت اخضر ",nmin
  exports['mythic_notify']:DoHudText('success', msg, 2500)
  SendNUIMessage({
  type = 'greenon',
  min = nmin
  })
end)
-------------------------------------------------------------------
RegisterNetEvent("orangetime:on")
AddEventHandler("orangetime:on", function(nmin)
  msg = " حالة طوارء ",nmin
  exports['mythic_notify']:DoHudText('error', msg, 2500)
  SendNUIMessage({
  type = 'orangeon',
  min = nmin
  })
end)
-------------------------------------------------------------------
RegisterNetEvent("redtime:on")
AddEventHandler("redtime:on", function(nmin)
  msg = " حالة طوارء قصوي ",nmin
  exports['mythic_notify']:DoHudText('error', msg, 2500)
  -- TriggerEvent("chatMessage", "red time on test",{255, 0, 0})
  SendNUIMessage({
  type = 'redon',
  min = nmin
  })
end)
-------------------------------------------------------------------
RegisterNetEvent("greentime:off")
AddEventHandler("greentime:off", function()
  SendNUIMessage({
  type = 'greenoff'
  })
end)