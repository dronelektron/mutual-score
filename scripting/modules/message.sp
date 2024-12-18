void Message_ShowScore(int victim, int attacker, int victimScore, int attackerScore) {
    PrintToChat(victim, "%t%t", "Prefix", "Score", victimScore, attacker, attackerScore);
}
