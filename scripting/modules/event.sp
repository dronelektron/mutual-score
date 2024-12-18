void Event_Create() {
    HookEvent("player_death", Event_PlayerDeath);
}

public void Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast) {
    int victimId = event.GetInt("userid");
    int attackerId = event.GetInt("attacker");
    int victim = GetClientOfUserId(victimId);
    int attacker = GetClientOfUserId(attackerId);

    UseCase_PlayerDeath(victim, attacker);
}
