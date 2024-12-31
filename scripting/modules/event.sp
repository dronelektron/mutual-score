static bool g_playerDeathEnabled = false;

void Event_Create() {
    HookEvent("dod_round_start", Event_RoundStart);
    HookEvent("dod_round_win", Event_RoundWin);
}

void Event_PlayerDeathToggle(bool enabled) {
    if (g_playerDeathEnabled == enabled) {
        return;
    }

    g_playerDeathEnabled = enabled;

    if (enabled) {
        HookEvent("player_death", Event_PlayerDeath);
    } else {
        UnhookEvent("player_death", Event_PlayerDeath);
    }
}

public void Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast) {
    int victimId = event.GetInt("userid");
    int attackerId = event.GetInt("attacker");
    int victim = GetClientOfUserId(victimId);
    int attacker = GetClientOfUserId(attackerId);

    UseCase_PlayerDeath(victim, attacker);
}

public void Event_RoundStart(Event event, const char[] name, bool dontBroadcast) {
    Event_PlayerDeathToggle(EVENT_ENABLED_YES);
}

public void Event_RoundWin(Event event, const char[] name, bool dontBroadcast) {
    if (Variable_BonusRound()) {
        return;
    }

    Event_PlayerDeathToggle(EVENT_ENABLED_NO);
}
