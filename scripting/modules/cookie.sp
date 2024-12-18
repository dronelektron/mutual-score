static Handle g_showScoreCookie;
static bool g_showScore[MAXPLAYERS + 1];

void Cookie_Create() {
    g_showScoreCookie = RegClientCookie("mutualscore_show", "Show mutual score", CookieAccess_Private);
}

void Cookie_Load(int client) {
    char showScore[COOKIE_VALUE_SIZE];

    GetClientCookie(client, g_showScoreCookie, showScore, sizeof(showScore));

    if (IsEmptyString(showScore)) {
        SetShowScore(client, COOKIE_VALUE_ENABLED);
    } else {
        UpdateShowScore(client, showScore);
    }
}

bool Cookie_IsShowScore(int client) {
    return g_showScore[client];
}

void Cookie_ToggleValue(int client) {
    bool showScore = Cookie_IsShowScore(client);

    SetShowScore(client, showScore ? COOKIE_VALUE_DISABLED : COOKIE_VALUE_ENABLED);
}

static void SetShowScore(int client, const char[] showScore) {
    SetClientCookie(client, g_showScoreCookie, showScore);
    UpdateShowScore(client, showScore);
}

static void UpdateShowScore(int client, const char[] showScore) {
    g_showScore[client] = StrEqual(showScore, COOKIE_VALUE_ENABLED);
}

static bool IsEmptyString(const char[] text) {
    return text[0] == NULL_CHARACTER;
}
