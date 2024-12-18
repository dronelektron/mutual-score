#include <sourcemod>

#include "mutual-score/use-case"

#include "modules/client.sp"
#include "modules/event.sp"
#include "modules/message.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Mutual score",
    author = "Dron-elektron",
    description = "Allows you to track the mutual score",
    version = "0.1.0",
    url = "https://github.com/dronelektron/mutual-score"
};

public void OnPluginStart() {
    Event_Create();
    LoadTranslations("mutual-score.phrases");
}

public void OnClientConnected(int client) {
    Client_Reset(client);
}
