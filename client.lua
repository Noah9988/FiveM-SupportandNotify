RegisterNetEvent("textsent")
AddEventHandler('textsent', function(tPID, names2)
	TriggerEvent('chatMessage', "", {205, 205, 0}, " Reply sent to:^0 " .. names2 .."  ".."^0  - " .. tPID)
end)

RegisterNetEvent("textmsg")
AddEventHandler('textmsg', function(source, textmsg, names2, names3 )
	TriggerEvent('chatMessage', "", {205, 205, 0}, "  ADMIN " .. names3 .."  ".."^0: " .. textmsg)
end)


RegisterNetEvent('sendSupport')
AddEventHandler('sendSupport', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
							exports.pNotify:SendNotification({
							text = "Supportanfrage an Admin versendet!",
							type = "success",
							timeout = math.random(1000, 10000),
							layout = "topCenter",
							theme = "relax"
							
							})
	TriggerServerEvent("checkadmin", name, message, id)
  elseif pid ~= myId then
    TriggerServerEvent("checkadmin", name, message, id)
  end
end)


RegisterNetEvent('sendSupportToAllAdmins')
AddEventHandler('sendSupportToAllAdmins', function(id, name, message, i)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
							exports.pNotify:SendNotification({
							text = "Support Anfrage von "  .. name .. " mit der ID:" .. i .. " und der Nachricht: " .. message .. " ",
							type = "error",
							timeout = math.random(1000, 60000),
							layout = "topRight",
							theme = "relax",
							queue = "left"

							
							})
  end
end)