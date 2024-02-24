ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getAmsterdamTime()
    local amsterdamOffset = 1

    local utcTime = os.time(os.date("!*t"))

    local amsterdamTime = utcTime + (amsterdamOffset * 3600)

    local formattedTime = os.date("%d-%m-%Y %H:%M:%S", amsterdamTime)

    return formattedTime
end

function logToDiscord(message, title, webhook)
	local embeds = {
		{
			["title"] = title,
			["type"] = "rich",
			["color"] = 3127362,
			["description"] = message,
			["footer"] = {
				["text"] = "Gemaakt door Senna | https://github.com/Poseidon281",
			},
		}
	}

	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "Fantasy TX", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('txAdmin:events:playerWarned', function(eventData)
    local xTarget = ESX.GetPlayerFromId(eventData.target)
    local Targetname = xTarget.getName()
    logToDiscord("Speler die gewaarschuwt is: " .. Targetname .. " **ID: **" .. eventData.target .. "\n Het Staff-Lid die de waarschuwing heeft uitgevoerd: " .. eventData.author .. "\n Reden van de waarschuwing: " .. eventData.reason .. "\n\n ID van de waarschuwing: " .. eventData.actionId .. "\n\n Huidige tijd: " .. getAmsterdamTime(), "**TX-Admin Waarschuwing**", Discord.warns)
end)

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
    local target = eventData.id

    if target == -1 then
        playername = 'Iedereen is gehealed'
    else
        playername = GetPlayerName(target)
    end

    logToDiscord("**Naam van degene die gehealed is : **" .. playername, 'Er is iemand gehealed Healed', Discord.heal)
end)

AddEventHandler('txAdmin:events:announcement', function(eventData)
    local author = eventData.author
    local msg = eventData.message

    if author ~= 'txAdmin' then
        logToDiscord("Maker van de mededeling: **" .. author .. "**\n Mededeling: **" .. msg .. "**\n\n Huidige tijd: " .. getAmsterdamTime(), "**TX-Mededeling**", Discord.mededeling)
    end
end)

AddEventHandler('txAdmin:events:playerBanned', function(eventData)
    local Targetname = eventData.targetName
    local banReden = eventData.reason
    local banID = eventData.actionId
    local banAuteur = eventData.author

    if eventData.durationTranslated == null then
        duratie = "Voor eeuwig (Perm Ban)"
    else
        duratie = eventData.durationTranslated
    end

    logToDiscord("Ban ID: " .. banID .. "\n Persoon die is geband: " .. Targetname .. "\n Reden van de ban: " .. banReden .. "\n Deze ban duurt: " .. duratie .. "\n Deze persoon is geband door Staff-Lid: " .. banAuteur .. "\n\n Huidige tijd: " .. getAmsterdamTime(), "**TX-Admin Ban**", Discord.ban)
end)




AddEventHandler('txAdmin:events:whitelistRequest', function(eventData)
    local action = eventData.action
    local player = eventData.playerName
    local aanvraagID = eventData.requestId
    local Staff = eventData.adminName

    if action == "requested" then
        logToDiscord(player .. " heeft een aanvraag gedaan om gewhitelist te worden\n ID van de aanvraag: " .. aanvraagID .. "\n\n Huidige tijd: " .. getAmsterdamTime(), "TX-Whitelist Aanvraag", Discord.whitelist)
    elseif action == "approved" then
        logToDiscord(player .. " z'n whitelist-aanvraag is goedgekeurd \n Staff-Lid die het heeft goedgekeurd: " .. Staff .. "\n\n Huidige tijd: " .. getAmsterdamTime(), "TX-Whitelist Goedgekeurd", Discord.whitelist)
    elseif action == "denied" then
        logToDiscord(player .. " z'n whitelist-aanvraag is afgekeurd \n Staff-Lid die het heeft afgekeurd: " .. Staff .. "\n\n Huidige tijd: " .. getAmsterdamTime(), "TX-Whitelist Afgekeurd", Discord.whitelist)
    elseif action == "deniedAll" then
        logToDiscord("Staff-Lid die alle whitelist requests afgekeurd: " .. Staff .. "\n\n Huidige tijd: " .. getAmsterdamTime(), "TX-Whitelist alles Afgekeurd", Discord.whitelist)
    else
        logToDiscord("ERROR ERROR \n\n Huidige tijd: " .. getAmsterdamTime(), "Er is een error met dit event!! ", Discord.whitelist)
    end
end)

AddEventHandler('txAdmin:events:actionRevoked', function(eventData)
    local Staff = eventData.revokedBy
    local type = eventData.actionType

    logToDiscord("Staff die de actie ongedaan heeft gemaakt: " .. Staff .. "\n Type actie die ongedaan is gemaakt: " .. type .. "\nID van de originele actie: " .. eventData.actionId .. "\n Naam van de speler die de originele actie heeft ontvangen: " .. eventData.playerName .. "\n Naam van de Staff die de orginele actie heeft uitgevoerd: " .. eventData.actionAuthor .. "\nOriginele Reden van de actie: " .. eventData.actionReason .. "\n\n Huidige tijd: " .. getAmsterdamTime(), "TX-Actie ongedaan gemaakt", Discord.acties)

end)

AddEventHandler('txAdmin:events:playerDirectMessage', function(eventData)
    local Target = ESX.GetPlayerFromId(eventData.target)
    local Targetname = Target.getName()
    local TargetID = eventData.target

    logToDiscord("**Ontvanger van het bericht: **" .. Targetname .. " ID: " .. TargetID .. "\n **Staff-Lid die de DM heeft verstuurd:** " .. eventData.author .. "\n\n **Het bericht:** " .. eventData.message .. "\n\n Huidige tijd: " .. getAmsterdamTime(), "**TX-Admin Direct Message **", Discord.mededeling)

end)

AddEventHandler('txAdmin:events:playerKicked', function(eventData)
    local Target = ESX.GetPlayerFromId(eventData.target)
    local Targetname = Target.getName()
    local TargetID = eventData.target

    logToDiscord("De gene die is gekickt: " .. Targetname .. " ID: " .. eventData.target .. "\n Staff-Lid die deze persoon heeft gekickt: " .. eventData.author .. "\n De reden van de kick: " .. eventData.reason .. "\n\n Huidige tijd: " .. getAmsterdamTime() , "TX-Admin DM verstuurd", Discord.kick)
end)

AddEventHandler('txAdmin:events:skippedNextScheduledRestart', function(eventData)

    logToDiscord("Nog niet geconfigureerd" , "TX-Admin Restart geannuleerd", Discord.restart)
end)


AddEventHandler('txAdmin:events:serverShuttingDown', function(eventData)
    logToDiscord("De server is uitgezet/opgestart/geherstart door: " .. eventData.author .. "\n**Met het volgende bericht: **" .. eventData.message .. "Eventuele Vertraging: " .. eventData.delay .. "\n\n Huidige tijd: " .. getAmsterdamTime() , "Verandering in de server-status", Discord.restart)
end)
