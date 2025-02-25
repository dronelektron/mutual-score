#include <sourcemod>
#include <clientprefs>

#include "mutual-score/cookie"
#include "mutual-score/event"
#include "mutual-score/menu"
#include "mutual-score/use-case"

#include "modules/client.sp"
#include "modules/console-variable.sp"
#include "modules/cookie.sp"
#include "modules/event.sp"
#include "modules/menu.sp"
#include "modules/message.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Mutual score",
    author = "Dron-elektron",
    description = "Allows you to track the mutual score",
    version = "1.0.1",
    url = "https://github.com/dronelektron/mutual-score"
};

public void OnPluginStart() {
    Variable_Create();
    Cookie_Create();
    Event_Create();
    Menu_AddToPreferences();
    CookiesLateLoad();
    AutoExecConfig(_, "mutual-score");
    LoadTranslations("mutual-score.phrases");
}

public void OnClientConnected(int client) {
    Client_Reset(client);
}

public void OnClientCookiesCached(int client) {
    Cookie_Load(client);
}

static void CookiesLateLoad() {
    for (int i = 1; i <= MaxClients; i++) {
        if (AreClientCookiesCached(i)) {
            OnClientCookiesCached(i);
        }
    }
}
