void UseCase_PlayerDeath(int victim, int attacker) {
    if (attacker == WORLD || attacker == victim) {
        return;
    }

    Client_AddScore(victim, attacker);

    int victimScore = Client_GetScore(attacker, victim);
    int attackerScore = Client_GetScore(victim, attacker);

    if (Cookie_IsShowScore(victim)) {
        Message_ShowScore(victim, attacker, victimScore, attackerScore);
    }

    if (Cookie_IsShowScore(attacker)) {
        Message_ShowScore(attacker, victim, attackerScore, victimScore);
    }
}
