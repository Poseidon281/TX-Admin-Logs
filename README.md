## Discord Loggingscript

Dit script stelt je in staat om verschillende servergebeurtenissen naar Discord te loggen met behulp van webhooks. Het is ontworpen voor gebruik met het FiveM roleplaying-framework.

### Beschrijving

Dit Lua-script integreert met het [txAdmin](https://txadm.in/) administratietool voor FiveM-servers. Het luistert naar specifieke servergebeurtenissen en stuurt logs naar aangewezen Discord-kanalen met behulp van webhooks. Gebeurtenissen zoals spelerwaarschuwingen, bans, whitelist-aanvragen en serverherstarts worden gelogd samen met relevante details.

### Installatie

1. Zorg ervoor dat je [txAdmin](https://txadm.in/) hebt geïnstalleerd en geconfigureerd voor je FiveM-server.
2. Kopieer het Lua-script naar de resource-map van je server.
3. Configureer de Discord webhook-URL's in het script om naar je gewenste Discord-kanalen te verwijzen.
4. Zorg ervoor dat de `es_extended` resource is geïnstalleerd en functioneel is op je server, aangezien het script hierop vertrouwt voor het ophalen van spelergegevens.
5. Voeg het script toe aan je server.cfg-bestand om ervoor te zorgen dat het wordt geladen wanneer je server start.

### Gebruik

Nadat het is geïnstalleerd en geconfigureerd, luistert het script automatisch naar specifieke txAdmin-gebeurtenissen en stuurt het overeenkomstige logs naar Discord. Je kunt het uiterlijk van de logs aanpassen door het Lua-script te wijzigen om aan je behoeften te voldoen.

### Afhankelijkheden

- [txAdmin](https://txadm.in/): Een krachtige webinterface en administratietool voor het beheren van FiveM-servers.
- [es_extended](https://github.com/esx-framework/es_extended): Een populair roleplaying-framework voor FiveM-servers, gebruikt voor het ophalen van spelergegevens.

### Credits

Dit script is gemaakt door Senna voor gebruik met Fantasy Roleplay-servers.

Raadpleeg voor gedetailleerde instructies voor gebruik en aanpassingsopties de opmerkingen in het Lua-script.
