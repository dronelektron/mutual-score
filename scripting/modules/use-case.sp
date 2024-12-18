void UseCase_PlayerDeath(int victim, int attacker) {
    if (attacker == WORLD || attacker == victim) {
        return;
    }

    Client_AddScore(victim, attacker);

    int victimScore = Client_GetScore(attacker, victim);
    int attackerScore = Client_GetScore(victim, attacker);

    Message_ShowScore(victim, attacker, victimScore, attackerScore);
    Message_ShowScore(attacker, victim, attackerScore, victimScore);
}
