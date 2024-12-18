static int g_scores[MAXPLAYERS + 1][MAXPLAYERS + 1];

void Client_Reset(int victim) {
    for (int attacker = 0; attacker <= MAXPLAYERS; attacker++) {
        g_scores[victim][attacker] = 0;
        g_scores[attacker][victim] = 0;
    }
}

int Client_GetScore(int victim, int attacker) {
    return g_scores[victim][attacker];
}

void Client_AddScore(int victim, int attacker) {
    g_scores[victim][attacker]++;
}
